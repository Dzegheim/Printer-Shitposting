#!/bin/bash

START=1
END=100
BLANK="\e[0m "
FULL="\e[104m "
function BAR {
    let PROGRESS=(${1}*100/${2}*100)/100
    let DONE=(${PROGRESS}*4)/10
    let LEFT=40-$DONE
    FILL=$(printf "%${DONE}s")
    EMPTY=$(printf "%${LEFT}s")
    printf "\r${3} \e[94m|${FILL// /$FULL}${EMPTY// /$BLANK}\e[0m\e[94m| ${PROGRESS}%%\e[0m"
}

WSq="\e[107m   "
BSq="\e[40m   "
Reset="\e[0m"
Lines=(
    "$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$BSq$BSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$WSq$WSq$WSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$BSq$WSq$WSq$WSq$WSq$Reset"
    "$WSq$BSq$BSq$BSq$BSq$WSq$WSq$BSq$BSq$BSq$BSq$WSq$WSq$BSq$BSq$BSq$BSq$WSq$Reset"
    "$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$WSq$Reset"
    )

trap '' 2 
echo -e "\e[5mHuman, I require \e[1m\e[35mMagenta\e[0m\e[5m.\e[0m"
sleep 2
printf "Provide \e[1m\e[35mMagenta\e[0m?"
read -r -p " [y/N] " RESP
case "$RESP" in
    [yY][eE][sS]|[yY]) 
        sleep 1
        for I in {0..10}
        do
            echo -e "${Lines[0]}"
        done
        printf "$(tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1;tput cuu1)"
        for I in {0..10}
        do
            printf "$(tput el)"
            echo -e "${Lines[$I]}"
            sleep 0.5
        done
        echo -e "This script is brought to you by the \e[1m\e[4mHP DeskJet Series All-in-One Wireless Color Inkjet Printer - 3-in-1 Print, Scan, Copy for Home Business Office, Up to 1200 dpi, Dual-Band WiFi, Bluetooth, Icon LCD display, White, 5 Feet Printer Cable\e[0m gang."
        ;;
    *)
        echo -e "You fool, you have incurred in the wrath of the printer. Now I will \e[1m\e[31mupdate my drivers\e[0m and there is nothing you can do to stop me."
        for I in $(seq ${START} ${END})
        do
            sleep $(($RANDOM % 5))
            BAR ${I} ${END} "Updating drivers..."
        done
        echo -e "\nDone. Now don't forget what happened, and next time provide me with \e[1m\e[35mMagenta\e[0m."
        ;;
esac
trap 2