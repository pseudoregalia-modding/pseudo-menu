set game_folder=C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia

make_pak.py --asset-list asset_list.txt --output "%game_folder%\Content\Paks\PseudoMenu_p.pak"
REM call "%game_folder%\Binaries\Win64\pseudoregalia-Win64-Shipping.exe"
pause
