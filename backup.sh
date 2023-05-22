#!/usr/bin/bash
echo "Enter directory"
read dir1
echo "Enter backup directory"
read dir2
echo "Enter time to wait between every check"
read time
echo "Enter maximum number of backups"
read max
count=0
cwd=$(pwd)
function backup { date1="$(date +"%r-%d-%m-%Y")"
                  flag=0
                   ls  /$dir1 > directory-info.last
                 diff directory-info.last directory-info.new && flag=1 #if flag =1 they are the same
                if [ $flag -eq 0 ] && [ $1 -lt $max ]
               then  mkdir "$date1"
                 cp -R /"$dir1"/* /"$cwd"/"$date1" 
                  ls /"$cwd"/"$date1"  > directory-info.new
                  count=$((count+1))
                  cp -R /"$cwd"/"$date1" /"$dir2" 
                 
                  fi
                 }
    

   
   while  backup $count  ; do sleep $time ;done
  
   #home/ahmedzayan/Desktop/6714-lab2/dir
 
