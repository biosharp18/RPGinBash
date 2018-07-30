#!/bin/bash 
read -p "HP out of 10" yourhp
num=$((yourhp * 2))
counter=1
while [ $counter -le 20 ]; 
do
declare -a hp[$counter]
hp[$counter]=" "
let "counter++"
done
inc=1
while [ $inc -le $num ]; 
do
hp[$inc]="#"
let "inc++"
done
echo "HP |${hp[1]}${hp[2]}${hp[3]}${hp[4]}${hp[5]}${hp[6]}${hp[7]}${hp[8]}${hp[9]}${hp[10]}${hp[11]}${hp[12]}${hp[13]}${hp[14]}${hp[15]}${hp[16]}${hp[17]}${hp[18]}${hp[19]}${hp[20]}| $((yourhp * 10))% "
