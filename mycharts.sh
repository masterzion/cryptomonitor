#!/bin/bash
COINLIST="BTC ETH SOL CRO PENDLE LDO DOG RSIC ILV ATLAS BTC"

#startup
#https://raspberrypi.stackexchange.com/questions/78991/running-a-script-after-an-internet-connection-is-established
# run with your own api key for higher requests limits
#export CRYPTOCOMPARE_API_KEY=your_api_key
printf "\033c" > /dev/tty0
printf "Starting script: " > /dev/tty0
hostname -I > /dev/tty0
sleep 10
printf "\033c" > /dev/tty0
sleep 1
printf "\033c" > /dev/tty0

sleep_check () {
    now=$(date +"%H")
    if [ "$now" -eq 1 ]; then
        printf "\033c" > /dev/tty0
        printf "Sleep Mode" > /dev/tty0
        sleep 30
        printf "\033c" > /dev/tty0
        sleep 14400
    fi
}

while true
do
    sleep_check
    for coin in $COINLIST; do
        sleep 5
        bitcoin-chart-cli --disable-legend  --coin $coin -d 90 -w 48 -h 10 -ti RSI  > /dev/tty0
    done
    sleep 1800
    printf "\033c" > /dev/tty0
done

