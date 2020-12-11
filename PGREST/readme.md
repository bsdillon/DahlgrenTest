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
what's accessible to someone accessing the system. It
should then expose those options to the end use, with further tools
for creating a more sophisticated query.

<H3> What needs to be done </H3>

- A lot.

 - Consider outlining an actual GUI, something more intuitive to use than what's
 presently in the code base. It will likely be easier to build something more useful
 long term that way.

 - Existing code is a simple GUI. A user needs to enter the root address
of a PGREST server, and press the connect button. After doing so, the 
available paths should show up as clickable buttons.

  - A key missing feature to this tool is filtering these results. The
 additional filtering can be done via the PGREST [Tables and Views](https://postgrest.org/en/v4.1/api.html). Additional widgets will need
 to appear on the tool. There are some buttons and widgets that appear currently
 though they have stand-in functionality to be filled out later.
 
  - At present, the GUI is not given a default, or min/max sizes; it scales
 to the widgets being placed in the grid to ensure everything can be visible.
 This does not scale with large database retrievals, so it may be necessary
 to create sub-panels to display large returns with a scroll bar or similar
 to prevent the text and/or the GUI from running off screen.
 
  - existing code should likely be used as a reference rather than built upon. A 
  fresh build with more time/personnel dedicated to it could make a cleaner,
   more scalable solution for the future.
 
 <H3> Notes on anything unintuitive </H3>
 
  - Creating buttons that reference a function have unusual syntax. If you
  would normally call `somefunction()`, it instead asks you to assign
  the command as `command = somefunction` without parenthesis
  
   - When creating a button on the page dynamically (I have n-many buttons)
   you cannot assign the command a function, but rather a function object.
   The easy syntax for this is `command = (lambda: function(args))`
   
   - tkinter will not allow you to pack() some items and grid() others within
   a single panel. At present, Root is designed with grid(), with the possibility
   that pack() be used for query results.
 
 