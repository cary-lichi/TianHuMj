/**Created by the LayaAirIDE,do not modify.*/
package ui.MahjongRoot {
	import laya.ui.*;
	import laya.display.*; 

	public class CertificationWindowUI extends View {
		public var input_tel:TextInput;
		public var input_code:TextInput;
		public var input_name:TextInput;
		public var input_ID:TextInput;
		public var m_btnCoed:Label;
		public var btn_close:Button;
		public var m_Success:Image;
		public var m_lableSuccess:Label;
		public var m_btnSubmit:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":0,"x":0,"width":1136,"skin":"common/img_blankBg.png","sizeGrid":"2,2,2,2","height":640}},{"type":"Box","props":{"y":101,"x":252,"name":"content"},"child":[{"type":"Image","props":{"y":38,"width":600,"skin":"common/img_bomb boxBg.png","sizeGrid":"75,75,75,75","height":400},"child":[{"type":"Image","props":{"y":-47,"x":114,"skin":"common/img_popupBg.png"}}]},{"type":"Image","props":{"x":227,"skin":"certification/img_certification.png"}},{"type":"Label","props":{"y":71,"width":600,"text":"根据国家文化部规定，需使用有效身份证进行实名认证","fontSize":20,"font":"SimHei","color":"#c24e1b","align":"center"}},{"type":"TextInput","props":{"y":111,"x":162,"width":365,"var":"input_tel","valign":"middle","type":"text","skin":"common/input.png","sizeGrid":"10,10,10,10","restrict":"0,1,2,3,4,5,6,7,8,9","promptColor":"#ba9d6e","prompt":"请输入手机号","padding":"0,0,0,20","maxChars":11,"height":40,"fontSize":20,"font":"SimHei","color":"#91592a"}},{"type":"TextInput","props":{"y":161,"x":162,"width":240,"var":"input_code","valign":"middle","type":"text","skin":"common/input.png","sizeGrid":"10,10,10,10","promptColor":"#ba9d6e","prompt":"请输入验证码","padding":"0,0,0,20","height":40,"fontSize":20,"font":"SimHei","color":"#91592a"}},{"type":"TextInput","props":{"y":211,"x":162,"width":365,"var":"input_name","valign":"middle","type":"text","skin":"common/input.png","sizeGrid":"10,10,10,10","promptColor":"#ba9d6e","prompt":"请输入姓名","padding":"0,0,0,20","height":40,"fontSize":20,"font":"SimHei","color":"#91592a"}},{"type":"TextInput","props":{"y":261,"x":162,"width":365,"var":"input_ID","valign":"middle","type":"text","skin":"common/input.png","sizeGrid":"10,10,10,10","promptColor":"#ba9d6e","prompt":"请输入身份证号","padding":"0,0,0,20","height":40,"fontSize":20,"font":"SimHei","color":"#91592a"}},{"type":"Label","props":{"y":181,"x":475,"width":122,"var":"m_btnCoed","underlineColor":"#348a44","underline":true,"text":"获取验证码","pivotY":13.43283582089552,"pivotX":62.68656716417905,"height":22,"fontSize":22,"font":"SimHei","color":"#4b8b51","align":"center"}},{"type":"Label","props":{"y":311,"width":600,"text":"(完成认证后立即送一张房卡)","fontSize":20,"font":"SimHei","color":"#aa3305","align":"center"}},{"type":"Label","props":{"y":121,"x":80,"underline":false,"text":"手机号","fontSize":20,"font":"SimHei","color":"#91592a","align":"center"}},{"type":"Label","props":{"y":171,"x":80,"underline":false,"text":"验证码","fontSize":20,"font":"SimHei","color":"#91592a","align":"center"}},{"type":"Label","props":{"y":221,"x":60,"underline":false,"text":"真实姓名","fontSize":20,"font":"SimHei","color":"#91592a","align":"center"}},{"type":"Label","props":{"y":271,"x":60,"underline":false,"text":"身份证号","fontSize":20,"font":"SimHei","color":"#91592a","align":"center"}},{"type":"Button","props":{"y":6,"x":559,"width":72,"var":"btn_close","skin":"common/btn_close.png","height":74}},{"type":"Image","props":{"y":185,"x":119,"visible":false,"var":"m_Success","skin":"common/img_successBg.png"},"child":[{"type":"Label","props":{"y":16,"x":73,"wordWrap":true,"width":245,"var":"m_lableSuccess","text":"领取成功","fontSize":24,"font":"SimHei","color":"#f1f1f1","align":"center"}}]},{"type":"Button","props":{"y":340,"x":212,"var":"m_btnSubmit","skin":"common/btn_Bg.png"},"child":[{"type":"Label","props":{"y":3,"x":1,"width":174,"valign":"middle","text":"提交","strokeColor":"#3b7204","stroke":2,"height":59,"fontSize":30,"font":"SimHei","color":"#ffffff","align":"center"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}