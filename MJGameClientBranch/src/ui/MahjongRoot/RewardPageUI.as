/**Created by the LayaAirIDE,do not modify.*/
package ui.MahjongRoot {
	import laya.ui.*;
	import laya.display.*; 
	import laya.html.dom.HTMLDivElement;

	public class RewardPageUI extends View {
		public var m_btnBack:Button;
		public var m_lableCardNum:Label;
		public var m_tab:Tab;
		public var m_viewStack:ViewStack;
		public var m_list:List;
		public var m_Success:Image;
		public var m_lableSuccess:Label;
		public var m_tipNoCard:Image;
		public var m_btnReceive:Button;
		public var m_boxMa:Box;
		public var m_imgMaW:Image;
		public var m_btnAddCard:Button;
		public var m_boxCard:Box;
		public var m_imgCardW:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"name":"content","height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"reward/img_bg.png"}},{"type":"Box","props":{"y":0,"x":0},"child":[{"type":"Button","props":{"y":4,"x":20,"var":"m_btnBack","skin":"common/btn_back.png"}},{"type":"Image","props":{"y":80,"x":422,"width":60,"skin":"common/img_diamonds.png","height":60},"child":[{"type":"Label","props":{"y":11,"x":77,"width":95,"var":"m_lableCardNum","text":"888","height":34,"fontSize":34,"font":"SimHei","color":"#fcf2bc  ","align":"center"}}]},{"type":"Image","props":{"y":210,"x":21,"skin":"reward/img_frame.png"}},{"type":"Tab","props":{"y":154,"x":65,"var":"m_tab","selectedIndex":0},"child":[{"type":"Button","props":{"y":0,"x":0,"skin":"reward/btn_record.png","name":"item0"}},{"type":"Button","props":{"y":0,"x":212,"skin":"reward/btn_rule.png","name":"item1"}}]},{"type":"ViewStack","props":{"y":231,"x":54,"var":"m_viewStack","selectedIndex":0},"child":[{"type":"Box","props":{"y":7,"x":-11,"name":"item0"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"reward/img_bgBox.png"}},{"type":"Label","props":{"x":120,"valign":"middle","text":"邀请时间","height":60,"fontSize":28,"font":"SimHei","color":"#d1642e","align":"center"}},{"type":"Label","props":{"y":0,"x":458,"valign":"middle","text":"好友昵称","height":60,"fontSize":28,"font":"SimHei","color":"#d1642e","align":"center"}},{"type":"Label","props":{"y":0,"x":880,"valign":"middle","text":"状态","height":60,"fontSize":28,"font":"SimHei","color":"#d1642e","align":"center"}},{"type":"List","props":{"y":60,"x":0,"width":1053,"var":"m_list","height":296}}]},{"type":"Box","props":{"y":-8,"x":21,"name":"item1"},"child":[{"type":"HTMLDivElement","props":{"width":1000,"innerHTML":"<div style=\"width:1000px; height: 400px; line-height:46px;font-size:24px;font:SimHei; color: #3f2102;\"> \t\t\t<span style=\" font-size:26px;color: #991207;\">游戏房卡</span><br> \t\t\t<span>成功邀请新玩家注册并游戏6局 </span><br> \t\t\t<span>活动时间：2017年4月29号起 </span><br> \t\t\t<span style=\"font-size:26px;color: #991207;\">约局技巧</span><br> \t\t\t<span> 1.分享游戏给好友  </span><br> \t\t\t<span>2.邀请周围的牌友，一起打牌 </span><br> \t\t\t<span>3.亲戚朋友聚会时，邀请它们一起玩游戏 </span><br> \t\t\t<span>4.亲戚群、朋友群、同学群、同事群，合理运用身边的资源 </span><br> \t\t</div>","height":380}}]}]},{"type":"Image","props":{"y":292,"x":372,"visible":false,"var":"m_Success","skin":"common/img_successBg.png"},"child":[{"type":"Label","props":{"y":16,"x":-54,"wordWrap":true,"width":500,"var":"m_lableSuccess","text":"领取成功","fontSize":24,"font":"SimHei","color":"#f1f1f1","align":"center"}}]},{"type":"Image","props":{"y":173,"x":224,"width":687,"visible":false,"var":"m_tipNoCard","skin":"common/img_tipsBg.png","sizeGrid":"20,25,30,25","height":111},"child":[{"type":"Image","props":{"y":-10,"x":-50,"skin":"common/img_bawan.png"}},{"type":"Label","props":{"y":40,"x":65,"text":"暂时没有可领取房卡，快去邀请朋友呀o(^▽^)o","fontSize":28,"font":"SimHei","color":"#915400"}}]},{"type":"Button","props":{"y":81,"x":610,"width":109,"var":"m_btnReceive","skin":"common/btn_Bg.png","height":54},"child":[{"type":"Label","props":{"y":15,"x":30,"text":"领取","strokeColor":"#3b7204","stroke":2,"fontSize":24,"font":"SimHei","color":"#ffffff"}}]},{"type":"Image","props":{"y":11,"x":774,"width":140,"skin":"common/img_dise.png","height":35},"child":[{"type":"Image","props":{"y":-3,"x":-20,"width":40,"skin":"common/img_ma.png","height":40}},{"type":"Box","props":{"y":6,"x":29,"var":"m_boxMa"},"child":[{"type":"Clip","props":{"y":0,"x":0,"skin":"common/clip.png","name":"item0","index":0,"clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":16,"skin":"common/clip.png","name":"item1","index":0,"clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":32,"skin":"common/clip.png","name":"item2","index":0,"clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":48,"skin":"common/clip.png","name":"item3","index":0,"clipY":1,"clipX":11}},{"type":"Image","props":{"y":-2,"x":63,"var":"m_imgMaW","skin":"common/img_w.png"}}]}]},{"type":"Image","props":{"y":11,"x":956,"width":140,"skin":"common/img_dise.png","height":35},"child":[{"type":"Image","props":{"y":-2,"x":-24,"width":40,"skin":"common/img_diamonds.png","height":40}},{"type":"Button","props":{"y":-3,"x":120,"var":"m_btnAddCard","skin":"common/btn_add.png"}},{"type":"Box","props":{"y":6,"x":27,"var":"m_boxCard"},"child":[{"type":"Clip","props":{"skin":"common/clip.png","name":"item0","clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":16,"skin":"common/clip.png","name":"item1","clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":32,"skin":"common/clip.png","name":"item2","clipY":1,"clipX":11}},{"type":"Clip","props":{"y":0,"x":48,"skin":"common/clip.png","name":"item3","clipY":1,"clipX":11}},{"type":"Image","props":{"y":-2,"x":64,"var":"m_imgCardW","skin":"common/img_w.png"}}]}]}]}]};
		override protected function createChildren():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			super.createChildren();
			createView(uiView);

		}

	}
}