/**Created by the LayaAirIDE,do not modify.*/
package ui.MahjongRoot {
	import laya.ui.*;
	import laya.display.*; 

	public class AddWXWindowUI extends View {
		public var btn_close:Button;
		public var m_btnCopy:Button;
		public var m_imgTittle:Image;
		public var m_imgText:Image;
		public var m_tab:Tab;
		public var m_panel:Panel;
		public var m_imgCarousel:Panel;
		public var m_imgCarousel1:Image;
		public var m_imgCarousel2:Image;
		public var m_imgCarousel3:Image;
		public var m_imgCarousel0:Image;
		public var m_Success:Image;
		public var m_lableSuccess:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":832,"height":551},"child":[{"type":"Box","props":{"y":-2,"x":0,"name":"content"},"child":[{"type":"Image","props":{"y":30,"skin":"gameHall/img_bg_addme.png"}},{"type":"Button","props":{"x":760,"var":"btn_close","skin":"common/btn_close.png"}},{"type":"Image","props":{"y":65,"x":372,"skin":"gameHall/img_title_addme.png"}},{"type":"Image","props":{"y":129,"x":335,"skin":"gameHall/img_WXBg_addme.png"},"child":[{"type":"Label","props":{"y":9,"x":20,"text":"微信号：","fontSize":30,"font":"SimHei","color":"#118eae"}},{"type":"Label","props":{"y":9,"x":135,"text":"hlddz009","fontSize":30,"font":"SimHei","color":"#a25b3f"}}]},{"type":"Button","props":{"y":124,"x":627,"var":"m_btnCopy","skin":"gameHall/btn_Copy_addme.png"}},{"type":"Image","props":{"y":59,"x":189,"var":"m_imgTittle","skin":"gameHall/img_Bubble_0_addme.png"}},{"type":"Image","props":{"y":445,"x":271,"skin":"gameHall/img_txtBg_addme.png"},"child":[{"type":"Image","props":{"y":10,"x":49,"var":"m_imgText","skin":"gameHall/img_txt_0_addme.png"}}]},{"type":"Tab","props":{"y":506,"x":445,"var":"m_tab","space":13,"selectedIndex":0,"direction":"horizontal"},"child":[{"type":"Button","props":{"stateNum":3,"skin":"gameHall/btn_tab_addme.png","name":"item0"}},{"type":"Button","props":{"y":10,"x":10,"stateNum":3,"skin":"gameHall/btn_tab_addme.png","name":"item1"}},{"type":"Button","props":{"y":20,"x":20,"stateNum":3,"skin":"gameHall/btn_tab_addme.png","name":"item2"}},{"type":"Button","props":{"y":30,"x":30,"stateNum":3,"skin":"gameHall/btn_tab_addme.png","name":"item3"}}]},{"type":"Image","props":{"y":191,"x":253,"skin":"gameHall/img_frame_addme.png"}},{"type":"Panel","props":{"y":191,"x":253,"width":505,"var":"m_panel","name":"imgCarousel","height":238},"child":[{"type":"Panel","props":{"y":0,"x":0,"width":2020,"var":"m_imgCarousel","height":264,"hScrollBarSkin":"comp/hslider.png"},"child":[{"type":"Image","props":{"y":0,"x":505,"var":"m_imgCarousel1","skin":"gameHall/img_step_1_addme.png"}},{"type":"Image","props":{"y":0,"x":1010,"var":"m_imgCarousel2","skin":"gameHall/img_step_2_addme.png"}},{"type":"Image","props":{"y":0,"x":1515,"var":"m_imgCarousel3","skin":"gameHall/img_step_3_addme.png"}},{"type":"Image","props":{"x":0,"var":"m_imgCarousel0","skin":"gameHall/img_step_3_addme.png"}}]}]},{"type":"Image","props":{"y":249,"x":220,"visible":false,"var":"m_Success","skin":"common/img_successBg.png"},"child":[{"type":"Label","props":{"y":16,"x":73,"wordWrap":true,"width":245,"var":"m_lableSuccess","text":"领取成功","fontSize":24,"font":"SimHei","color":"#f1f1f1","align":"center"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}