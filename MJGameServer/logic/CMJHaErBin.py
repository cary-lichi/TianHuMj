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
## 定义牌墙类。哈尔滨麻将玩法,万条饼红中，共112张
class CMJHaErBin(CMJDongBei):
    def __init__(self):
        CMJDongBei.__init__(self)


# 可选玩法
    # 听牌后摸到红中可胡牌，算摸宝
    def CheckHuZhongBao(self):
        return self.CheckWinOp(self.GetOPByName('hongzhongbao'))

    # 单边胡,12 -3  7-89 算，1-23-4不算
    def CheckHuBian(self):
        type = self.m_LastPAI.m_Type
        value = self.m_LastPAI.m_Value

        pool = self.m_MyPAIVec[self.m_LastPAI.m_Type]
        bHu = False
        if self.m_LastPAI.m_Value != 3 and self.m_LastPAI.m_Value != 7:
            return  False

        typeLast = self.m_LastPAI.m_Type
        value1 = 1
        value2 = 2
        value3 = 3
        if self.m_LastPAI.m_Value == 7:
            value1 = 7
            value2 = 8
            value3 = 9

        bDel1 = self.DelPaiV(typeLast, value1)
        if bDel1 == False:return False
        bDel2 = self.DelPaiV(typeLast, value2)
        if bDel2 == False:
            self.AddPai(typeLast,value1)
            self.m_LastPAI.m_Type = type
            self.m_LastPAI.m_Value = value
            return False
        bDel3 = self.DelPaiV(typeLast, value3)
        if bDel3 == False:
            self.AddPai(typeLast,value1)
            self.AddPai(typeLast,value2)
            self.m_LastPAI.m_Type = type
            self.m_LastPAI.m_Value = value
            return False

        bHu = self.CheckHU()

        self.AddPai(typeLast, value1)
        self.AddPai(typeLast, value2)
        self.AddPai(typeLast, value3)
        self.m_LastPAI.m_Type = type
        self.m_LastPAI.m_Value = value
        if bHu:
            self.SetWinOp(self.GetOPByName('bianhu'))
        return  bHu

    def CheckHuDanDiao(self):##检测是否胡单吊
        try:
            if self.CheckHU() and self.m_checkDanDiao :
                self.SetWinOp(self.GetOPByName('dandiao'))
                return True
            return False
        except Exception, e:
            print str(Exception)

