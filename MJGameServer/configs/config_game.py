#-*-coding:utf-8-*-
'''
统计所有错误的可能性
'''
config_game={
    "gameplay": {#玩法基本结构，id=》房间类型，可选玩法=》玩法
        "common":
            {#周口玩法
               "id":1,
               "optionals":
                   {
                       "zimo": 101,  # 自摸
                       "dianpao": 102,  # 点炮
                   }
            },
        "dongbei":
            {#东北玩法
                "id":2,
                "optionals":
                    {
                        "zimo": 201,  # 自摸
                        "dianpao": 202,  # 点炮
                        "bao": 203,  # 摸宝
                        "baozhongbao": 204  # 宝中宝
                    }
            },
        "haerbin_common":
            {  # 哈尔滨传统玩法
                "id": 3,
                "optionals":
                    {
                        "hongzhong": 301  # 红中满天飞
                    }
            },
        "haerbin_jiahu":
            {  # 哈尔滨夹胡玩法
                "id": 4,
                "optionals":
                    {
                        "hongzhongbao": 401,  # 红中当宝
                        "hongzhong": 402,  # 红中满天飞
                        "dafeng": 403,  # 刮大风
                        "duibao": 404,  # 对宝
                        "bianhu": 405,  # 边胡
                        "dandiao":406,  # 单吊算夹：听牌时，只能胡一张牌，按夹胡算
                        "zhuang": 407,  # 庄家翻倍
                        "duoxiang": 408,  # 一炮多响
                    }
            },
        "mudanjiang_common":
            {  # 牡丹江传统玩法
                "id": 5,
                "optionals":
                    {
                        "hongzhong": 501  # 红中满天飞
                    }
            },
        "mudanjiang_jiahu":
            {  # 牡丹江夹胡玩法
                "id": 6,
                "optionals":
                    {
                        "duibao": 601,  # 对宝
                        "dafeng": 602,  # 刮大风
                        "dakou": 603,  # 大扣
                        "xiadan": 604,  # 下蛋
                        "hongzhong": 605,  # 红中满天飞
                        "zhuang": 606,  # 庄家翻倍
                        "duoxiang": 607,  # 一炮多响
                    }
            },
        "happy":
            {  # 欢乐场玩法
                "id": 7,
                "optionals":
                    {
                        "hongzhong": 501  # 红中满天飞
                    }
            }
    },
    'position': [  # 玩家位置
         0,  # 东：
         1,  # 南：
         2,  # 西：
         3  # 北：
    ],
    'maxGamer': 4,
    'MJ':{
        'MJPAI_ZFB':0, #中，发，白
        'MJPAI_FENG':1,#东西南北风
        'MJPAI_WAN':2,#万
        'MJPAI_TIAO':3,#条
        'MJPAI_BING':4,#饼
        'MJPAI_HUA':5,#花
        'MJPAI_GETPAI':True,#起牌
        'MJPAI_PUTPAI':False#打牌
    },
    "roomType": {
        "common": 1,
        "fangka": 2
    },
    "roomState": {
        "ready": 0,#未开始
        "doing": 1,#战斗进行中
        "ending": 2,#结算进行中
        "disable": 3,  # 禁入不可用
    },
    "putPaiState": {
        "normal": 0,  # 正常打牌
        "moting": 1,  # 摸听打牌
        "qiangting": 2,  # 抢听打牌
    },
    "gangState": {
        "an": 0,  # 暗杠
        "zmming": 1,  # 自摸明杠
        "ming": 2,  # 正常明杠
    },
    "initScore": 500,#初始每个玩家50分
    "rookieAward": {#新手奖励道具
        "1": 1,
        "2": 1
    },
    "rookieIAward": {  # 邀请者奖励道具
        "2": 2
    },
    "authAward": {  # 邀请者奖励道具
        "2": 2
    },
    "jieSuanState": {
        "zimo": 0,  # 结算类型，自摸
        "hupai": 1,  # 胡牌（别人点炮）
        "ting": 2,  # 听
        "tingpao": 3,  # 听点炮
        "unting": 4,  # 不听
        "untingpao": 5,  # 不听点炮
        "bao": 6,  # 摸宝
        "baozhongbao": 7,  # 宝中宝
        "dafeng": 8  # 大风
    },
    "canType": {  # can牌类型
        "zmhu": 1,
        "zmting": 2,
        "zmgang": 3,  # 宝
        "other": 4  # 大风
    },
    "canLastBaoType": {#can牌通知胡的类型
        "normal":0,
        "bao": 1,  # 宝
        "dafeng": 2,  # 大风
    },
    "gamerState": {#玩家游戏状态
        "ready": 0,  # 准备
        "doing": 1,  # 战斗进行中
        "ending": 2,  # 结算进行中
        "join": 3,  # 未开始
    },
    "gamerRank": {  # 玩家排名类型
        "day": 0,  # 日
        "week": 1,  # 周
        "month": 2,  # 月
        "year": 3  # 年
    },
    "gamerRankCount": 100,
    "gamerRankAwards": [
         [
             {'min':1,'max':1,'award':10,'aType':1},
             {'min': 2, 'max': 2, 'award': 8, 'aType': 1},
             {'min': 3, 'max': 3, 'award': 6, 'aType': 1},
             {'min': 4, 'max': 10, 'award': 4, 'aType': 1},
             {'min': 11, 'max': 20, 'award': 2, 'aType': 1},
             {'min': 21, 'max': 50, 'award': 15000, 'aType': 2},
             {'min': 50, 'max': 100, 'award': 8800, 'aType': 2}
         ],
        [
            {'min': 1, 'max': 1, 'award': 50, 'aType': 1},
            {'min': 2, 'max': 2, 'award': 40, 'aType': 1},
            {'min': 3, 'max': 3, 'award': 30, 'aType': 1},
            {'min': 4, 'max': 10, 'award': 20, 'aType': 1},
            {'min': 11, 'max': 20, 'award': 10, 'aType': 1},
            {'min': 21, 'max': 50, 'award': 6, 'aType': 1},
            {'min': 50, 'max': 100, 'award': 60000, 'aType': 2}
        ],
        [
            {'min': 1, 'max': 1, 'award': 300, 'aType': 1},
            {'min': 2, 'max': 2, 'award': 240, 'aType': 1},
            {'min': 3, 'max': 3, 'award': 180, 'aType': 1},
            {'min': 4, 'max': 10, 'award': 120, 'aType': 1},
            {'min': 11, 'max': 20, 'award': 60, 'aType': 1},
            {'min': 21, 'max': 50, 'award': 36, 'aType': 1},
            {'min': 50, 'max': 100, 'award': 360000, 'aType': 2}
        ],
        [
            {'min': 1, 'max': 1, 'award': 300, 'aType': 1},
            {'min': 2, 'max': 2, 'award': 240, 'aType': 1},
            {'min': 3, 'max': 3, 'award': 180, 'aType': 1},
            {'min': 4, 'max': 10, 'award': 120, 'aType': 1},
            {'min': 11, 'max': 20, 'award': 60, 'aType': 1},
            {'min': 21, 'max': 50, 'award': 36, 'aType': 1},
            {'min': 50, 'max': 100, 'award': 360000, 'aType': 2}
        ]
    ],
    "timeout": 25,#出牌时间
    "timetick": 1000,
    "addAITime": 5000,#添加机器人倒计时毫秒
    "aiReadTime": 4000,#机器人准备倒计时毫秒
    "aiPutTime": 5000,#机器人出牌倒计时毫秒
    "readyTime": 40000,#准备倒计时毫秒
    "aiInfoCount": 24,
    "aiHeadCount": 10,
    "happyExchange": 500#欢乐城积分兑换
}