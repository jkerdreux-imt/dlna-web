
import fs
from fs.path import iteratepath

from logging import getLogger

logger = getLogger(__name__)

def extract_dlna(dlna,path):
        _path = dlna.validatepath(path)

        pathiter = iteratepath(_path)
        devname = pathiter.pop(0)
        if not devname in dlna.devices:
            return {}
        device = dlna.devices[devname]
        parent = dlna.parseall(device, 0)

        for entry in pathiter:
            if not entry in parent:
                return {}
            parent = dlna.parseall(device, parent[entry]['id'])
        return parent

def start():
    logger.info("Starting DLNA search")
    return fs.open_fs('dlna:///')


if __name__ == '__main__':
    import sys
    import pprint
    dlna = start()
    from config import SERVER_PATH
    url = SERVER_PATH + sys.argv[1]
    pprint.pprint(extract_dlna(dlna,url))

