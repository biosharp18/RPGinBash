#!/bin/bash
atk="A to attack"
dfs="D to defend"
itm="S to use item"
run="W to run"
monster=`cat ~/Documents/lol/cache|shuf -n 1`
monhp=7				#monster hp cap
slot1="Health Potion"		# 
slot2="Strength Pill"		#
slot3="Disengage"		#
slot4="Stamina Potion" 		#placeholders for items
scap=4				#Cap on strength
hp=10				#current hp


function display_hp {
./arraytest.sh <<<$hp
}
function gameover {
echo You died
echo Scores: Monsters slain ##
read -p "Play Again? (Y/n)" yesno
case $yesno in
    Y)
    ./test1.sh
    ;;
    n)
    exit
    ;;
esac
}


function display_options {
read -p "What do you do? | $atk | $dfs | $itm | $run |" input 
    case $input in
        A)
            echo You attack the $monster
            attack
        ;;
        D)
            defend
        ;;
        S)
            item
        ;;
        W)
            echo You try to run. Is it successful?
            run
        ;;
esac
}

function attack {
    echo You raise your sword, but that doesnt matter cuz this game is rng and rng ruins everything
    dmg=`shuf -i 1-$scap -n 1`
    sleep 1
    echo You dealt $dmg damage!
    monhp=$((monhp - dmg))
    echo Monster HP: $monhp/7
	if [ $monhp -le 0 ]; then
		echo $monster is dead!
		game_start
fi
	monsattack
}
function defend {
  echo You raise your shield, your defense rises dramatically
   echo The monster stikes your shield and he bounces harmlessly off
    sleep 1
    display_options
}
function item {
	echo Which item?
    echo "1) $slot1 2) $slot2 3) slot3 4) $slot4"
	read input 
	case $input in
		1) echo You drink the health potion, and you feel much better 
			hp=$((hp + 2))
		   display_hp 
		monsattack  ;;

		2) echo You drink the Strength potion, and you feel stronger now
		scap=$((scap + 3)) 
		monsattack  ;;
		3) echo you disengage- A heavenly genie appears and lifts you away from the $monster ;;
		4) ;;
esac
}
function run { 
	sleep 1
	rn=`shuf -i 1-6 -n 1`
	if [ $rn -ge 2 ]; then
		echo Successfully escaped!
		
	else
		echo You tripped when you ran...
		sleep 2
		monsattack
fi
}

function monsattack {
	echo Eneny turn!
	echo $monster struck you, 
	hp=$((hp - `shuf -i 1-4 -n 1`))
	display_hp
	display_options
	if [ $hp -le 0 ]; then
	gameover
fi

}


function game_start {
display_hp
sleep 2
echo You see a $monster!
monsattack
display_hp
display_options
}
 

game_start
