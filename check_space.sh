 #!/bin/bash

 #check free space and keeping only 7 files
 TIMESTAMP=$(date +%Y%m%d%H%M%S)

 file_new=`ls -t /usr/local/bckp/storage/storage*.tar.gz | head -n1`
 file_old=`ls -t /usr/local/bckp/storage/storage*.tar.gz | tail -n1`
 files_count=`ls -f /usr/local/bckp/storage/storage*.tar.gz | wc -l`
 count=`df -h | awk '{print $5}' | sed -n 2p | sed '{s/.$//;}'`
 min=88

 if [ "$file_new" != "$file_old" ]
 then
     if [ "$count" -ge "$min"  ]
     then
         echo "The disk is full of more than 88%, Delete Old Files...."
         rm $file_old
         echo "File $file_old Delete"
     elif [ "$files_count" -ge "6" ]
     then
         echo "More than 4 storage archive files detected, Delete Old Files...."
                 rm $file_old
                 echo "File $file_old Delete"
     fi
 fi
