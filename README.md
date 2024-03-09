# PseudoMenu

Modded main menu for the game Pseudoregalia.

Main features:

1. More save slots
1. Custom map selection
1. Choose which upgrades you start with

[PseudoMenu on Nexus](https://www.nexusmods.com/pseudoregalia/mods/36)

### Building

Prerequisites:

- Unreal Engine 5.1

The core of PseudoMenu can be built using the Unreal Engine editor. Packaging the project should produce `Windows\pseudoregalia\Content\Paks\pakchunk344-Windows.pak`. For convenience, this pak chunk can be copied to your game directory using `deploy_core.bat`.

This pak chunk assumes there exist certain original assets from the game that have been copied and renamed in the following manner:

```
pseudoregalia/Content/UI/UI_HUD.uasset ->
pseudoregalia/Content/UI/UI_HUD_ORIGINAL.uasset

pseudoregalia/Content/UI/UI_HUD.uexp ->
pseudoregalia/Content/UI/UI_HUD_ORIGINAL.uexp

pseudoregalia/Content/UI/title/UI_MainMenu.uasset ->
pseudoregalia/Content/UI/title/UI_MainMenu_Copy.uasset

pseudoregalia/Content/UI/title/UI_MainMenu.uexp ->
pseudoregalia/Content/UI/title/UI_MainMenu_Copy.uexp
```

This process can be carried out automatically by running `build_and_deploy_components.bat`.
