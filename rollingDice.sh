diceResult=( 0 0 0 0 0 0 )
function rollDice() {
echo $(( RANDOM%6 +1 ))
}
function findMinMaxDice() {
resultDice=("$@")
max=${resultDice[1]}
maxDice=1
min=${resultDice[1]}
minDice=1
for (( count=2; count<${#resultDice[@]}; count++ ))
do
if [ $max -lt ${resultDice[$count]} ]
then
max=${resultDice[$count]}
maxDice=$count
fi
if [ $min -gt ${resultDice[$count]} ]
then
min=${resultDice[$count]}
minDice=$count
fi
done
echo "Dice with max times $maxDice and min times $minDice"
}
function checkMaxDicetimes() {
prevResult=$1
if [ $prevResult -eq 10 ]
then
isPresentMax=1
else
isPresentMax=0
fi
echo $isPresentMax
}
while ((1))
do
dice=$(rollDice)
if [[ $( checkMaxDicetimes ${diceResult[$dice]} ) -eq 1 ]]
then
break
else
diceResult[((dice))]=$((diceResult[((dice))] +1 ))
if [[ $( checkMaxDicetimes ${diceResult[$dice]} ) -eq 1 ]]
then
break
fi
fi
done
echo "dice roll times \n"
for i in "${!diceResult[@]}"
do
echo "$i:${diceResult[$i]}"
done
findMaxMinDice ${diceResult[@]}
