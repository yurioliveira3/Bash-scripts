#File                #
-e "$file"           #True if the file exists.
-d "$file"           #True if the file exists and is a directory
-f "$file"           #True if the file exists and is a regular file
-h "$file"           #True if the file exists and is a symbolic link

#String              #
-z "$str"            #True if length of string is zero
-n "$str"            #True if length of string is non-zero
"$str" = "$str2"     #True if string $str is equal to string $str2. Not recommend for integers.
"$str" != "$str2"    #True if the strings are not equal

#Integer             #
"$int1" -eq "$int2"  #True if equals
"$int1" -ne "$int2"  #True if not equals
"$int1" -gt "$int2"  #True if int1 > int2
"$int1" -ge "$int2"  #True if int1 >= int2
"$int1" -lt "$int2"  #True if int1 < int2
"$int1" -le "$int2"  #True if int1 <= int2