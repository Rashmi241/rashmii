for i in `ls`
do 
fl=`expr length $i`
if [ $fl -ge 10 ]
then 
echo $i
fi
done
