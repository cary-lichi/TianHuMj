/**Created by the LayaAirIDE,do not modify.*/
package ui.MahjongRoot {
	import laya.ui.*;
	import laya.display.*; 

	public class VIPhallPageUI extends View {
		public var m_imgBg:Image;
		public var m_imgTop:Image;
		public var m_imgTitle:Image;
		public var m_btnBack:Button;
		public var m_imgContent:Image;
		public var m_boxContent:Box;
		public var m_createRoom:Button;
		public var m_tip:Label;
		public var m_boxHRBplay:Box;
		public var m_label1:Label;
		public var m_1_1:Label;
		public var m_1_2:Label;
		public var m_1_3:Label;
		public var m_2_1:Label;
		public var m_2_2:Label;
		public var m_2_3:Label;
		public var m_3_1:Label;
		public var m_3_2:Label;
		public var m_cbHZDB:CheckBox;
		public var m_cbHZSS:CheckBox;
		public var m_cbGDF:CheckBox;
		public var m_cbDB:CheckBox;
		public var m_cbZJFB:CheckBox;
		public var m_cbSQBSJ:CheckBox;
		public var m_cbDDSJ:CheckBox;
		public var m_cbYPDX:CheckBox;
		public var m_label2:Label;
		public var m_4_1:Label;
		public var m_4_2:Label;
		public var m_radioHRB:RadioGroup;
		public var m_boxMDJplay:Box;
		public var n_label1:Label;
		public var n_1_1:Label;
		public var n_1_2:Label;
		public var n_1_3:Label;
		public var n_2_1:Label;
		public var n_2_2:Label;
		public var n_2_3:Label;
		public var n_3_1:Label;
		public var m_cbMypdx:CheckBox;
		public var m_cbMdb:CheckBox;
		public var m_cbMxd:CheckBox;
		public var m_cbMhzmtf:CheckBox;
		public var m_cbMdf:CheckBox;
		public var m_cbMdk:CheckBox;
		public var m_cbMzfb:CheckBox;
		public var n_label2:Label;
		public var n_4_1:Label;
		public var n_4_2:Label;
		public var m_radioMDJ:RadioGroup;
		public var m_RadioGamerNum:RadioGroup;
		public var m_lable3:Label;
		public var m_RadioNum:RadioGroup;
		public var m_5_0_1:Radio;
		public var m_5_0_2:Radio;
		public var m_6_1:Label;
		public var m_6_2:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1136,"var":"m_imgBg","skin":"common/img_conBigBg.png","sizeGrid":"0,0,0,0","height":640},"child":[{"type":"Image","props":{"y":1,"width":1136,"var":"m_imgTop","skin":"common/img_conBigBg1.png","sizeGrid":"5,50,40,50","height":55,"centerX":0},"child":[{"type":"Image","props":{"x":399,"var":"m_imgTitle","skin":"createjoinroom/img_title.png","centerY":0,"centerX":0}},{"type":"Button","props":{"x":20,"var":"m_btnBack","skin":"common/btn_back.png","centerY":0}}]},{"type":"Image","props":{"y":60,"width":1120,"var":"m_imgContent","skin":"createjoinroom/img_textBg.png","height":575,"centerX":0}}]},{"type":"Box","props":{"width":1136,"var":"m_boxContent","name":"content","mouseThrough":true,"height":640,"centerY":0,"centerX":0},"child":[{"type":"Button","props":{"y":520,"x":482,"var":"m_createRoom","skin":"common/btn_Bg.png"},"child":[{"type":"Label","props":{"y":3,"x":1,"width":174,"valign":"middle","text":"创建房间","strokeColor":"#3b7204","stroke":2,"height":59,"fontSize":30,"font":"SimHei","color":"#ffffff","align":"center"}}]},{"type":"Label","props":{"y":603,"x":360,"var":"m_tip","text":"注：房卡在开始游戏后扣除，提前解散不扣房卡","fontSize":20,"font":"SimHei","color":"#a86148"}},{"type":"Box","props":{"y":76,"x":60,"visible":false,"var":"m_boxHRBplay","name":"item0"},"child":[{"type":"Label","props":{"y":20,"x":3,"var":"m_label1","text":"玩   法：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":0,"x":240,"var":"m_1_1","text":"红中当宝","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":470,"var":"m_1_2","text":"红中算色","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":695,"var":"m_1_3","text":"刮大风","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":920,"var":"m_2_1","text":"对宝","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":240,"var":"m_2_2","text":"庄家翻倍","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":470,"var":"m_2_3","text":"边胡","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":695,"var":"m_3_1","text":"单吊算夹","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":920,"var":"m_3_2","text":"一炮多响","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"CheckBox","props":{"y":-4,"x":195,"var":"m_cbHZDB","stateNum":3,"skin":"common/check.png","selected":true,"name":"hzdb"}},{"type":"CheckBox","props":{"y":-4,"x":420,"var":"m_cbHZSS","skin":"common/check.png","selected":true,"name":"hzss"}},{"type":"CheckBox","props":{"y":-4,"x":645,"var":"m_cbGDF","skin":"common/check.png","selected":true,"name":"gdf"}},{"type":"CheckBox","props":{"y":-4,"x":870,"var":"m_cbDB","skin":"common/check.png","selected":true,"name":"db"}},{"type":"CheckBox","props":{"y":60,"x":195,"var":"m_cbZJFB","skin":"common/check.png","name":"zjfb"}},{"type":"CheckBox","props":{"y":60,"x":420,"var":"m_cbSQBSJ","skin":"common/check.png","name":"bh"}},{"type":"CheckBox","props":{"y":60,"x":645,"var":"m_cbDDSJ","skin":"common/check.png","name":"ddsj"}},{"type":"CheckBox","props":{"y":60,"x":870,"var":"m_cbYPDX","skin":"common/check.png","name":"ypdx"}}]},{"type":"Label","props":{"y":140,"var":"m_label2","text":"胡   牌：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":2,"x":240,"var":"m_4_1","text":"胡死夹","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":470,"var":"m_4_2","text":"传统胡法","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"RadioGroup","props":{"y":-7,"x":195,"var":"m_radioHRB","selectedIndex":0},"child":[{"type":"Radio","props":{"skin":"common/radio.png","name":"item0"}},{"type":"Radio","props":{"x":230,"skin":"common/radio.png","name":"item1"}}]}]}]},{"type":"Box","props":{"y":76,"x":60,"visible":false,"var":"m_boxMDJplay","name":"item1"},"child":[{"type":"Label","props":{"y":20,"x":2,"var":"n_label1","text":"玩   法：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":0,"x":240,"var":"n_1_1","text":"一炮多响","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":470,"var":"n_1_2","text":"对宝","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":695,"var":"n_1_3","text":"下蛋","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":240,"var":"n_2_1","text":"刮大风","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":470,"var":"n_2_2","text":"大扣","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":0,"x":920,"var":"n_2_3","text":"红中满天飞","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":64,"x":695,"width":72,"var":"n_3_1","text":"庄翻倍","height":24,"fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"CheckBox","props":{"y":-4,"x":195,"var":"m_cbMypdx","skin":"common/check.png","selected":true,"name":"ypdx"}},{"type":"CheckBox","props":{"y":-4,"x":420,"var":"m_cbMdb","skin":"common/check.png","selected":true,"name":"db"}},{"type":"CheckBox","props":{"y":-4,"x":645,"var":"m_cbMxd","skin":"common/check.png","selected":true,"name":"xd"}},{"type":"CheckBox","props":{"y":-4,"x":870,"var":"m_cbMhzmtf","skin":"common/check.png","selected":true,"name":"hzmtf"}},{"type":"CheckBox","props":{"y":60,"x":195,"var":"m_cbMdf","skin":"common/check.png","name":"df"}},{"type":"CheckBox","props":{"y":60,"x":420,"var":"m_cbMdk","skin":"common/check.png","name":"dk"}},{"type":"CheckBox","props":{"y":60,"x":645,"var":"m_cbMzfb","skin":"common/check.png","name":"zfb"}}]},{"type":"Label","props":{"y":140,"var":"n_label2","text":"胡   牌：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":2,"x":240,"var":"n_4_1","text":"胡死夹","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":470,"var":"n_4_2","text":"传统胡法","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"RadioGroup","props":{"y":-7,"x":195,"var":"m_radioMDJ","selectedIndex":0},"child":[{"type":"Radio","props":{"skin":"common/radio.png","name":"item0"}},{"type":"Radio","props":{"x":230,"skin":"common/radio.png","name":"item1"}}]}]}]},{"type":"Label","props":{"y":278,"x":59,"text":"人   数：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":2,"x":245,"text":"4人","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":475,"text":"3人","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":700,"text":"2人","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"RadioGroup","props":{"y":-7,"x":195,"var":"m_RadioGamerNum","selectedIndex":0},"child":[{"type":"Radio","props":{"skin":"common/radio.png","name":"item0"}},{"type":"Radio","props":{"x":230,"skin":"common/radio.png","name":"item1"}},{"type":"Radio","props":{"x":450,"skin":"common/radio.png","name":"item2"}}]}]},{"type":"Label","props":{"y":347,"x":58,"var":"m_lable3","text":"局   数：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":2,"x":245,"text":"4局","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":475,"text":"8局","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":2,"x":700,"text":"12局","fontSize":24,"font":"SimHei","color":"#91592a"}},{"type":"RadioGroup","props":{"y":-7,"x":195,"var":"m_RadioNum","selectedIndex":0},"child":[{"type":"Radio","props":{"var":"m_5_0_1","skin":"common/radio.png","name":"item0"}},{"type":"Radio","props":{"y":0,"x":230,"var":"m_5_0_2","skin":"common/radio.png","name":"item1"}},{"type":"Radio","props":{"y":1,"x":450,"skin":"common/radio.png","name":"item2"}}]}]},{"type":"Label","props":{"y":412,"x":57,"var":"m_6_1","text":"消   耗：","fontSize":28,"font":"SimHei","color":"#91592a"},"child":[{"type":"Label","props":{"y":0,"x":260,"var":"m_6_2","text":"x2","fontSize":28,"font":"SimHei","color":"#91592a"}},{"type":"Image","props":{"y":-6,"x":195,"width":40,"skin":"common/img_diamonds.png","height":40}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}