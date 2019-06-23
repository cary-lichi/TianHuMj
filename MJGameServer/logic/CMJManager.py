#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
from logic.stPAI import stPAI
from logic.stPAIEx import stPAIEx
import random

## 麻将管理器
class CMJManage  :
    def __init__(self):
       self.m_MJVec = []#麻将数据列表
       self.m_HZPaiNum = 0#黄庄的牌数

    def InitPai(self,p_HZPaiNum):##初始化牌
        self.m_HZPaiNum = p_HZPaiNum
        self.m_MJVec = []

        #中发白
        for  i in range(1,4):
            t_Pai = stPAI()
            t_Pai.m_Type = 0
            t_Pai.m_Value = i
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)
            self.m_MJVec.append(t_Pai)

         #东南西北
        for  i in range(1,5):
            t_Pai = stPAI()
            t_Pai.m_Type = 1
            t_Pai.m_Value = i
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

    def XiPai(self):##洗牌
        random.shuffle(self.m_MJVec)

    def GetAPai(self):##起牌

       #如果所有牌都起完了
       if len(self.m_MJVec) <= 0:
           return None

       t_Pai = stPAIEx()
       t_Pai.m_NewPai.m_Type = self.m_MJVec[-1].m_Type
       t_Pai.m_NewPai.m_Value = self.m_MJVec[-1].m_Value
       t_Pai.m_PaiNum = len(self.m_MJVec) - 1
       if(t_Pai.m_PaiNum == self.m_HZPaiNum):
           t_Pai.m_IsHZ = True
       else:
           t_Pai.m_IsHZ = False

       self.m_MJVec.pop()
       return t_Pai

    def GetLeftPai(self):##获取剩余牌数
        return len(self.m_MJVec)

    def GetLeftCanHuPai(self,pai):##获取能胡的牌的剩余牌数
        nLeft = 0
        for k,v in enumerate(self.m_MJVec):
              if v.m_Type == pai.m_Type and v.m_Value == pai.m_Value:
                  nLeft = nLeft + 1
        return  nLeft

    def IsOver(self):##是不是结束了
        return len(self.m_MJVec) <= 0