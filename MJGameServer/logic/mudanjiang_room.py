#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
from logic.dongbei_room import DongBei_Room
from configs.config_game import config_game
from protobuf import msg_pb2
from tools.utils import Utils
from logic.CMJDongBeiManager import CMJDongBeiManage
## 牡丹江房间
class MuDanJiang_Room(DongBei_Room):
    def __init__(self):
        DongBei_Room.__init__(self)