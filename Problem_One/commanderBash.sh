#!/bin/bash

# Matthew Dingman
# commanderBash Script

# This script invokes the led-hw4.sh script 5 times, running through all of its possible inputs. It turns the LED on, turns the LED off, checks the status of the LED, flashes the LED, and blinks the LED 3 times.

# Example invocation
# ./commanderBash.sh

# You will need to put in debian password to run this, as flash requires sudo

echo "Invocation 1 (on)"
echo
./led-hw4.sh on
echo
sleep 4 # Delay so the changes can be seen

echo "Invocation 2 (off)"
echo
./led-hw4.sh off
echo
sleep 4

echo "Invocation 3 (status)"
echo
./led-hw4.sh status
echo
sleep 4

echo "Invocation 4 (flash)"
echo
sudo ./led-hw4.sh flash
echo
sleep 4

echo "Invocation 5 (blink 3 times)"
echo
./led-hw4.sh blink 3
echo
sleep 4

echo "End of Invocations"
