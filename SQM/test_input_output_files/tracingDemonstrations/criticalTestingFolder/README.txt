Make sure that Languages is set to "Java" 
Make sure that Tools is set to "ANTLR"

"Identify the p folder of the source code" - use this folder, we want it to analyze
bubblesort.java as your test file

Click "Create"
---

Once it's done processing, go to Analysis tab on bottom left of screen
Then click on "Metrics" in top left corner
Type in anything you want as "File Name" input

Use the csv file "_bubble" for your first CSV input
Use "_ExpectedCriticalInputs" for your second CSV input

Click "Create Module Graph"

--

How To Tell if you're getting close to fixing things:
	We want our errors_output file that SQM creates in the new folder 
		to match the "bubble_errors_output" file in this criticalTestingFolder

	We want our critical_errors_output file that SQM creates in the new folder 
		to match the "expectedCriticalOutput" in this criticalTestingFolder

