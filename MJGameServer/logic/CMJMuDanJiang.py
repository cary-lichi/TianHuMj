#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
# //  m_Type      m_Value
# //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-//
# //  0       |   中   1
# //          |
# //  1       |   一万  二万  ……  九万
# //          |
# //  2       |   一条  二条  ……  九条
# //          |
# //  3       |   一饼  二饼  ……  九饼
# //          |
# //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-//
from logic.CMJDongBei import CMJDongBei
from logic.stPAI import stPAI
from logic.stGoodInfo import stGoodInfo
from configs.config_game import config_game
## 定义牌墙类。牡丹江麻将玩法,万条饼红中，共112张
class CMJMuDanJiang(CMJDongBei):
    def __init__(self):
        CMJDongBei.__init__(self)




