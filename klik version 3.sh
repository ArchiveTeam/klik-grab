#!/bin/sh

if [ $counter -ge $maxdump ]
then
startnum=$1
else
startnum=$((0))
fi 
 
maxdump=$((900001)) #The number of urls to dump starting from startnum. 1 means 1 url.

names=( 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) 

setsize=${#names[@]}

astart=$((($startnum/$setsize/$setsize/$setsize/$setsize)%$setsize))
bstart=$((($startnum/$setsize/$setsize/$setsize)%$setsize))
cstart=$((($startnum/$setsize/$setsize)%$setsize))
dstart=$((($startnum/$setsize)%$setsize))
estart=$(($startnum%$setsize))





baseurl="http://klik.me/"

counter=0 #This should stay 0

#for (( i = 0 ; i < ${#names[@]} ; i++ )) do
#echo ${names[$i]}
#
#done
#
#echo $setsize

for  (( avar = astart ; avar < ${#names[@]} ; avar++ )) do
for  (( bvar = bstart ; bvar < ${#names[@]} ; bvar++ )) do
for  (( cvar = cstart ; cvar < ${#names[@]} ; cvar++ )) do
for  (( dvar = dstart ; dvar < ${#names[@]} ; dvar++ )) do
for  (( evar = estart ; evar < ${#names[@]} ; evar++ )) do

output="$baseurl${names[avar]}${names[bvar]]}${names[cvar]}${names[dvar]}${names[evar]}"
echo $output
#wget -m -erobots=off -p --max-redirect=0 $output
counter=$(($counter+1))
if [ $counter -ge $maxdump ]
then
break
fi 
done
if [ $counter -ge $maxdump ]
then
break
fi 
done
if [ $counter -ge $maxdump ]
then
break
fi 
done
if [ $counter -ge $maxdump ]
then
break
fi 
done
if [ $counter -ge $maxdump ]
then
break
fi 
done

echo "Last dumped was $(($startnum+$counter-1))"