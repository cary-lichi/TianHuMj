package blls._GamehallLogic 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import view.ActiveView.InviteWindow;
	import view.BlackWindowView;
	
	/**
	 * ...
	 * @author ...
	 */
	public class InviteLogic extends BaseLogic 
	{
		private var m_inviteWindow:InviteWindow;
		
		public function InviteLogic() 
		{
			super();
			
		}
		
		public override function Init():void
		{	
			if (m_inviteWindow == null)
			{
				m_inviteWindow = new InviteWindow;
				m_inviteWindow.Init();
			}
			m_inviteWindow.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
			InitDal();
		}
		
		private function InitDal():void 
		{
			m_inviteWindow.m_labelCode.text = GameIF.GetUser().sICode;
		}
		
		private function registerEventClick():void 
		{
			//关闭按钮
			m_inviteWindow.btn_close.on(Event.CLICK, this, btnCloseClick);
			//微信
			m_inviteWindow.m_btnWX.on(Event.CLICK, this, onWXClicked);
			//朋友圈
			m_inviteWindow.m_btnPyq.on(Event.CLICK, this, onWXClicked);
		}
		
		private function onPyqClicked():void 
		{
			var json:JSON = GameIF.GetJson();
				if (json["equipType"] == json["equipEnum"]["Web"])
					henderWebPyq();
				if (json["equipType"] == json["equipEnum"]["Android"])
					henderAndroidPyq();
				if (json["equipType"] == json["equipEnum"]["IOS"])
					henderIOSPyq();
				if (json["equipType"] == json["equipEnum"]["wxWeb"])
					henderwxWebyq();
		}
		private function henderWebPyq():void 
		{
			
		}
		private function henderAndroidPyq():void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("com.tianhu.majiang.WxAndroid");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			testAdd.callWithBack(null,"wxShare0");
		}
		private function henderIOSPyq():void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("SwxClass");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			testAdd.callWithBack(null,"wxShare0");
		}
		private function henderwxWebyq():void 
		{
			__JS__('onMenuShareTimeline()');
		}
		private function onWXClicked():void 
		{
			var json:JSON = GameIF.GetJson();
				if (json["equipType"] == json["equipEnum"]["Web"])
					henderWebWX();
				if (json["equipType"] == json["equipEnum"]["Android"])
					henderAndroidWX();
				if (json["equipType"] == json["equipEnum"]["IOS"])
					henderIOSWX();
				if (json["equipType"] == json["equipEnum"]["wxWeb"])
					henderwxWebWX();
		}
		
		private function henderWebWX():void 
		{
			
		} 
		
		private function henderAndroidWX():void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("com.tianhu.majiang.WxAndroid");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			testAdd.callWithBack(null,"wxShare1");
		}
		
		private function henderIOSWX():void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("SwxClass");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			testAdd.callWithBack(null,"wxShare1");
		}
		private function henderwxWebWX():void 
		{
			GameIF.ActiveLogic(LogicManager.SHAREPROMPTLOGIC);

			var userID:int= GameIF.GetUser().nUserID;
			__JS__('btnShareAppMessage()');
		}
		//关闭按钮点击事件
		private function btnCloseClick():void 
		{
			GameIF.DectiveLogic(LogicManager.INVITEWINDOW);
		}
		
		public override function Destroy():void
		{	
			m_inviteWindow.Destroy();
			m_inviteWindow.destroy();
			m_inviteWindow.visible = false;
			m_inviteWindow = null;	
		}
	}

}