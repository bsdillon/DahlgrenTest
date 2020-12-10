<H1>Programmer's Guide</H1>

This is the programmer's guide for the PGREST project. 
It has the following sections

1. background
1. what needs to be done
2. notes on anything unintuitive

<H3> Background </H3>

The PGREST project uses [PostgREST](https://postgrest.org/en/v4.1/intro.html) as a server that turns a PGSQL
database into a RESTful API. The tool being built needs to be able
to connect to a PGREST server, parse the exposed API and gather
what queries are available to someone accessing the system. It
should then expose those options to the end use, with further tools
for creating a more robust query.

<H3> What needs to be done </H3>

 - Existing code is a simple GUI. A user needs to enter the root address
of a PGREST server, and press the connect button. After doing so, the 
available paths should show up as clickable buttons.

  - A key missing feature to this tool is filtering these results. The
 additional filtering can be done via the [PostgREST API](https://postgrest.org/en/v4.1/api.html). Additional widgets will need
 to appear on the tool, possibly as a function of the "display" function.
 
  - At present, the GUI is not given a default, or min/max sizes; it scales
 to the widgets being placed in the grid to ensure everything can be visible.
 This does not scale with large database retrievals, so it may be necessary
 to create sub-panels to display more robust returns with a scroll bar or similar
 to prevent the text from running off screen.
 
  - This entire solution may not scale well into the future. It may be that the 
 existing GUI solution
 
 <H3> Notes on anything unintuitive </H3>
 
  - Creating buttons that reference a function have unusual syntax. If you
  would normally call `somefunction()`, it instead asks you to assign
  the command as `command = somefunction` without parenthesis
  
   - When creating a button on the page dynamically (I have n-many buttons)
   you cannot assign the command a function, but rather a function object.
   The easy syntax for this is `command = (lambda: function(args))`
 
 