This file contains all the known bugs with running CPP tests on SQM using ANTLR as of 08/11/2022.
All file references are in the "various_cpp_tests" folder.


USER DEFINED LITERALS [userDefinedLiterals\userDefinedLiterals.cpp]:

In CPP, we can create user defined literals unlike in Java where we can't. This is problematic 
as function LiteralModifier goes through the literals and expects a predefined literal
(something in ApprovedLiterals). One way we can implement these custom literals is to add a
literal "UserDefLiteral" to ApprovedLiterals and if the incoming literal doesn't match our
predefined literals, just make it a custom literal.

A much harder way to implement these literals is to treat the literal suffix as a unary operator,
but this will likely cause a million bugs everywhere.

---

SCOPE RESOLUTION OPERATORS [ScopeResolutionSmallTest\ScopeResolutionSmallTest.cpp]:

In CPP, we have scope resolution operators ('::'). These are mostly implemented, however there
do exist some bugs still. Inside the DefinedMember.cs, inside of 'CreateDefinedMember' there
is an explanation of the problem.


---

ASSERT STATEMENTS [cLibrary\cassert\cAssert.cpp]

I think this is an issue either in the tokens that function decomposeToken is receiving in ANTRTool.cs
or how the preprocessed cpp file is created. This is not an isolated case of this occuring,
after fixing this bug try running a test against the entire cLibrary folder.

---

LAMBDA EXPRESSIONS [lambdaExpression\lambdaExpression.cpp]

Lambda expressions exist in c++11, so they need to be implemented. Lambda expressions were not
implemented in Java since SQM deals with Java 7 and lambda expressions are Java 8. I'm not 
entirely sure where in ANTLRtool this should be implemented since there are so many different 
small cases to be dealt with.

---

STD::PAIR [ArrayInitializers\arrayInitializers.cpp]

Pairs are not yet implemented in CPP. Not sure where to handle this, maybe in the same location
as arrays in ANTLRtool.

