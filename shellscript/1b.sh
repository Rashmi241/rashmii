if [ $# -ne 0 ]
then
p= `echo $i | tr "/" " "`
for i in $p
do
mkdir $i
cd $i
done
echo "all the directories created"
else
echo "please enter a parameter"
fi

