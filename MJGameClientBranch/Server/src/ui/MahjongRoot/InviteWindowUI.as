/**Created by the LayaAirIDE,do not modify.*/
package ui.MahjongRoot {
	import laya.ui.*;
	import laya.display.*; 

	public class InviteWindowUI extends View {
		public var btn_close:Button;
		public var m_btnWX:Button;
		public var m_btnPyq:Button;
		public var m_labelCode:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1136,"skin":"common/img_blankBg.png","sizeGrid":"2,2,2,2","height":640}},{"type":"Box","props":{"y":102,"x":262,"name":"content"},"child":[{"type":"Image","props":{"y":35,"width":600,"skin":"common/img_bomb boxBg.png","sizeGrid":"75,75,75,75","height":400},"child":[{"type":"Image","props":{"y":-47,"x":114,"skin":"common/img_popupBg.png"}}]},{"type":"Button","props":{"y":5,"x":550,"var":"btn_close","skin":"common/btn_close.png"}},{"type":"Image","props":{"x":230,"skin":"gameHall/img_title_share.png"}},{"type":"Label","props":{"y":85,"x":200,"text":"你的邀请码：","fontSize":25,"font":"SimHei","color":"#b24821"}},{"type":"Label","props":{"y":120,"x":117,"width":387,"text":"(填写邀请码即可获取钻石)","height":25,"fontSize":25,"font":"SimHei","color":"#dd4f16","align":"center"}},{"type":"Label","props":{"y":330,"x":380,"text":"朋友圈","fontSize":30,"font":"SimHei","color":"#b24821"}},{"type":"Label","props":{"y":330,"x":135,"text":"好友/群","fontSize":30,"font":"SimHei","color":"#b24821"}},{"type":"Button","props":{"y":185,"x":120,"var":"m_btnWX","skin":"gameHall/btn_WX_share.png"}},{"type":"Button","props":{"y":185,"x":360,"var":"m_btnPyq","skin":"gameHall/btn_peng_share.png"}},{"type":"Label","props":{"y":85,"x":342,"width":131,"var":"m_labelCode","text":"114835","height":25,"fontSize":25,"font":"SimHei","color":"#b24821"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}