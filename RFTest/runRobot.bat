@ECHO OFF
set testRoot=C:\Users\john.narkinsky\Documents\Repos\test-automation
set PYTHONPATH=%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;%PYTHONPATH%
set PATH=%PATH%;%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;.

C:\Users\john.narkinsky\Documents\Python\Scripts\robot %1