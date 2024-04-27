@echo off

set workspace=PseudoMenu_Component_CopiedOriginals_p
set game_pak_folder="C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia\Content\Paks"

echo ### Extracting original assets from game pak...

deps\repak_cli-v0.2.1-x86_64-pc-windows-msvc\repak.exe unpack --output %workspace% ^
--include pseudoregalia/Content/UI/UI_HUD.uasset ^
--include pseudoregalia/Content/UI/UI_HUD.uexp ^
--include pseudoregalia/Content/UI/UI_OptionsMenu.uasset ^
--include pseudoregalia/Content/UI/UI_OptionsMenu.uexp ^
--include pseudoregalia/Content/UI/title/UI_MainMenu.uasset ^
--include pseudoregalia/Content/UI/title/UI_MainMenu.uexp ^
%game_pak_folder%\pseudoregalia-Windows.pak

echo ### Creating temporary workspace...

mkdir %workspace%

echo ### Renaming original assets...

deps\uedit-v1\uedit.exe ^
-i "%workspace%\pseudoregalia\Content\UI\UI_HUD.uasset" ^
-o "%workspace%\pseudoregalia\Content\UI\UI_HUD_ORIGINAL.uasset"

deps\uedit-v1\uedit.exe ^
-i "%workspace%\pseudoregalia\Content\UI\UI_OptionsMenu.uasset" ^
-o "%workspace%\pseudoregalia\Content\UI\UI_OptionsMenu_Original.uasset"

deps\uedit-v1\uedit.exe ^
-i "%workspace%\pseudoregalia\Content\UI\title\UI_MainMenu.uasset" ^
-o "%workspace%\pseudoregalia\Content\UI\title\UI_MainMenu_Copy.uasset"

del "%workspace%\pseudoregalia\Content\UI\title\UI_MainMenu.uasset"
del "%workspace%\pseudoregalia\Content\UI\title\UI_MainMenu.uexp"
del "%workspace%\pseudoregalia\Content\UI\title\UI_OptionsMenu.uasset"
del "%workspace%\pseudoregalia\Content\UI\title\UI_OptionsMenu.uexp"
del "%workspace%\pseudoregalia\Content\UI\UI_HUD.uasset"
del "%workspace%\pseudoregalia\Content\UI\UI_HUD.uexp"

echo ### Repacking renamed originals...

deps\repak_cli-v0.2.1-x86_64-pc-windows-msvc\repak.exe pack %workspace%

echo ### Moving %workspace%.pak to game pak folder...

move %workspace%.pak %game_pak_folder%

echo ### Cleaning up...

rmdir /s /q %workspace%

pause
