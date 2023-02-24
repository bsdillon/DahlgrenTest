@ECHO OFF
set testRoot=C:\Users\Benny\Documents\github\DahlgrenTest\RFTest
set PYTHONPATH=%testRoot%;%testRoot%\widgets\;%testRoot%\OQE\
REM ECHO %PYTHONPATH%

robot %1