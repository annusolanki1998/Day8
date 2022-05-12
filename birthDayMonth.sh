declare -A same_month
divisor=$(( 12 ))
select_month=$(( 1+($RANDOM%divisor) ))
case $select_month in 
1)
month="January"
;;
2)
month="February"
;;
3)
month="March"
;;
4)
month="April"
;;
5)
month="May"
;;
6)
month="June"
;;
7)
month="July"
;;
8)
month="August"
;;
9)
month="September"
;;
10)
month="October"
;;
11)
month="November"
;;
12)
month="December"
;;
esac
echo "Individuals having birthday months $month are"
j=0
for (( i=0; i<=50; i++ ))
do
divisor1=$(( 12 ))
birthday_month=$(( 1+($RANDOM%divisor1) ))
if (( $birthday_month==$select_month ))
then
over1=1
while (( $over1!=0 ))
do
same_month[$j]="individual "$i""
j=$(( $j+1 ))
over1=0
done
fi
done
echo ${same_month[@]}
