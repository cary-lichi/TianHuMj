#-*-coding:utf-8-*-
'''
逻辑玩家类
'''

## 吃牌顺
# //  m_Type      m_Value
# //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-//
# //  0       |   中   1   发2  白3
# //          |
# //  1       |   东 1 西2  南 3    北4
# //          |
# //  2       |   一万  二万  ……  九万
# //          |
# //  3       |   一条  二条  ……  九条
# //          |
# //  4       |   一饼  二饼  ……  九饼
# //          |
# //  5       |   春       夏       秋       东       竹       兰       梅       菊
# //          |
# //-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-//

class stGangAI:
    def __init__(self):##牌类型，牌字
       self.nType = None
       self.nValue = None
       self.nGangState = 0#0:暗杠，1：自摸明杠 2：明杠

