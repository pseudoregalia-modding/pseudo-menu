set game_folder=C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia

call cook.bat
make_pak.py --asset-list custom_options_framework.rsp
copy custom_options_framework_p.pak "%game_folder%\Content\Paks\"
call "%game_folder%\Binaries\Win64\pseudoregalia-Win64-Shipping.exe"
pause
