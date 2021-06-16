#!/bin/sh

# This script is for running a slew of programs that should have relatively
# short packet lives in order to test whether the spa program will pick them
# up and associate them. Unfortunately, the unpredictability of other network
# traffic makes it somewhat difficult to be able to automatically check
# whether the packets are picked up and associated

# INSTRUCTIONS: Run this script while spa is running in another shell, and
# inspect the pcapng output.

curl www.google.com
wget www.google.com
curl www.stackoverflow.com
