#!/bin/bash -x

declare -A dice
for((count=1; count<=6; count++))
do
	dice["number_"$count]=0
done
maximum=0;
minimum=0;
while [ $maximum -ne 10 ]
do
	result=$((RANDOM%6+1))
	dice["number_"$result]=$((${dice["number_"$result]}+1))
	 maximum=`printf '%s\n' "${dice[@]}" | sort -nr | head -1`
done
 minimum=`printf '%s\n' "${dice[@]}" | sort -n | head -1`
for i in ${!dice[@]}
do
if [ "${dice[$i]}" -eq $maximum ]
then
	echo "maximum rolls are of" $i
elif [ "${dice[$i]}" -eq $minimum ]
then
	echo "minimum rolls are of" $i
fi
done
echo ${dice[@]}
echo ${!dice[@]}
