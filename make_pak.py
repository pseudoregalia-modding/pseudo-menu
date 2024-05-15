import argparse
import os
import shutil
import subprocess
import sys
import tempfile

_UNREAL_PAK_EXE = r'C:\Program Files\Epic Games\UE_5.1\Engine\Binaries\Win64\UnrealPak.exe'
_REPAK_EXE = r'deps\repak_cli-v0.2.1-x86_64-pc-windows-msvc\repak.exe'
_UEDIT_EXE = r'deps\uedit-v1\uedit.exe'
_ORIGINAL_PAK_PATH = r'C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia\Content\Paks\pseudoregalia-Windows.pak'

def extract(pak_path, asset_path, out_path):
    subprocess.run([_REPAK_EXE, 'unpack', '--output', out_path, '--include', asset_path + '.uasset', '--include', asset_path + '.uexp', pak_path], check=True)

def rename(a, b):
    subprocess.run([_UEDIT_EXE, '-i', a + '.uasset', '-o', b + '.uasset'], check=True)

def make_pak(pak_name, asset_list, output_filename):
    def write_line(f, src, dst):
        f.write('"')
        f.write(src)
        f.write('" "')
        f.write(dst)
        f.write('"\n')

    with tempfile.TemporaryDirectory() as tmp_dir:
        rsp_path = os.path.join(tmp_dir, 'tmp.rsp')
        with open(rsp_path, 'w') as f:
            for asset_path in asset_list:
                t = tuple(map(lambda s: s.strip(), asset_path.split('<')))
                assert(len(t) > 0)
                src = os.path.abspath(os.path.join('Saved/Cooked/Windows/pseudoregalia/Content', t[0]))
                dst = f'../../../pseudoregalia/Content/{t[0]}'
                if len(t) > 1:
                    original_path = os.path.join(tmp_dir, 'pseudoregalia/Content', t[1])
                    renamed_original_path = os.path.join(tmp_dir, 'pseudoregalia/Content', t[0])
                    extract(_ORIGINAL_PAK_PATH, f'pseudoregalia/Content/{t[1]}', tmp_dir)
                    rename(original_path, renamed_original_path)
                    src = os.path.abspath(renamed_original_path)

                write_line(f, src + '.uasset', dst + '.uasset')
                write_line(f, src + '.uexp', dst + '.uexp')

        with open(rsp_path) as f:
            for line in f.readlines():
                print(line)
        subprocess.run([_UNREAL_PAK_EXE, os.path.abspath(output_filename), '-Create={}'.format(os.path.abspath(rsp_path)), '-compress'], check=True)

def main():
    parser = argparse.ArgumentParser(description='Cook and package assets')
    parser.add_argument('-i', '--asset-list', dest='asset_list_filename', required=True)
    parser.add_argument('-o', '--output', dest='output_filename', required=True)
    args = parser.parse_args(sys.argv[1:])
    pak_name = os.path.splitext(os.path.basename(args.asset_list_filename))[0]
    f = open(args.asset_list_filename)
    asset_list = tuple(map(lambda l: l.rstrip('\n'), f.readlines()))
    f.close()
    make_pak(pak_name, asset_list, args.output_filename)

if __name__ == '__main__':
    main()
