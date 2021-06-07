var testRuns = {
testRun0 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Pass", Message: "" },
  { Test: "Textbox Test", Status: "Pass", Message: "" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Pass", Message:" "}
],

testRun1 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Fail", Message: "Refused to run" },
  { Test: "Textbox Test", Status: "Fail", Message: "Just didn't work" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Fail", Message:" "}
],


testRun2 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Fail", Message: "" },
  { Test: "Textbox Test", Status: "Pass", Message: "Just didn't work" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Pass", Message:"Running"}
],

testRun3 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Running", Message: " " },
  { Test: "Textbox Test", Status: "Not Run", Message: "" },
  { Test: "Date Test", Status: "Not Run", Message: " " },
  { Test: "Input Test", Status: "Not Run", Message:" "}
],
};
