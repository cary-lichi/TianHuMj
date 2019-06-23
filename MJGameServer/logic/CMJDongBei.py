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
from logic.CMJ import CMJ
from logic.stPAI import stPAI
from logic.stCHI import stCHI
from logic.stGoodInfo import stGoodInfo
from configs.config_game import config_game
from logic.CMJDongBeiManager import CMJDongBeiManage
from collections import Counter

## 定义牌墙类。东北麻将玩法基类,万条饼红中，共112张
class CMJDongBei(CMJ):
    def __init__(self):
        CMJ.Init(self)
        self.Init()

    def Init(self):##初始化
       self.m_TempQiangTingPAIVec = []
       self.m_bTempCheckShun = False
       self.m_bTempCheckPeng = False
       return True

    def AddPaiReal(self, p_Type, p_Value):  ##真正加入新牌,并排序
        CMJ.AddPaiReal(self,p_Type,p_Value)
        if self.m_LastRealPAI.m_Type == CMJDongBeiManage.m_baoPai.m_Type and \
                        self.m_LastRealPAI.m_Value == CMJDongBeiManage.m_baoPai.m_Value\
                and self.m_bTing:
            self.SetWinOp(self.GetOPByName('bao'))
        if self.CheckGangPaiFromPeng(self.m_LastRealPAI.m_Type,self.m_LastRealPAI.m_Value) and self.m_bTing:
            self.SetWinOp(self.GetOPByName('dafeng'))
        if self.m_LastRealPAI.m_Type == 0 and self.m_LastRealPAI.m_Value == 1 and self.m_bTing:  # 是红中宝
            self.SetWinOp(self.GetOPByName('hongzhongbao'))

#大类玩法检测
    # 传统
    def CheckOPCommon(self):
        return (self.m_gamePlay.nType == config_game['gameplay']['mudanjiang_common']['id']) \
           or (self.m_gamePlay.nType == config_game['gameplay']['haerbin_common']['id']) \
               or (self.m_gamePlay.nType == config_game['gameplay']['happy']['id'])

    # 夹胡
    def CheckOPJiaHu(self):
        return (self.m_gamePlay.nType == config_game['gameplay']['mudanjiang_jiahu']['id']) \
               or (self.m_gamePlay.nType == config_game['gameplay']['haerbin_jiahu']['id'])

#可选玩法检测
    # 红中满天飞
    def CheckOPHongZhong(self):
        return  self.CheckOP(self.GetOPByName('hongzhong'))

    # 大风
    def CheckOPDaFeng(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('dafeng'))

    # 对宝
    def CheckOPDuiBao(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('duibao'))

    # 庄家翻倍
    def CheckOPZhuang(self):
        if self.CheckOPCommon():return False
        bHu = self.CheckOP(self.GetOPByName('zhuang'))
        if bHu:
            self.SetWinOp(self.GetOPByName('zhuang'))
        return bHu

    # 一炮多响
    def CheckOPDuoXiang(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('duoxiang'))

    # 红中宝
    def CheckOPHZB(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('hongzhongbao'))

    # 边胡
    def CheckOPBianHu(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('bianhu'))

    # 单吊
    def CheckOPDanDiao(self):
        if self.CheckOPCommon():return False
        return self.CheckOP(self.GetOPByName('dandiao'))

# 可选玩法胡牌判定

    # 胡自摸
    def CheckHuZiMo(self):  ##
        self.SetWinOp(self.GetOPByName('zimo'))

    # 胡点炮
    def CheckHuDianPao(self):  ##
        self.SetWinOp(self.GetOPByName('dianpao'))

    # （胡夹）听牌时，只能胡夹牌 11 22 33 44 567 99
    def CheckHuJia(self):  ##
            bHu =  self.CheckHuJiaInner()
            if  bHu:self.SetWinOp(self.m_gamePlay.nType)
            return bHu


    def CheckHuJiaInner(self):  ##
            type = self.m_LastPAI.m_Type
            value = self.m_LastPAI.m_Value

            vl = value - 1
            vh = value + 1
            if vl <= 0 or vh > 9:
                return False

            bDel = self.DelPaiV(type, vl)
            if bDel == False:
                return False
            bDel = self.DelPaiV(type, value)
            if bDel == False:
                self.AddPai(type, vl)
                self.m_LastPAI.m_Type = type
                self.m_LastPAI.m_Value = value
                return False
            bDel = self.DelPaiV(type, vh)
            if bDel == False:
                self.AddPai(type, vl)
                self.AddPai(type, value)
                self.m_LastPAI.m_Type = type
                self.m_LastPAI.m_Value = value
                return False

            self.m_bTempCheckShun = True
            # 删除夹牌组合之后还能胡，可以胡
            bHu = self.CheckHU()
            self.m_bTempCheckShun = False
            self.AddPai(type, vl)
            self.AddPai(type, value)
            self.AddPai(type, vh)
            self.m_LastPAI.m_Type = type
            self.m_LastPAI.m_Value = value
            if bHu:
               return True
            return False

    # 检测对宝，听牌时如果胡宝牌，可直接胡牌
    def CheckHuDuiBao(self):
        self.SetWinOp(self.GetOPByName('duibao'))

    # 检测大风：上听的状态下，上听前碰的牌抓到第四张就胡牌
    def CheckHuDaFeng(self):
        # 大风
        if self.m_bTing == False:return False
        return self.CheckWinOp(self.GetOPByName('dafeng'))

    # 红中可以解幺解横解掌。（即只要有一对红中，即可代替牌里的幺<带1或9的>横<三张连牌>掌<两张相同的牌>)
    def CheckHuZhongYHZ(self):
        if self.CheckHU():#当掌的情况
            return True

        bDel = self.DelPaiV(0, 1)
        if bDel == False:
            return False
        bDel = self.DelPaiV(0, 1)
        if bDel == False:
            self.AddPai(0, 1)
            return False

        self.m_bTempCheckPeng = True
        bResult = self.CheckHU()
        self.m_bTempCheckPeng = False
        if bResult:
            self.SetWinOp(self.GetOPByName('hongzhong'))

        self.AddPai(0, 1)
        self.AddPai(0, 1)

        return  bResult

    # 一炮多响
    def CheckHuDuoXiang(self):
        self.SetWinOp(self.GetOPByName('duoxiang'))

    def CheckHuDanDiao(self):##检测是否hu单吊
        return False

    def CheckHuBian(self):
        return False

    def CheckHuZhongBao(self):
        return False

        # 检测所有的可选玩法是否可胡
    def CheckHuCommon(self):
        if self.CheckHuBao():return True#胡宝
        if self.CheckHuCommonMust() == False:return False
        return self.CheckHU()

#检测所有的可选玩法是否可胡
    def CheckHuJiaAll(self):
            bHu = False

            if self.CheckHuCommonMust() == False:#验证基本规则
                return  False

            # 如果是选夹胡，只能胡夹
            if self.CheckOPJiaHu():
                if self.CheckHuJia():
                    bHu = True

            # 如果夹胡不了，边胡可选的情况下算夹胡
            if self.CheckOPBianHu():
                if self.CheckHuBian():
                    bHu = True

            # 如果夹胡不了，单吊可选的情况下算夹胡
            if self.CheckOPDanDiao():
                if self.CheckHuDanDiao():
                    bHu = True


            # if bHu == False:  # 在夹胡或者边胡或者单调都不成立的前提下，不需要再验证其他玩法，因为不满足夹胡条件
            #     return False

            # # 对宝
            # if self.CheckOPDuiBao():
            #     if self.CheckHuDuiBao():
            #         bHu = True

            # 红中宝
            if self.CheckOPHZB():
                if self.CheckHuZhongBao():
                    bHu = True

            # # 红中满天飞
            # if self.CheckOPHongZhong():
            #     if self.CheckHuZhongYHZ():
            #         bHu = True
            #
            # 大风
            if self.CheckOPDaFeng():
                if self.CheckHuDaFeng():
                    bHu = True

            #宝中宝
            if self.CheckHuBaoZhongBao():
                    bHu = True

            #摸宝
            if self.CheckHuBao():
                    bHu = True

            return bHu

# 通用玩法
    # 检测门清大扣，没有吃碰明杠
    def CheckHuDaKou(self):
           lenDK = 0
           for i in range(0,len(self.m_MyPAIVec)):
               lenDK = lenDK + len(self.m_ChiPAIVec[i])
               lenDK = lenDK + len(self.m_PengPAIVec[i])
               lenDK = lenDK + len(self.m_MGangPAIVec[i])
           bHu = (lenDK == 0)
           if bHu:
               self.SetWinOp(self.GetOPByName('dakou'))
           return  bHu


    # 检测下蛋：明杠 、暗杠。
    def CheckHuXiaDan(self,bM):
           lenXD = 0
           if self.GetOPByName('xiadan') == -1:return lenXD

           for i in range(0,len(self.m_MyPAIVec)):
               if bM:
                   lenXD = lenXD + len(self.m_MGangPAIVec[i])/4
               else:
                   lenXD = lenXD + len(self.m_AGangPAIVec[i])/4
           if lenXD > 0 :self.SetWinOp(self.GetOPByName('xiadan'))
           return  lenXD

    # 宝中宝：胡的牌是宝牌且为夹，摸到宝为宝中宝
    def CheckHuBaoZhongBao(self):
        if self.m_bTing == False:#只有听牌了才检查胡宝
            return False
        if  self.m_LastRealPAI.m_Type == CMJDongBeiManage.m_baoPai.m_Type and \
            self.m_LastRealPAI.m_Value == CMJDongBeiManage.m_baoPai.m_Value:
                if self.CheckHU():
                    self.SetWinOp(self.GetOPByName('baozhongbao'))
                    return True
        return False

    # 胡宝：摸到宝牌胡
    def CheckHuBao(self):
        if self.m_bTing == False:#只有听牌了才检查胡宝
            return False
        return  self.CheckWinOp(self.GetOPByName('bao'))

    def GetZPSOverride(self):  ##检测横顺掌是否存在重叠，仅仅检查手牌
        # 删除掌
        bDel1 = self.DelPaiV(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)
        bDel2 = self.DelPaiV(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)
        assert bDel1 and bDel2

        # 如果有重叠，必然不是3的倍数
        for k, pool in enumerate(self.m_MyPAIVec):
            lenPool = len(pool)
            if lenPool == 0: continue
            if lenPool % 3 != 0:
                self.AddPai(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)
                self.AddPai(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)
                return False

        bHu = self.CheckHuShunPeng()

        self.AddPai(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)
        self.AddPai(self.m_jiangPai.m_Type, self.m_jiangPai.m_Value)

        return bHu

    # 胡牌：必须有顺牌（1万、2万、3万）有碰（4万、4万、4万）
    # 有一或者九（不分花色）、不能只有一种花色，不能手里只剩一张牌
    def CheckHuCommonMust(self):
            if self.CheckHuYaoJiu() == False:
                return False

            if self.CheckHuQingYiSe() == False:
                return False

            # if self.CheckHuShunPeng() == False:
            #     return False

            return True

    #听牌时，牌中必须带至少一个“幺”或“九”
    def CheckHuYaoJiu(self):##
       for i in range(2,len(self.m_MyPAIVec)):
           for k,v in enumerate(self.m_MyPAIVec[i]):
               if v == 1 or v == 9:
                   return  True
           for k,v in enumerate(self.m_ChiPAIVec[i]):
               if v == 1 or v == 9:
                   return  True
           for k, v in enumerate(self.m_PengPAIVec[i]):
                   if v == 1 or v == 9:
                       return True
           for k, v in enumerate(self.m_MGangPAIVec[i]):
                   if v == 1 or v == 9:
                       return True
           for k, v in enumerate(self.m_AGangPAIVec[i]):
                       if v == 1 or v == 9:
                           return True

       if self.CheckOPHongZhong():#红中满天飞
           return self.CheckOwnZhong()

       return  False

       # 清一色的牌型不能听牌，必须有两种色以上才可听牌。（注：红中不算色）
    def CheckHuQingYiSe(self):  ##
           count = 0
           for i in range(1, len(self.m_MyPAIVec)):
               if len(self.m_MyPAIVec[i]) > 0 or len(self.m_ChiPAIVec[i]) > 0 \
                       or len(self.m_PengPAIVec[i]) > 0 or len(self.m_MGangPAIVec[i]) > 0 \
                       or len(self.m_AGangPAIVec[i]) > 0:
                   count = count + 1
           if count >= 2:
               return True
           return False

           # 必需先开门在有顺、碰同时存在的情况下才能听牌

    def CheckHuShunInner(self):  ##
        for type, pool in enumerate(self.m_MyPAIVec):
            for index, paiV in enumerate(pool):
                bV2 = False
                bV3 = False
                for index1, paiV1 in enumerate(pool):
                    if paiV1 == (paiV + 1):
                        bV2 = True
                    if paiV1 == (paiV + 2):
                        bV3 = True
                if bV2 and bV3:
                    return True
        return False

    def CheckHuShunPeng(self):  ##
        bShun = (self.CheckPoolNull(self.m_ChiPAIVec) == False)
        bPeng = (self.CheckPoolNull(self.m_PengPAIVec) == False)
        if bPeng == False:
            bPeng = (self.CheckPoolNull(self.m_MGangPAIVec) == False)
        if bPeng == False:
            bPeng = (self.CheckPoolNull(self.m_AGangPAIVec) == False)

        canPengList = []
        if bPeng == False:
            for type,pool in enumerate(self.m_MyPAIVec):
                cnt = Counter(pool)
                for paiV,count in cnt.iteritems():
                    if count >= 3:
                        paiShun = stPAI()
                        paiShun.m_Type = type
                        paiShun.m_Value = paiV
                        canPengList.append(paiShun)
            bPeng = (len(canPengList) > 0 )
        if bPeng == False:
            if self.CheckOPHongZhong():  # 红中满天飞
                bPeng = self.CheckOwnZhong()
        if bPeng == False:bPeng = self.m_bTempCheckPeng
        if bShun == False:bShun = self.m_bTempCheckShun
        self.m_bTempCheckPeng = False
        self.m_bTempCheckShun = False
        if bPeng == False: return False
        if bShun == True:return  True

# 检查顺，除去碰
        if len(canPengList) > 0 :
            for k,pengPai in enumerate(canPengList):
                self.DelPaiObj(pengPai)
                self.DelPaiObj(pengPai)
                self.DelPaiObj(pengPai)
                bShun = self.CheckHuShunInner()
                self.AddPaiObj(pengPai)
                self.AddPaiObj(pengPai)
                self.AddPaiObj(pengPai)
            if bShun:return True
        else:
            bShun = self.CheckHuShunInner()
            if bShun: return True

        return False

    # 牌墙中只剩一张不能听
    def CheckTingOnlyOne(self):  ##
        lenPai = 0
        for k,v in enumerate(self.m_MyPAIVec):
            lenPai = lenPai + len(v)

        return (lenPai > 1)

    def CheckTingOPAll(self):##检测是否听单吊
            # 起牌，加一张牌，如果胡了，说明当前可以听
            if self.m_checkDanDiao:return
            huList = self.CheckHuList()
            self.m_checkDanDiao = (len(huList) == 1)

##胡牌基本检测
    def CheckZFB(self,Pool):##检测红中
            iSize = len(Pool)
            if iSize > 0:
                #中
                if iSize == 1:
                        return  False
                elif iSize == 2:
                        self.iJiangNum =  self.iJiangNum + 1
                        self.m_jiangPai.m_Value = 1
            if self.iJiangNum == 1: self.m_jiangPai.m_Type = 0
            return  True

    def CheckHU(self):##检测是否胡牌
            t_Ok = False
            self.iJiangNum = 0
            self.m_jiangPai.m_Type = None
            self.m_jiangPai.m_Value = None
            #检测红中
            zfbPool = self.m_MyPAIVec[0]
            if  self.CheckZFB(zfbPool) == False:
                return  False

            #万
            wanPool = self.m_MyPAIVec[2]
            if  self.CheckWBT(2,wanPool) == False:
                return  False

            #条
            tiaoPool = self.m_MyPAIVec[3]
            if  self.CheckWBT(3,tiaoPool) == False:
                return  False

            #饼
            bingPool = self.m_MyPAIVec[4]
            if  self.CheckWBT(4,bingPool) == False:
                return  False

            if self.iJiangNum == 0:
                if self.CheckOPHongZhong():  # 红中满天飞
                    if self.CheckOwnZhong():
                        self.iJiangNum = 1
                        self.m_bTempCheckPeng = True

            if self.iJiangNum == 1 :
                bHu = self.GetZPSOverride()
                self.m_bTempCheckPeng = False
                return bHu

            return False

    def CheckTING(self):##检测是否听牌
            self.m_canHuList = []
            bHu = False
            #起牌，加一张牌，如果胡了，说明当前可以听
            pai = stPAI()
            pai.m_Type = 0
            pai.m_Value = 1
            self.AddPaiObj(pai)
            if self.CheckAllPai(config_game['MJ']['MJPAI_GETPAI']):
                self.m_canHuList.append(pai)
                bHu = True
            self.DelPaiObj(pai)

            for i in range(2,len(self.m_MyPAIVec)):
              for j in range(0,9):
                #起牌，加一张牌，如果胡了，说明当前可以听
                pai = stPAI()
                pai.m_Type = i
                pai.m_Value = j+1
                self.AddPaiObj(pai)
                if self.CheckAllPai(config_game['MJ']['MJPAI_GETPAI']):
                    self.m_canHuList.append(pai)
                    bHu = True
                self.DelPaiObj(pai)

            return bHu

    ##检测个人手中的牌
    def CheckAllPai(self, GetOrPut):  ##检测是否胡牌,各种情况,如果有宝牌，检测宝牌
            if GetOrPut == config_game['MJ']['MJPAI_GETPAI']:  # 起牌的时候
                ##检测各种胡法
                if self.CheckOPCommon():#传统胡
                    return self.CheckHuCommon()
                else:# 如果是选夹胡
                    return self.CheckHuJiaAll()
            else:
                if self.CheckTingOnlyOne() == False:#只剩一张不能听
                    return  False

                self.CheckTingOPAll()

                return  self.CheckTING()

    def CheckChiSort(self,p_Type):##检测可以吃牌种类
         if p_Type == config_game['MJ']['MJPAI_ZFB']:
             return False
         return  True

    def CheckOwnZhong(self):##检测是否有两个以上红中
        nHZ = self.GetPaiCount(0,1)
        if nHZ >= 2:
           return True
        return False

##检测抢听
    def CheckQiangTingPaiPeng(self,p_Type,p_Value):
            self.AddPai(p_Type,p_Value)

            for k, v in enumerate(self.m_TempPengPAIVec):
                self.DelPaiV(v.m_Type, v.m_Value)
                self.DelPaiV(v.m_Type, v.m_Value)
                self.DelPaiV(v.m_Type, v.m_Value)

                self.m_PengPAIVec[v.m_Type].append(v.m_Value)
                self.m_PengPAIVec[v.m_Type].append(v.m_Value)
                self.m_PengPAIVec[v.m_Type].append(v.m_Value)

                tempQTs = self.CheckPutTING()
                if len(tempQTs) > 0:
                    for k1,v1 in enumerate(tempQTs):
                       self.m_TempQiangTingPAIVec.append(v1)

                    self.DelPengPaiV(v.m_Type, v.m_Value)
                    self.DelPengPaiV(v.m_Type, v.m_Value)
                    self.DelPengPaiV(v.m_Type, v.m_Value)
                    self.AddPai(v.m_Type, v.m_Value)
                    self.AddPai(v.m_Type, v.m_Value)
                    self.AddPai(v.m_Type, v.m_Value)
                    self.DelPaiV(p_Type, p_Value)
                    return True

                self.DelPengPaiV(v.m_Type, v.m_Value)
                self.DelPengPaiV(v.m_Type, v.m_Value)
                self.DelPengPaiV(v.m_Type, v.m_Value)

                self.AddPai(v.m_Type, v.m_Value)
                self.AddPai(v.m_Type, v.m_Value)
                self.AddPai(v.m_Type, v.m_Value)

            self.DelPaiV(p_Type,p_Value)
            return  False

    def CheckQiangTingPaiChi(self,p_Type,p_Value):
                QTChiIndexs = []
                self.AddPai(p_Type, p_Value)
                for i in range(0, len(self.m_TempChiPAIVec)):
                        v = self.m_TempChiPAIVec[i]
                        self.DelPaiV(v.m_Type, v.m_Value1)
                        self.DelPaiV(v.m_Type, v.m_Value2)
                        self.DelPaiV(v.m_Type, v.m_Value3)

                        self.m_ChiPAIVec[v.m_Type].append(v.m_Value1)
                        self.m_ChiPAIVec[v.m_Type].append(v.m_Value2)
                        self.m_ChiPAIVec[v.m_Type].append(v.m_Value3)

                        tempQTs = self.CheckPutTING()
                        if len(tempQTs) > 0:
                            for k1, v1 in enumerate(tempQTs):
                                self.m_TempQiangTingPAIVec.append(v1)
                            if (i in QTChiIndexs) == False:
                               QTChiIndexs.append(i)

                        self.DelChiPaiV(v.m_Type,v.m_Value1)
                        self.DelChiPaiV(v.m_Type,v.m_Value2)
                        self.DelChiPaiV(v.m_Type,v.m_Value3)

                        self.AddPai(v.m_Type, v.m_Value1)
                        self.AddPai(v.m_Type, v.m_Value2)
                        self.AddPai(v.m_Type, v.m_Value3)
                self.DelPaiV(p_Type, p_Value)
                return QTChiIndexs


    def DoQiangTingPai(self,p_Type,p_Value,chiIndex):#state代表是吃还是碰
        if chiIndex == -1:#碰
            self.DoPengPai(p_Type,p_Value)
        else:
            self.DoChiPai(chiIndex,p_Type,p_Value)

        return  True

    def Reset(self):  ##重置
        CMJ.Reset(self)
        self.ResetTemp()
        self.ResetCircle()


    def ResetTemp(self):##重置临时吃碰杠组合
        CMJ.ResetTemp(self)
        self.m_TempQiangTingPAIVec = []

    def ResetCircle(self):  ##重置过牌
        self.ClearWinOp()

    def CheckHuList(self):  ##检测胡牌的可能性
                # 起牌，加一张牌，如果胡了，说明当前可以听
                huList = []

                self.AddPai(0, 1)
                # if self.CheckAllPai(config_game['MJ']['MJPAI_GETPAI']):
                if self.CheckHU():
                    pai = stPAI()
                    pai.m_Type = 0
                    pai.m_Value = 1
                    huList.append(pai)
                self.DelPaiV(0, 1)

                for i in range(2, len(self.m_MyPAIVec)):
                    for j in range(0, 9):
                        # 起牌，加一张牌，如果胡了，说明当前可以听
                        self.AddPai(i, j + 1)
                        if self.CheckHU():
                            pai = stPAI()
                            pai.m_Type = i
                            pai.m_Value = j + 1
                            huList.append(pai)
                        self.DelPaiV(i,j+1)

                return huList