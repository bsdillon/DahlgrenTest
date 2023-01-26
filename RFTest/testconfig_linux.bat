# Start the sikuli server; pause for compilation
cd SikuliEntry
javaserver.bat &
cd ..
sleep 3

# Start the test GUI; pause to wait for gui launch
cd validation
python3 testgui.py &
cd ..
sleep 3

# Run the RFW test
.\runRobot.bat ./validation/test.robot
