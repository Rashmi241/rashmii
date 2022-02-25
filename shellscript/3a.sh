if [ -e $1 ]
then
set -- `ls -ld $1`
echo "Permissions are:$1"
echo "file link count is $2 "
echo "user name $3 "
echo "Group name $4 "
echo "file size $5"
echo "file modification is done $6 $7 at $8" 
echo "file name $9 "
else
echo "file doesn't exist"
fi

