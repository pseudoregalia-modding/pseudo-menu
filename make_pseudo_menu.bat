set game_folder=C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia

call cook.bat
make_pak.py --asset-list toggle_vis_button_v000.rsp
make_pak.py --asset-list pseudo_menu.rsp
copy toggle_vis_button_v000_p.pak "%game_folder%\Content\Paks\"
copy pseudo_menu_p.pak "%game_folder%\Content\Paks\"
call "%game_folder%\Binaries\Win64\pseudoregalia-Win64-Shipping.exe"
pause
