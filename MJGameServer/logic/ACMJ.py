#-*-coding:utf-8-*-
'''
逻辑玩家类
'''
## 定义牌墙类
import copy
class ACMJ:
    def __init__(self):

        self.Init()
        # return
        # # self.se`perateArr([101,101], 102)
        # arr = [101, 101, 104, 104, 201, 201, 209, 209, 305, 306, 307, 407, 407, 407]
        # self.isHu(arr, 407)

    def Init(self):  ##初始化
        self.MahjongArr = [
            101, 102, 103, 104, 105, 106, 107, 108, 109,  # 万
            101, 102, 103, 104, 105, 106, 107, 108, 109,
            101, 102, 103, 104, 105, 106, 107, 108, 109,
            101, 102, 103, 104, 105, 106, 107, 108, 109,
            201, 202, 203, 204, 205, 206, 207, 208, 209,  # 饼
            201, 202, 203, 204, 205, 206, 207, 208, 209,
            201, 202, 203, 204, 205, 206, 207, 208, 209,
            201, 202, 203, 204, 205, 206, 207, 208, 209,
            301, 302, 303, 304, 305, 306, 307, 308, 309,  # 条
            301, 302, 303, 304, 305, 306, 307, 308, 309,
            301, 302, 303, 304, 305, 306, 307, 308, 309,
            301, 302, 303, 304, 305, 306, 307, 308, 309,
            401, 402, 403, 404, 405, 406, 407,  # 东 西 南 北 中 发 白
            401, 402, 403, 404, 405, 406, 407,
            401, 402, 403, 404, 405, 406, 407,
            401, 402, 403, 404, 405, 406, 407,
            501, 502, 503, 504, 505, 506, 507, 508, # 花(春夏秋冬,梅兰竹菊)
        ]

    # 判断是否胡
    def isHu(self, arr, bao):
        mjArr = arr
        # 分割宝,万,筒,条,风
        sptArr = self.seperateArr(mjArr, bao)

        baoNum = len(sptArr[0])  # 手中宝牌的数量
        if baoNum == 4 or (bao > 500 and baoNum == 3):
            print "胡：所有的宝牌都在一家"
            return False

        # 检测牌数量
        if len(mjArr) % 3 != 2:
            print "牌数量不符合3n+2"
            return False

        needBaoArr = [0,0,0,0,0]  # 需要宝的数量
        for i in range(1, len(needBaoArr)):
            a = sptArr[i]
            needNum = self.getNeedBaoNumToZhengPu_ZhouKou(a)
            needBaoArr[i] = needNum
        # 将在"万"中
        needBaoNum = needBaoArr[2] + needBaoArr[3] + needBaoArr[4]
        if needBaoNum <= baoNum:
            leftBaoNum = baoNum - needBaoNum  # // 剩下可用于去拼"万"成整扑一将的癞子数量
            num = self.getBaoNumToZhengPuJiang_ZhouKou(sptArr[1])
            if leftBaoNum >= num:
                return True

        # 将在"筒"中
        needBaoNum = needBaoArr[1] + needBaoArr[3] + needBaoArr[4]
        if needBaoNum <= baoNum:
            leftBaoNum = baoNum - needBaoNum  # // 剩下可用于去拼"万"成整扑一将的癞子数量
            num = self.getBaoNumToZhengPuJiang_ZhouKou(sptArr[2])
            if leftBaoNum >= num:
                return True

        # 将在"条"中
        needBaoNum = needBaoArr[1] + needBaoArr[2] + needBaoArr[4]
        if needBaoNum <= baoNum:
            leftBaoNum = baoNum - needBaoNum  # // 剩下可用于去拼"万"成整扑一将的癞子数量
            num = self.getBaoNumToZhengPuJiang_ZhouKou(sptArr[3])
            if leftBaoNum >= num:
                return True

        # 将在"风"中
        needBaoNum = needBaoArr[1] + needBaoArr[2] + needBaoArr[3]
        if needBaoNum <= baoNum:
            leftBaoNum = baoNum - needBaoNum  # // 剩下可用于去拼"万"成整扑一将的癞子数量
            num = self.getBaoNumToZhengPuJiang_ZhouKou(sptArr[4])
            if leftBaoNum >= num:
                return True

        return False

    # 万,筒,条,风,成为顺子或者三同需要的癞子数量
    def getNeedBaoNumToZhengPu_ZhouKou(self, mjArr):
        subArr = []
        subArr.extend(mjArr)
        length = len(subArr) #//牌的张数
        if length == 0:
            return 0
        elif length == 1:
            return 2
        elif length == 2:
            t = subArr[0] / 100  # 万筒条风类型
            if t == 4:  # 风
                if subArr[1] == subArr[0]:  # 只有是对子才能凑成三同
                    return 1
                else:
                    return 4
            else:
                # // 万, 筒, 条
                d = subArr[1] - subArr[0]  # // subArr是已经经过排序的
                if d <= 2:  # // 1万1万, 1万2万, 1万3万
                    return 1
                else:  # // 1万4万
                    return 4
        else:
            # // 3张以上万筒条或风
            # // ++++++++必须从小到大排序后, 先去3同, 再去3连, 再去2同, 再去2连,
            # // ++++++++++++++++++++++++或 先去3连, 再去3同, 再去2同, 再去2连,
            # // ++++++++++++++++++++++++求所有情况的最小值
            #  这些最容易形成整扑的去掉后, 然后剩下牌两个一组分割算需要癞子数,
            # 这才能得到最少的癞子数量 + +++++++++
            # // 1, 分离3同

            sub3SameArr = self.separate3Same(subArr)
            if len(sub3SameArr) <= 2:  # // 去除3同后剩余牌数 <= 2, 直接结束
                return self.getNeedBaoNumToZhengPu_ZhouKou(sub3SameArr)

            t = subArr[0] / 100  # // 万筒条风类型
            if t == 4:  # //风   # //2,分离2同
                needCount = 0
                sub3SameArr, duiZiNum = self.separate2Same(sub3SameArr)
                needCount += duiZiNum
                needCount += len(sub3SameArr) * 2 #风凑不成对 一张就需要两个宝牌
                return needCount
            else:  # //万或筒或条  //2,分离3连
                need3SameCount = 0
                need3LianCount = 0
                #先去3同, 再去3连, 再去2同, 再去2连,
                sub3SameArr, _ = self.separate3Lian(sub3SameArr)
                l = len(sub3SameArr)
                if l <= 2:
                    need3SameCount = self.getNeedBaoNumToZhengPu_ZhouKou(sub3SameArr)
                else:

                    # // 3, 分离2同和2连(相当于只需要1癞子就能成的牌都去掉)
                    sub3SameArr, canLianOrSameNum, _ = self.separate2LianAnd2Same(sub3SameArr, -1, False)
                    # // 有多少个对子或2连就需要多少个癞子把它变整扑
                    need3SameCount += canLianOrSameNum
                    # // 剩下的每一张单牌都需要两个癞子
                    need3SameCount += len(sub3SameArr) * 2
                #<-------------------------------------------------------------->
                #//先去3连, 再去3同, 再去2同, 再去2连,
                sub3LianArr, _ = self.separate3Lian(subArr)
                sub3LianArr = self.separate3Same(sub3LianArr)
                l = len(sub3LianArr)
                if l <= 2:
                    need3LianCount = self.getNeedBaoNumToZhengPu_ZhouKou(sub3LianArr)
                else:
                    need3LianCount = 0
                    # // 3, 分离2同和2连(相当于只需要1癞子就能成的牌都去掉)
                    sub3LianArr, canLianOrSameNum, _ = self.separate2LianAnd2Same(sub3LianArr, -1, False)
                    # // 有多少个对子或2连就需要多少个癞子把它变整扑
                    need3LianCount += canLianOrSameNum
                    # // 剩下的每一张单牌都需要两个癞子
                    need3LianCount += len(sub3LianArr) * 2
                #取最小值
                if need3SameCount <= need3LianCount:
                    return need3SameCount
                else:
                    return need3LianCount

    # 万,筒,条,风,成为整扑一将需要的最少癞子数量
    def getBaoNumToZhengPuJiang_ZhouKou(self, mjArr):
        arr = []
        arr.extend(mjArr)
        if len(arr) <= 0:  # //如果数组为空,至少需要2个癞子组成一对将
            return 2

        #// 寻找对子  #先去掉顺子的影响
        t = arr[0] / 100  #//万筒条风类型
        a = []
        if t == 4:
            a = self.separate2Same(arr)
            return len(a) #出去二同之后没剩下一张就需要一个癞子
        else:
            needMainCount = 14
            a.extend(arr)
            for i in range(0, len(a)):
                if(a[i] != 0):
                    b = []
                    needCount = 0
                    if len(arr) - 1 == i: #最后一张牌
                        b.extend(arr[:i]) #把这张牌当将 计算剩下的牌需要几张癞子
                        needCount = 1 + self.getNeedBaoNumToZhengPu_ZhouKou(b)
                    elif arr[i] == arr[i + 1]:  # 找到对子了
                        b.extend(arr[:i])
                        b.extend(arr[i + 2:])  #计算剩下的牌需要几张癞子
                        a[i] = 0     #找到到对子就置0，避免多余的运算
                        a[i+1] = 0
                        needCount = self.getNeedBaoNumToZhengPu_ZhouKou(b)
                    else:  #没找到 把这张牌当将 计算剩下的牌需要几张癞子
                        b.extend(arr[:i])  # 把这张牌当将 计算剩下的牌需要几张癞
                        b.extend(arr[i + 1:])
                        needCount = 1 + self.getNeedBaoNumToZhengPu_ZhouKou(b)
                    if needCount == 0:
                        return needCount
                    if needCount <= needMainCount:
                        needMainCount = needCount
            return needMainCount


    # 分离2同以及2连(万筒条,适用):返回去除后的数组,以及2同2连数量
    def separate2LianAnd2Same(self, mjArr, bao, isGeneShunZi):
        arr = []
        arr.extend(mjArr)
        shunZi = []
        # 之前已经去除了对子, 所以这里不用考虑对子
        isShun = False
        canlianOrSameNum = 0
        l = len(arr)
        for i in range(0,l):
            if arr[i] != 0 and i <= l - 2:
                d = arr[i + 1] - arr[i]
                if isGeneShunZi:
                    if d == 1:
                        shunZi.extend([arr[i], arr[i + 1], bao])
                    elif d == 2:
                        shunZi.extend([arr[i], bao, arr[i + 1]])
                if d <= 2:
                    arr[i] = 0
                    arr[i + 1] = 0
                    isShun = True
                    canlianOrSameNum += 1
        if isShun:
            r = []
            for v in arr:
                if v != 0:
                    r.append(v)
            return r, canlianOrSameNum, shunZi
        else:
            return arr, 0, shunZi

    # 分离2连(万筒条,适用):返回去除后的数组,以及2连数量(去除了3连后,再来调用2连)
    # 不需要生成顺子时,宝传 -1
    def separate2Lian(self, mjArr, bao, isGeneShunZi):
        arr = []
        arr.extend(mjArr)
        shunZi = []
        # 之前已经去除了对子, 所以这里不用考虑对子
        isShun = False
        canlianOrSameNum = 0
        l = len(arr)
        for i in range(0, l):
            if arr[i] != 0 and i <= l - 2:
                sub = arr[i + 1] - arr[i]
                if isGeneShunZi:
                    if sub == 1:
                        shunZi.extend([arr[i], arr[i + 1], bao])
                    elif sub == 2:
                        shunZi.extend([arr[i], bao, arr[i + 1]])
                if sub == 1 or sub == 2:
                    arr[i] = 0
                    arr[i + 1] = 0
                    isShun = True
                    canlianOrSameNum += 1
        if isShun:
            r = []
            for v in arr:
                if v != 0:
                    r.append(v)
            return r, canlianOrSameNum, shunZi
        else:
            return arr, 0, shunZi

    # 分离顺子(针对万条筒):返回顺子
    def separate3Lian(self, mjArr):
        arr = []
        arr.extend(mjArr)
        shunZi = []
        isShun = False
        for i in range(0, len(arr)):
            if i <= len(arr) - 3:  # //前3张无对子的情况下(101,102,103)
                if arr[i + 1] == arr[i] + 1 and arr[i + 2] == arr[i] + 2:
                    shunZi.extend([arr[i], arr[i + 1], arr[i + 2]])
                    arr[i] = 0
                    arr[i + 1] = 0
                    arr[i + 2] = 0
                    isShun = True
                    break
            if i <= len(arr) - 4:  # //前3张有对子的情况下(101,102,102,103)
                if arr[i + 1] == arr[i] + 1 and arr[i + 3] == arr[i] + 2:
                    shunZi.extend([arr[i], arr[i + 1], arr[i + 3]])
                    arr[i] = 0
                    arr[i + 1] = 0
                    arr[i + 3] = 0
                    isShun = True
                    break
        if isShun:
            r = []
            for v in arr:
                if v != 0:
                    r.append(v)
            a, s = self.separate3Lian(r)

            shunZi.extend(s)
            return a, shunZi
        else:
            return arr, shunZi

    # 分离对子(万筒条, 风, 都适用):返回去除后的数组,以及对子数量, 当然在当前场景下, 只用来去除风的对子
    def separate2Same(self, mjArr):
        arr = []
        arr.extend(mjArr)
        isSame = False  # 是否一样
        duiZiNum = 0
        for i in range(0, len(arr)):
            if arr[i] != 0 and i <= len(arr) - 2:
                if arr[i] == arr[i + 1]:
                    arr[i] = 0
                    arr[i + 1] = 0
                    isSame = True
                    duiZiNum += 1
        if isSame:
            r = []
            for v in arr:
                if v != 0:
                    r.append(v)
            return r,duiZiNum
        else:
            return arr, 0

    # 分离3同(万筒条,风,都适用)
    def separate3Same(self, mjArr):
        arr = []
        arr.extend(mjArr)
        isSame = False  # 是否一样
        duiZiNum = 0
        for i in range(0, len(arr)):
            if arr[i] != 0 and i <= len(arr) - 3:
                if arr[i] == arr[i + 2]:
                    arr[i] = 0
                    arr[i + 1] = 0
                    arr[i + 2] = 0
                    isSame = True
                    duiZiNum += 1
        if isSame:
            r = []
            for v in arr:
                if v != 0:
                    r.append(v)
            return r
        else:
            return arr

    # 分割 宝,万,筒,条,风：返回分割后的结果
    def seperateArr(self, mjArr, bao):
        res = [[],[],[],[],[]]
        for mj in mjArr:
            index = mj / 100
            # 宝牌是花牌
            if bao > 500:
                if index == 5:
                    res[0].append(mj)
                else:
                    res[index].append(mj)
            else:
                if index == 5: #//此时花牌处理成宝的本位牌
                    i = bao / 100
                    res[i].append(bao)
                else:
                    if mj == bao:
                        res[0].append(bao)
                    else:
                        res[index].append(mj)
        return res


