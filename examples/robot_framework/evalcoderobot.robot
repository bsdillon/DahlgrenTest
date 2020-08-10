*** Settings ***
# This imports the py file which contains the keywords used in
# Lauren's Selenium example.
Library	EvalCode.py
*** Test Cases ***
# These are each short test cases that use the keywords from
# the .py file imported above. They can be used in any order at
# by just typing the keyword and adding a prarmeter if needed.
test rand
	rand
test slider
	Slider	35
	Slider	32
	Slider	50
test date
	date	"07/02/2020"
test button
	buttons
test colors
	colors
test panel
	panel
test radio
	radio
test textbar
	textbar
test dropdownmenu
	menudropdown
test rightclick
	rightclick
test multiple
	date	"07/01/2020"
	slider	2
