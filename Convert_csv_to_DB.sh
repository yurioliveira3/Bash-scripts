#!/bin/bash
echo -n -e "|#########################  CSV to MySql DB Creator  ###############################|\n-\nConexão com banco de dados:\n"
# DB connection
_dbi="test_csv"
read -p "DataBase name: " -e -i "$_dbi" input
_db="${input:-$_dbi}"

_db_useri="test"
read -p "User: " -e -i "$_db_useri" input
_db_user="${input:-$_db_useri}"

_db_passwordi="1234" #not recommended
read -p "Passwd for user $_db_user: " -e -i "$_db_passwordi" input
_db_password="${input:-$_db_passwordi}"

_db_hosti="localhost"
read -p "Host: " -e -i "$_db_hosti" input
_db_host="${input:-$_db_hosti}"

# CSV Path location
_csv_directoryi="$(pwd)"
read -p "CSV Path: " -e -i "$_csv_directoryi" input
_csv_directory="${input:-$_csv_directoryi}"

cd $_csv_directory

# Vector with files
_csv=(*.csv )
# iterate in 
for file in "${_csv[@]}"; do
        echo "Fixing $file"
        CHARSET="$(file -bi "$file"|awk -F "=" '{print $2}')"
        if [ "$CHARSET" != utf-8 ]; then
                if [ "$CHARSET" = binary ]; then #Force if binary
                        iconv -f iso-8859-14 -t utf8//TRANSLIT "$file" -o "$file.tmp" #file.tmp is to avoid bus erros
                        mv $file.tmp $file

                elif [ "$CHARSET" = unknown-8bit ]; then #Force if unknown
                        iconv -f iso-8859-14 -t utf8//TRANSLIT "$file" -o "$file.tmp" #file.tmp is to avoid bus erros
                        mv $file.tmp $file

                else
                        iconv -f "$CHARSET" -t utf8//TRANSLIT "$file" -o "$file.tmp" #file.tmp is to avoid bus erros
                        mv $file.tmp $file

                fi
        fi

        #fix special characters
        sed -i 's/^M$//' $file
        sed -i '1s/^\xEF\xBB\xBF//' $file
done

echo -n -e "-\nConversion Completed!\n-\nCreating BD: $_db"
mysql -u$_db_user -p$_db_password -h$_db_host -e "DROP DATABASE IF EXISTS $_db;";
mysql -u$_db_user -p$_db_password -h$_db_host -e "CREATE DATABASE IF NOT EXISTS $_db CHARACTER SET utf8 COLLATE utf8_general_ci;";

# iterate in 
for _csv in ${_csv[@]}; do
        # remove .csv of files
        _csv_file_extensionless=`echo $_csv | sed 's/\(.*\)\..*/\1/'`

        # table name = csv_file
        _table_name="${_csv_file_extensionless}"

        # get header of CSV file
        _header_columns=`head -1 $_csv_directory/$_csv | tr ',' '\n' | sed 's/^"//' | sed 's/"$//' | sed 's/ /_/g'`
        _header_columns_string=`head -1 $_csv_directory/$_csv | sed 's/ /_/g' | sed 's/"//g'`

        # Create table
        echo "nCreating table $_table_name"
        mysql -u$_db_user -p$_db_password -h$_db_host $_db -e "CREATE TABLE IF NOT EXISTS $_table_name(temp int NOT NULL auto_increment,PRIMARY KEY (temp)) ENGINE=MyISAM DEFAULT CHARSET=utf8;"
        
        # percorrer colunas de cabeçalho
        for _header in ${_header_columns[@]}; do
        echo "Add column: $_header"
        mysql -u $_db_user -p$_db_password -h$_db_host $_db --execute="ALTER TABLE \`$_table_name\` ADD COLUMN \`$_header\` TEXT"
        done

        # remove coluna temporária
        mysql -u $_db_user -p$_db_password -h$_db_host $_db --execute="ALTER TABLE \`$_table_name\` DROP COLUMN temp"

        # importar csv para o mysql
        echo "Importing $_csv"
        mysqlimport --local --compress --verbose --fields-enclosed-by='"' --fields-terminated-by=',' --lines-terminated-by="\n" --ignore-lines='1' --columns=$_header_columns_string -u $_db_user -p$_db_password -h$_db_host $_db $_csv_directory/$_csv
done

echo -n -e "\n\nBD: $_db created!"

exit
