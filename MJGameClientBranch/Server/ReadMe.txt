引擎版本：Laya Air 1.7.13
IDE版本 1.7.13
开发分辨率：1136*640
备注：之前分辨率说错了，修改了之后按钮位置不对，由于UI还没有发过来，所以暂时未作修改。


/******************牌的数据********************/
0canPai x:8 y:1 width:49 height:57 skewx:-8
0gangPai x:8 y:1 width:49 height:57 skewx:-8
0putPai x:0 y:0 width:39 height:40

1canPai x:3 y:29 width:32 height:48 skewy:20 rotation:-90
1gangPai x:3 y:29 width:32 height:48 skewy:20 rotation:-90
1putPai x:4 y:28 width:27 height:45 skewx:2 skewy:-5 rotation:-90

2canPai x:44 y:26 width:33 height:28 skewx:16 rotation:180
2gangPai x:46 y:26 width:33 height:28 skewx:16 rotation:180
2putPai x:32 y:29 width:33 height:30 rotation:180


3canpai x:55 y:0 width:32 height48 skewy:-20 rotation:90
3gangpai x:64 y:0 width:32 height48 skewy:-20 rotation:90
3putPai x:47 y:2 width:27 height:45 skewx:-2 skewy:5 rotation:90

/**************************************/

/*******************JSON的解释*******************/

"goods注释":{
	"desc":"商品的名称",
	"type":{"解释":"商品类型","1":"房卡",
				 "2":"金币"},
《——————img_type_1.png——————》

	"title":"商品的标题",
《——————img_title_2.png——————》

	"content":{"解释":"商品的内容",
				"1":"2圈",
			   "2":"4圈",
			   "3":"8圈",
			   "4":"3万",
			   "5":"6万",
			   "6":"8万",
			   "7":"12万",
			   "8":"52.1万"},

《——————img_content_2.png—img_txt_2.png—————》

	"money":{"解释":"商品购买按钮",
				"1":"3元",
				 "2":"6元",
				 "3":"8元",
				 "4":"12元",
				 "5":"52.1元",
				 "6":"60元",
				"7":"178元"}},
《——————btn_2.png——————》

/*************************************************/

 //  0       |   中   1   发2  白3
 //          |
 //  1       |   东 1 西2  南 3    北4
 //          |
 //  2       |   一万  二万  ……  九万
 //          |
 //  3       |   一条  二条  ……  九条
 //          |
 //  4       |   一饼  二饼  ……  九饼

/**************************音效命名规则*****************************/

pai_t(牌的类型)_v(牌的值)
pai_t2_v1.ogg

////其他音效按单词（拼音）命名，规则在config.json里面写/////
g_(内容)
g_chi.ogg

/*****************************************************/