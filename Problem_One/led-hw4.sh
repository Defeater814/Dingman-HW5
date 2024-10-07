#!/bin/bash
# led-hw4 Script

# This script will turn on or off the usr3 LED attached to the Beaglebone Black. Two command line arguments are taken for this script, the first being the action the LED will take (on, off, flash, status, or blink)
# and the second argument being n, or the number of times the blink command will blink. 

# Example invocations:
# ./led-hw4 on

# ./led-hw4 off

# ./led-hw4 flash

# ./led-hw4 status

# ./led-hw4 blink 5

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash, blink, or status  \n e.g. bashLED on "
  echo -e " if blink is used, argument 2 is how many times it will blink "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
elif [ "$1" == "blink" ]; then
  echo "Blinking the LED $2 times"
  removeTrigger
  for i in $(seq 1 $2);
  do
	  echo "1" >> "$LED3_PATH/brightness"
	  sleep 1
	  echo "0" >> "$LED3_PATH/brightness"
	  sleep 1
  done
fi
echo "End of the LED Bash Script"
