set -- `who`
g=$1
t=$4
set -- `echo $t | tr ":" " "`
h=$1
echo "user logged in terminal at : $g"
if [ $h -ge 4 ] && [ $h -lt 12 ]
then
echo "good morning mr/ms $g"
elif [ $h -ge 12 ] && [ $h -lt 16 ]
then
echo "good afternoon mr/ms $g"
elif [ $h -ge 16 ] && [ $h -lt 19 ]
then
echo "good evening mr/ms $g"
else
echo "good night mr/ms $g"
fi
