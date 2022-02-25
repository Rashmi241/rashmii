echo -n "enter the first file: "
read file1
if [ -e $file1 ]
then
set -- `ls -ld $file1`
perm1=$1
else 
echo "file does not exist" 
exist 
fi
echo -n "enter the second file: "
read file2
if [ -e $file2 ]
then
set -- `ls -ld $file2`
perm2=$1
else 
echo "file does not exist" 
exit 
fi
if [ "$perm1" = "$perm2" ]
then
echo "$file2 permission are identical"
echo "$file1 permission is $perm1"
echo "$file2 permission is $perm2"
fi
