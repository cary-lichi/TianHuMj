#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
import traceback

from logic.room import Room
from configs.config_game import config_game
from configs.config_error import config_error
from logic.stPAI import stPAI
from logic.stPeng import stPeng
from protobuf import msg_pb2
from tools.utils import Utils
from logic.CMJDongBeiManager import CMJDongBeiManage
## 东北房间基类
class DongBei_Room(Room):
    def __init__(self):
        Room.__init__(self)

    def initRoom(self,message,conn,parent):
        self.m_checkDuiBao = False
        Room.initRoom(self,message,conn,parent)
        self.m_cmjManager = CMJDongBeiManage()

    def initDeleRoom(self,message,parent):
        self.m_checkDuiBao = False
        msg=Room.initDeleRoom(self,message,parent)
        self.m_cmjManager = CMJDongBeiManage()
        return msg

    def initPai(self):  ##初始化玩家牌
        Room.initPai(self)
        self.m_cmjManager.GenBaoPai()

    def onDisConnect(self, id):  ##玩家掉线,id，不删除信息，仅仅把conn置空
        Room.onDisConnect(self,id)

    def getPai(self, gamerID):  ##玩家摸牌
        bUpdate = self.m_cmjManager.IsNeedGenBaoPai()
        if bUpdate:
            msg = msg_pb2.Msg()
            msg.type = msg_pb2.EnumMsg.Value('baopaichangenotify')
            msg.notify.baopaiChangeNotify.nUserID = gamerID
            msg.notify.baopaiChangeNotify.newBao.nType = self.m_cmjManager.m_baoPai.m_Type
            msg.notify.baopaiChangeNotify.newBao.nValue = self.m_cmjManager.m_baoPai.m_Value
            self.sendAllMessage(msg)
        Room.getPai(self,gamerID)

    def checkPutTingDB(self, gamerID, type, value):  ##判断出牌后是不是听对宝
        ##检测出牌玩家是否可以听牌
            if self.m_checkDuiBao:return
            gamer = self.m_gamerCache.get(gamerID)
            if gamer.getTing() == False:return

            self.m_checkDuiBao = True
            huList = gamer.cmj.CheckHuList()
            for k, v in enumerate(huList):
                if gamer.cmj.CheckOPDuiBao() and \
                                v.m_Type == self.m_cmjManager.m_baoPai.m_Type and \
                                v.m_Value == self.m_cmjManager.m_baoPai.m_Value:  # 可以胡对宝
                    gamer.setCanHu(True)
                    gamer.cmj.CheckHuDuiBao()
                    gamer.m_huPai.m_Type = v.m_Type
                    gamer.m_huPai.m_Value = v.m_Value
                    msg = msg_pb2.Msg()
                    msg.type = msg_pb2.EnumMsg.Value('canpainotify')
                    msg.notify.canPaiNotify.nUserID = gamerID
                    msg.notify.canPaiNotify.canHu = True
                    msg.notify.canPaiNotify.lastPai.nType = type
                    msg.notify.canPaiNotify.lastPai.nValue =value
                    self.m_putMsgCache.append(msg)
                    break

    def checkPut(self,gamerID,type,value):  ##判断出牌后其他几家是否可以胡牌，还是依方位次序
            self.m_putMsgCache = []
            self.checkPutTingDB(gamerID,type,value)
            self.checkPutOther(gamerID,type,value)
            if self.checkPutYPGX(gamerID,type,value): return
            self.sendCheckPutMsg()

    #一炮多响:点炮有多人胡牌时，每家给6分, 直接胡不用问了
    def checkPutYPGX(self, gamerID, type, value):
            gamer = self.m_gamerCache.get(gamerID)
            if gamer.cmj.CheckOPDuoXiang() == False:
                return False

            wins = []
            for k,v in self.m_gamerCache.iteritems():
                if k != gamerID and v.getCanHu() :
                    v.m_huPai.m_Type = type
                    v.m_huPai.m_Value = value
                    wins.append(v)
            if len(wins) >= 2:
                for k1,v1 in enumerate(wins):
                    v1.cmj.AddPaiReal(type, value)
                    v1.setHu(True)
                gamer.m_bDianPao = True
                self.gameEnd()
                return  True

            return  False


    def checkPutOther(self, gamerID, type, value):  ##判断出牌后其他几家是否可以杠碰吃牌，还是依方位次序
                  msgPoolTemp = dict()
                  indexSortTemp = []
                  gamer = self.m_gamerCache.get(gamerID)
                  nexter = None
                  rangeMax = self.m_maxPlayerNum - 1
                  for i in range(rangeMax, 0, -1):
                      level = 0
                      if nexter == None:
                          nexter = self.getNextGamer(gamer.id)
                      else:
                          nexter = self.getNextGamer(nexter.id)
                      nexter.cmj.ResetTemp()

                      canHu = False
                      canGang = False
                      canPeng = False
                      canChi = False
                      canQiangTing = False
                      # 荒庄：摸完所有牌没人胡为荒庄，最后4张牌点炮不能胡
                      if nexter.getTing():
                          if self.m_cmjManager.IsLast4Pai() == False:  # 只有听牌状态才检测胡
                              nexter.cmj.AddPai(type, value)  # 先添加，判断后再删除
                              canHu = nexter.cmj.CheckAllPai(config_game['MJ']['MJPAI_GETPAI'])
                              if canHu:
                                  gamer.m_bDianPao = True
                                  nexter.m_huPai.m_Type = type
                                  nexter.m_huPai.m_Value = value
                              nexter.setCanHu(canHu)
                              nexter.cmj.DelPaiV(type, value)
                      else:
                          canGang = nexter.cmj.CheckGangPai(type, value,config_game['gangState']['ming'])
                          canPeng = nexter.cmj.CheckPengPai(type, value)
                          canChi = nexter.cmj.CheckChiPai(type, value)

                          nexter.cmj.m_bJudgeQiangTing = True
                          canQiangTingPeng = False
                          if canPeng :#只有可碰可吃的情况下才验证要不要抢听 # 抢听，吃完牌打一张可以听优先于杠碰
                             canQiangTingPeng = nexter.cmj.CheckQiangTingPaiPeng(type, value)

                          canQiangTingChi = False
                          if canChi :
                              # 抢听，吃完牌打一张可以听优先于杠碰
                              QTChiIndexs = nexter.cmj.CheckQiangTingPaiChi(type, value)
                              canQiangTingChi = (len(QTChiIndexs) > 0)
                          nexter.cmj.m_bJudgeQiangTing = False

                          canQiangTing = (canQiangTingPeng or canQiangTingChi)
                          if canQiangTing:#在最后处理抢听
                             if canQiangTingPeng == False:
                                 nexter.cmj.m_TempPengPAIVec = []
                             if  canQiangTingChi == False:
                                 nexter.cmj.m_TempChiPAIVec = []
                             else:
                                 tempChiPool = []
                                 for k, v in enumerate(QTChiIndexs):
                                     tempChiPool.append(nexter.cmj.m_TempChiPAIVec[v])
                                 nexter.cmj.m_TempChiPAIVec = tempChiPool

                          if i != rangeMax and canQiangTing == False:#不是下家也不是抢听，不应该可以吃
                              canChi = False
                              nexter.cmj.m_TempChiPAIVec = []

                      nexter.setCanQiangTing(canQiangTing)
                      nexter.setCanGang(canGang)
                      nexter.setCanPeng(canPeng)
                      nexter.setCanChi(canChi)

                      if (canHu == False and canGang == False \
                                  and canPeng == False and canChi == False \
                                  and canQiangTing == False):
                          continue

                      if (canHu):
                          level = level + 100000
                      if (canQiangTing):
                          level = level + 10000
                      if (canGang):
                          level = level + 1000
                      if (canPeng):
                          level = level + 100
                      if (canChi):
                          level = level + 1
                      level = level + i * 10
                      indexSortTemp.append(level)

                      msg = msg_pb2.Msg()
                      msg.type = msg_pb2.EnumMsg.Value('canpainotify')

                      msg.notify.canPaiNotify.nUserID = nexter.id
                      msg.notify.canPaiNotify.lastPai.nType = type
                      msg.notify.canPaiNotify.lastPai.nValue = value
                      msg.notify.canPaiNotify.canHu = canHu
                      msg.notify.canPaiNotify.canQiangTing = canQiangTing
                      msg.notify.canPaiNotify.canGang = canGang
                      msg.notify.canPaiNotify.canPeng = canPeng
                      if i == rangeMax:
                         msg.notify.canPaiNotify.canChi = canChi

                      if nexter.getTing() == False:  # 听牌状态
                          for k, v in enumerate(nexter.cmj.m_TempGangPAIVec):
                              pai = msg.notify.canPaiNotify.canGangPool.add()
                              pai.nType = v.m_Type
                              pai.nValue = v.m_Value
                              if canGang:
                                  pai.nGangState = config_game['gangState']['ming']
                          for k, v in enumerate(nexter.cmj.m_TempPengPAIVec):
                              pai = msg.notify.canPaiNotify.canPengPool.add()
                              pai.nType = v.m_Type
                              pai.nValue = v.m_Value
                          if i == rangeMax or canQiangTing == True:
                              for k, v in enumerate(nexter.cmj.m_TempChiPAIVec):
                                  chiPai = msg.notify.canPaiNotify.canChiPool.add()
                                  chiPai.nType = v.m_Type
                                  chiPai.nValue1 = v.m_Value1
                                  chiPai.nValue2 = v.m_Value2
                                  chiPai.nValue3 = v.m_Value3

                      msgPoolTemp[level] = msg

                  indexSortTemp.sort(reverse=True)
                 # sorted(msgPoolTemp.items(), key=lambda d: d[0], reverse=True)
                  for k, v in enumerate(indexSortTemp):
                      self.m_putMsgCache.append(msgPoolTemp[v])


    def onDoQiangTingPai(self, gamerID, pai,nChiIndex):  ##玩家抢听牌
                self.cancelTimeOut(gamerID)
                self.m_geter = gamerID
                gamer = self.m_gamerCache.get(gamerID)
                gamer.lastMsg = None
                chipai = None
                if gamer.getCanQiangTing():
                    if nChiIndex == -1:#碰牌抢听
                        gamer.cmj.DoPengPai(pai.nType,pai.nValue)
                        stPengPai = stPeng()
                        stPengPai.m_Type = pai.nType
                        stPengPai.m_Value = pai.nValue
                        gamer.cmj.AddOrderPai(stPengPai)
                    else:
                        chipai = gamer.cmj.GetChiPai(nChiIndex)
                        gamer.cmj.DoChiPai(nChiIndex,pai.nType, pai.nValue)
                        gamer.cmj.AddOrderPai(chipai)

                    self.HandleCPGPutPai()

                    msg = msg_pb2.Msg()
                    msg.type = msg_pb2.EnumMsg.Value('doqiangtingpairesponse')
                    msg.response.doQiangTingPaiResponse.nErrorCode = config_error['success']
                    msg.response.doQiangTingPaiResponse.nChiIndex = nChiIndex
                    msg.response.doQiangTingPaiResponse.nLastID = self.m_puter
                    msg.response.doQiangTingPaiResponse.lastPai.nType = self.m_lastPutPai.m_Type
                    msg.response.doQiangTingPaiResponse.lastPai.nValue = self.m_lastPutPai.m_Value
                    msg.response.doQiangTingPaiResponse.pai.nType = pai.nType
                    msg.response.doQiangTingPaiResponse.pai.nValue = pai.nValue
                    msg.response.doQiangTingPaiResponse.lastPai.nType = self.m_lastPutPai.m_Type
                    msg.response.doQiangTingPaiResponse.lastPai.nValue = self.m_lastPutPai.m_Value
                    if nChiIndex != -1:#碰牌抢听
                        msg.response.doQiangTingPaiResponse.chipai.nType = chipai.m_Type
                        msg.response.doQiangTingPaiResponse.chipai.nValue1 = chipai.m_Value1
                        msg.response.doQiangTingPaiResponse.chipai.nValue2 = chipai.m_Value2
                        msg.response.doQiangTingPaiResponse.chipai.nValue3 = chipai.m_Value3
                    else:
                        msg.response.doQiangTingPaiResponse.pengpai.nType = pai.nType
                        msg.response.doQiangTingPaiResponse.pengpai.nValue = pai.nValue
                    self.sendMessage(gamerID, msg)

                    msg = msg_pb2.Msg()
                    msg.type = msg_pb2.EnumMsg.Value('doqiangtingpainotify')
                    msg.notify.doQiangTingPaiNotify.nUserID = gamerID
                    msg.notify.doQiangTingPaiNotify.sRoomID = self.m_id
                    msg.notify.doQiangTingPaiNotify.pai.nType = pai.nType
                    msg.notify.doQiangTingPaiNotify.pai.nValue = pai.nValue
                    msg.notify.doQiangTingPaiNotify.nLastID = self.m_puter
                    msg.notify.doQiangTingPaiNotify.lastPai.nType = self.m_lastPutPai.m_Type
                    msg.notify.doQiangTingPaiNotify.lastPai.nValue = self.m_lastPutPai.m_Value
                    if nChiIndex != -1:#碰牌抢听
                        msg.notify.doQiangTingPaiNotify.chipai.nType = chipai.m_Type
                        msg.notify.doQiangTingPaiNotify.chipai.nValue1 = chipai.m_Value1
                        msg.notify.doQiangTingPaiNotify.chipai.nValue2 = chipai.m_Value2
                        msg.notify.doQiangTingPaiNotify.chipai.nValue3 = chipai.m_Value3
                    else:
                        msg.notify.doQiangTingPaiNotify.pengpai.nType = pai.nType
                        msg.notify.doQiangTingPaiNotify.pengpai.nValue = pai.nValue
                    self.sendOtherMessage(gamerID, msg)



                    gamer.setCanQiangTing(False)#取消状态
                    gamer.setTing(True)
                    self.onDoPai(gamerID, True, config_game["putPaiState"]["qiangting"])

    def calcScore(self):
            if self.getDianPaos():
                self.calcDianPaoScore()
                self.calcDianPaoShowState()
            else:
                self.calcZiMoScore()
                self.calcZiMoShowState()

            #明暗杠
            for k, v in self.m_gamerCache.iteritems():
                cM =  v.cmj.CheckHuXiaDan(True)
                self.CalcWinScoreInner(k,cM)
                cA = v.cmj.CheckHuXiaDan(False)
                self.CalcWinScoreInner(k,cA*2)

    #计算点炮赢
    def calcDianPaoScore(self):
        dianpaoer = self.getDianPaos()
        wins = self.getWins()
        lenWin = len(wins)
        deltaScore = 6
        if lenWin > 1:  # 一炮多响
            for k, v in enumerate(wins):
                    if dianpaoer.boss and v.cmj.CheckOPZhuang() and self.IsHappyRoom() == False :
                        deltaScore = deltaScore*2
                    v.m_score = v.m_score + deltaScore
                    v.cmj.CheckHuDuoXiang()
                    dianpaoer.m_score = dianpaoer.m_score - deltaScore
            ##大扣以上分数乘2倍。明杠每家单独给1分。暗杠每家单独给2分。
            for k, v in enumerate(wins):
                oldscore = v.m_score
                if dianpaoer.boss and v.cmj.CheckOPZhuang()  and self.IsHappyRoom() == False:
                    oldscore = oldscore*2
                if v.cmj.CheckHuDaKou():
                    v.m_score = v.m_score + oldscore
                    dianpaoer.m_score = dianpaoer.m_score - oldscore
                oldscore = v.m_score
                if v.cmj.CheckOPZhuang() and v.boss  and self.IsHappyRoom() == False:  # 庄家翻倍
                    v.m_score = v.m_score + oldscore
                    dianpaoer.m_score = dianpaoer.m_score - oldscore
        elif lenWin==1:
            winner = wins[0]
            winner.cmj.CheckHuZiMo()
            if dianpaoer.getTing() == False:  # 未上听点炮给6分，点炮的给
                if dianpaoer.boss and dianpaoer.cmj.CheckOPZhuang()  and self.IsHappyRoom() == False:
                    deltaScore  = deltaScore * 2
                dianpaoer.m_score = dianpaoer.m_score - deltaScore
                winner.m_score = winner.m_score + deltaScore

                ##大扣以上分数乘2倍。明杠每家单独给1分。暗杠每家单独给2分。
                for k, v in enumerate(wins):
                    oldscore = v.m_score
                   # if dianpaoer.boss: oldscore = oldscore * 2
                    if v.cmj.CheckHuDaKou():
                        v.m_score = v.m_score + oldscore
                        dianpaoer.m_score = dianpaoer.m_score - oldscore
                    oldscore = v.m_score
                    if v.cmj.CheckOPZhuang() and v.boss  and self.IsHappyRoom() == False:  # 庄家翻倍
                        v.m_score = v.m_score + oldscore
                        dianpaoer.m_score = dianpaoer.m_score - oldscore
            else:
                self.CalcWinScoreInner(winner.id, 1)
                if dianpaoer.boss and dianpaoer.cmj.CheckOPZhuang()  and self.IsHappyRoom() == False:
                    winner.m_score = winner.m_score  + 1
                    dianpaoer.m_score = dianpaoer.m_score - 1
                ##大扣以上分数乘2倍。明杠每家单独给1分。暗杠每家单独给2分。
                for k, v in enumerate(wins):
                    if v.cmj.CheckHuDaKou():
                        self.CalcWinScoreInnerBoss(v.id)
                    if v.cmj.CheckOPZhuang() and v.boss:  # 庄家翻倍
                        self.CalcWinScoreInnerBoss(v.id)


    # 计算自摸赢
    def calcZiMoScore(self):
        wins = self.getWins()
        lenWin = len(wins)
        if lenWin <= 0:
            return

        winner = wins[0]
        winner.m_bZiMo = True
        winner.cmj.CheckHuZiMo()
        oldScore = winner.m_score

        loseBoss = None
        for k,v in self.m_gamerCache.iteritems():
            if k != winner.id and v.boss:loseBoss = v

        self.CalcWinScoreInner(winner.id,2)
        if loseBoss:
            winner.m_score = winner.m_score + 2
            loseBoss.m_score = loseBoss.m_score - 2

        # 摸宝 、摸到大风（上听前碰的牌抓到第四张）等同摸宝每家给4分。
        # 红中满天飞等同于摸宝每家给四分
        if winner.cmj.CheckWinOp(winner.cmj.GetOPByName('bao')) or \
            winner.cmj.CheckWinOp(winner.cmj.GetOPByName('hongzhongbao')):
            self.ClearSocreInner()
            self.CalcWinScoreInner(winner.id, 4)
            if loseBoss:
                winner.m_score = winner.m_score + 4
                loseBoss.m_score = loseBoss.m_score - 4
        if  winner.cmj.CheckOPCommon() == False:
            if winner.cmj.CheckWinOp(winner.cmj.GetOPByName('dafeng')) or \
                    winner.cmj.CheckWinOp(winner.cmj.GetOPByName('hongzhong')):
                self.ClearSocreInner()
                self.CalcWinScoreInner(winner.id, 4)
                if loseBoss:
                    winner.m_score = winner.m_score + 4
                    loseBoss.m_score = loseBoss.m_score - 4
            # 对宝每家给8分 宝中宝每家给8分
            if winner.cmj.CheckWinOp(winner.cmj.GetOPByName('duibao')) or \
                winner.cmj.CheckWinOp(winner.cmj.GetOPByName('baozhongbao')):
                self.ClearSocreInner()
                self.CalcWinScoreInner(winner.id, 8)
                if loseBoss:
                    winner.m_score = winner.m_score + 8
                    loseBoss.m_score = loseBoss.m_score - 8

        ##大扣以上分数乘2倍。明杠每家单独给1分。暗杠每家单独给2分。
        if winner.cmj.CheckHuDaKou():
            self.CalcWinScoreInnerBoss(winner.id)
        if winner.cmj.CheckOPZhuang() and winner.boss  and self.IsHappyRoom() == False:  # 庄家翻倍
            self.CalcWinScoreInnerBoss(winner.id)

    #计算点炮赢
    def calcDianPaoShowState(self):
        dianpaoer = self.getDianPaos()
        for k,v in self.m_gamerCache.iteritems():
            if v.getTing() and k == dianpaoer.id:
                v.m_showState.append(config_game['jieSuanState']['tingpao'])
            elif  v.getTing()==False and k == dianpaoer.id:
                v.m_showState.append(config_game['jieSuanState']['untingpao'])
            elif v.getHu():
                v.m_showState.append(config_game['jieSuanState']['hupai'])
            elif v.getTing():
                v.m_showState.append(config_game['jieSuanState']['ting'])
            elif v.getTing() == False:
                v.m_showState.append(config_game['jieSuanState']['unting'])

    def calcZiMoShowState(self):
        for k,v in self.m_gamerCache.iteritems():
            if v.getHu() and v.cmj.CheckWinOp(v.cmj.GetOPByName('baozhongbao')):
                v.m_showState.append(config_game['jieSuanState']['baozhongbao'])
            elif v.getHu() and v.cmj.CheckWinOp(v.cmj.GetOPByName('bao')):
                v.m_showState.append(config_game['jieSuanState']['bao'])
            elif v.getHu() and v.cmj.CheckWinOp(v.cmj.GetOPByName('duibao')):
                v.m_showState.append(config_game['jieSuanState']['bao'])
            elif v.getHu() and v.cmj.CheckWinOp(v.cmj.GetOPByName('hongzhongbao')):
                v.m_showState.append(config_game['jieSuanState']['bao'])
            elif v.getHu() and v.cmj.CheckWinOp(v.cmj.GetOPByName('dafeng')):
                v.m_showState.append(config_game['jieSuanState']['dafeng'])
            elif v.getHu():
                v.m_showState.append(config_game['jieSuanState']['zimo'])
            elif v.getTing():
                v.m_showState.append(config_game['jieSuanState']['ting'])
            elif v.getTing() == False:
                v.m_showState.append(config_game['jieSuanState']['unting'])

    def IsDoHuNeedAddPai(self,huer):
        return (Room.IsDoHuNeedAddPai(self,huer) or \
               huer.cmj.CheckWinOp(huer.cmj.GetOPByName('duibao')) )

    def CheckLastBao(self, gamer, type, value):
        bBao = False
        bBao = self.m_cmjManager.IsBaoPai(type, value)
        if bBao == False:
            bBao = gamer.cmj.CheckWinOp(gamer.cmj.GetOPByName('bao'))
        if bBao == False:
            bBao = gamer.cmj.CheckWinOp(gamer.cmj.GetOPByName('hongzhongbao'))
        if bBao == False:
            bBao = gamer.cmj.CheckWinOp(gamer.cmj.GetOPByName('duibao'))
        if bBao == False:
            bBao = gamer.cmj.CheckWinOp(gamer.cmj.GetOPByName('baozhongbao'))

        if bBao: return config_game['canLastBaoType']['bao']

        bDaFeng = gamer.cmj.CheckWinOp(gamer.cmj.GetOPByName('dafeng'))
        if bDaFeng:return  config_game['canLastBaoType']['dafeng']

        return config_game['canLastBaoType']['normal']

    def gameReset(self):  ##重置
       Room.gameReset(self)
       self.m_checkDuiBao = False