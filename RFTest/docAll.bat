@ECHO OFF
set testRoot=C:\Users\Benny\Documents\github\DahlgrenTest\RFTest
set PYTHONPATH=%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;%PYTHONPATH%
set PATH=%PATH%;%testRoot%\widgets\;%testRoot%\OQE;%testRoot%\calculatorTest;.

libdoc -F ROBOT ./OQE/output.py Doc/output.html
libdoc -F ROBOT ./OQE/imagelibrary.py Doc/imagelibrary.html
libdoc -F ROBOT ./OQE/seleniumlibrary.py Doc/seleniumlibrary.html
libdoc -F ROBOT ./OQE/textreader.py Doc/textreader.html
libdoc -F ROBOT ./OQE/DataExtraction.resource Doc/dataextraction.html
libdoc -F ROBOT ./widgets/genericwindow.py Doc/genericwindow.html
libdoc -F ROBOT ./widgets/genericwindow.py Doc/window.html
