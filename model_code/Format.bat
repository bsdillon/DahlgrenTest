@echo off
setlocal enabledelayedexpansion
REM get file
set /p fileIn="File to format:"

set debug=0

set pLevel=0
FOR /F "tokens=*" %%l IN (%fileIn%) DO (
  set str=%%l

  FOR /F "tokens=* delims= " %%a IN ("!str!") DO (
    set str=%%a
  )

  FOR /l %%a IN (1,1,) DO (
    IF "!str:~-1!"==" " (
      set str=!str:~0,-1!
    )
  )

  set lead1=!str:~0,1!
  set lead=!str:~0,2!
  set post=!str:~-2!
  set str2=!str:~2,-1!
  set double=0

  FOR /f "tokens=2 delims=<" %%t in ("!str2!") DO (
    if !debug!==1 ( echo "DOUBLE %%t" )
    set /A double=!double!+1
  )

  REM decrease the pLevel when a tag closes
  if "!lead!"=="</" (
    set /A pLevel=!pLevel!-1
    if !debug!==1 ( echo "close tag Decreasing Level=!pLevel!" )
  )

  REM count down from pLevel
  set pad=  
  FOR /L %%a IN (1, 1, !pLevel!) DO (
    set str=!pad!!str!
    REM echo "%%a !str!"
  ) 

  REM if the tag is not a closing tag
  if NOT "!lead!"=="</" (
    REM and tag is not unary
    if NOT "!post!"=="/>" (
      REM double tag as in <a>other</a>
      if !double!==0 (
        REM and tag is open XML
        if "!lead1!"=="<" (
          REM increase level
          set /A pLevel=!pLevel!+1
          if !debug!==1 ( echo "new tag Increasing Level=!pLevel!")
        )
      ) else (
        if !debug!==1 ( echo "DOUBLE")
      )
    )
  )

  REM any broken tag with a second </ should decrease the level
  if NOT "!lead1!"=="<" (
    if !double!==1 (
      set /A pLevel=!pLevel!-1
      if !debug!==1 ( echo "broken tag; end of double Decreasing Level=!pLevel!")
    )

    if "!post!"=="/>" (
      set /A pLevel=!pLevel!-1
      if !debug!==1 ( echo "broken tag; end of unary Decreasing Level=!pLevel!")
    )
  )

  echo !str!>>./temp.txt
)

del !fileIn!
ren temp.txt !fileIn!