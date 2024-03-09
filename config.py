import os
from os.path import dirname, isdir, isfile
import sys
import json
import pprint


def make_link(src, dst):
    src = os.path.expanduser(src)
    src = os.path.abspath(src)
    dst = os.path.expanduser(dst)
    dst = os.path.abspath(dst)

    print("{}\n{}".format(src, dst))

    if not os.path.exists(src):
        print("src path {} not exist".format(src))
        return
    
    def path_is_file(fpath):
        ext = os.path.splitext(dst)
        if len(ext) and ext[-1] == '':
            return False
        return True

    dir_name = dst
    dir_name = os.path.dirname(dst)
    # if path_is_file(dst):
    #     dir_name = os.path.dirname(dst)

    if not os.path.exists(dir_name):
        print("dir {} not exist".format(dir_name))
        os.mkdir(dir_name)

    try:
        print("{} -> {}".format(src, dst))
        # os.system("ln -s {} {}".format(src, dst))
        os.symlink(src, dst)
    except Exception as e:
        return

    
def main():
    with open("./config.json", 'r') as f:
        cfg = json.load(f)
    # print(cfg)
    for item in cfg:
        print(item["name"])
        if isinstance(item["src"], list):
            for src, dst in zip(item["src"], item["dst"]):
                make_link(src, dst)
        else:
            make_link(item["src"], item["dst"])
            
    pass


if __name__ == "__main__":
    main()
