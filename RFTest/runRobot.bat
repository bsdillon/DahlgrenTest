@ECHO OFF
set testRoot=C:\Users\Benny\Documents\github\DahlgrenTest\RFTest
set PYTHONPATH=%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;%PYTHONPATH%
set PATH=%PATH%;%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;.

robot %1