REM Start the sikuli server; pause for compilation
cd SikuliEntry
START "validation" javaserver.bat
cd ..
timeout /t 3

REM Start the test GUI; pause to wait for gui launch
cd validation
START python testgui.py
cd ..
timeout /t 3

REM Run the RFW test
.\runRobot.bat ./validation/test.robot
