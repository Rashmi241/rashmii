BEGIN{
	OFS=" "
}
{
	split($0,date,"-")
	if(date[2]>=1 && date[2]<=12){

		if(date[2]==1 && date[1]>=1 && date[1]<=31){
			printf "%s january %d ",date[1],date[3]
			exit
		}
		else if(date[2]==2 && date[1]>=1 && date[1]<=29){
			printf "%s february %d",date[1],date[3]
		exit
	}
	else if(date[2]==3 && date[1]>=1 && date[1]<=31){
		printf "%s march %d",date[1],date[3]
	exit
}
else if(date[2]==4 && date[1]>=1 && date[1]<=30){
	printf " %s April %d ",date[1],date[3]
exit
}
else if(date[2]==5 && date[1]>=1 && date[1]<=31){
	printf "%s may %d",date[1],date[3]
exit
}
else if(date[2]==6 && date[1]>=1 && date[1]<=30){
	printf "%s june %d",date[1],date[3]
exit
}
else if(date[2]==7 && date[1]>=1 && date[1]<=31){
	printf "%s july %d",date[1],date[3]
exit
}
else if(date[2]==8 && date[1]>=1 && date[1]<=30){
	printf "%s august %d",date[1],date[3]
exit
}
else if(date[2]==9 && date[1]>=1 && date[1]<=31){
	printf "%s september %d",date[1],date[3]
exit
}
else if(date[2]==10 && date[1]>=1 && date[1]<=30){
	printf "%s october %d\n",date[1],date[3]
exit
}
else if(date[2]==11 && date[1]>=1 && date[1]<=31){
	printf "%s november %d\n",date[1],date[3]
exit
}
else if(date[2]==12 && date[1]>=1 && date[1]<=30){
	printf "%s december %d\n",date[1],date[3]
exit 
}
else {
	print "invalid date\n"
exit
}

}
else{
	print "invalid month\n"
exit
}
}


