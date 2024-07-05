@echo off

REM Point this to your Unreal Engine installation. (You probably don't have to modify this.)
set run_uat=C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat

call "%run_uat%" BuildCookRun -project="%~dp0\pseudoregalia.uproject" -platform=Win64 -cook -stage

pause
