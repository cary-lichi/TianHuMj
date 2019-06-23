#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
from logic.stPAI import stPAI
from logic.stPAIEx import stPAIEx
from  logic.CMJManager import CMJManage
import random

## 东北麻将管理器
class CMJDongBeiManage(CMJManage):
    m_baoPai = stPAI()#宝牌
    def __init__(self):
        CMJManage.__init__(self)

    def InitPai(self,p_HZPaiNum):##初始化牌
        self.m_HZPaiNum = p_HZPaiNum;
        self.m_MJVec = []

        #中
        t_Pai = stPAI()
        t_Pai.m_Type = 0
        t_Pai.m_Value = 1
        self.m_MJVec.append(t_Pai)
        self.m_MJVec.append(t_Pai)
        self.m_MJVec.append(t_Pai)
        self.m_MJVec.append(t_Pai)

        #万
        for  i in range(1,10):
            t_Pai = stPAI()
            t_Pai.m_Type = 2
            t_Pai.m_Value = i
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)

        #条
        for  i in range(1,10):
            t_Pai = stPAI()
            t_Pai.m_Type = 3
            t_Pai.m_Value = i
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)

        #饼
        for  i in range(1,10):
            t_Pai = stPAI()
            t_Pai.m_Type = 4
            t_Pai.m_Value = i
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)

        self.XiPai()


    def GenBaoPai(self):##生成宝牌
        count = 0
        for k,v in enumerate(self.m_MJVec):
            count = count + 1
            #if count < 54:continue
            baoPai = v
            nBao = 0
            for k1, v1 in enumerate(self.m_MJVec):
                if baoPai.m_Type == v1.m_Type and baoPai.m_Value == v1.m_Value:
                    nBao = nBao + 1
            if nBao >= 2:
                CMJDongBeiManage.m_baoPai = baoPai
                self.m_MJVec.remove(v)
                return True

    def IsNeedGenBaoPai(self):  ##打牌之后判断宝牌
        bFind = False
        for k, v in enumerate(self.m_MJVec):
            if self.m_baoPai.m_Type == v.m_Type and self.m_baoPai.m_Value == v.m_Value:
                bFind = True

        if bFind == False:
            self.GenBaoPai()
            return False

        return True

    def IsBaoPai(self,type,value):  ##判断是否宝牌
        if type == CMJDongBeiManage.m_baoPai.m_Type and value == CMJDongBeiManage.m_baoPai.m_Value:
            return True
        return False

    def IsLast4Pai(self):  ##判断是否最后四张牌
        return (len(self.m_MJVec) <= 3)