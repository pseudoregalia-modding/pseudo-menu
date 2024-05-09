@echo off

REM Set this to be the folder containing the .uproject file.
set uproject_folder=C:\Users\A\Documents\Unreal Projects\PseudoMenuProject

REM Point this to your Unreal Engine installation. (You probably don't have to modify this.)
set run_uat=C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat

call "%run_uat%" BuildCookRun -project="%uproject_folder%\pseudoregalia.uproject" -platform=Win64 -cook -stage
