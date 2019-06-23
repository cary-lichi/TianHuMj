package blls._GamehallLogic 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import view.ActiveView.SpreeWindow;
	import view.AlphaWindowView;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SpreeLogic extends BaseLogic 
	{
		private var m_spreeWindow:SpreeWindow;
		private var m_isSuccess:Boolean = false;
		
		public function SpreeLogic() 
		{
			super();
			
		}
		
		public override function Init():void
		{
			if (m_spreeWindow == null)
			{
				m_spreeWindow = new SpreeWindow;
				m_spreeWindow.Init();
			}
			m_spreeWindow.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
			
		}
		private function registerEventClick():void 
		{
			//关闭按钮
			m_spreeWindow.btn_close.on(Event.CLICK, this, btnCloseClick);
			//领取
			m_spreeWindow.m_btnReceive.on(Event.CLICK, this, onReceviceClicked);
			//免费发卡
			m_spreeWindow.m_btnHairpin.on(Event.CLICK, this, onHairpinClicked);
			//查看奖励
			m_spreeWindow.m_btnReward.on(Event.CLICK, this, onRewardClicked);
			//复制URL
			m_spreeWindow.m_btnCopyURL.on(Event.CLICK, this, onCopyURLClicked);
			//复制邀请码
			m_spreeWindow.m_btnCopyCode.on(Event.CLICK, this, onCopyCodeClicked);
			
		}
		//复制邀请码
		private function onCopyCodeClicked():void 
		{
			showTips("复制成功");
		}
		//复制URL
		private function onCopyURLClicked():void 
		{
			showTips("复制成功");
		}
		//免费发卡
		private function onHairpinClicked():void 
		{
			GameIF.ActiveLogic(LogicManager.INVITEWINDOW);
		}
		//领取
		private function onReceviceClicked():void 
		{
			if (m_isSuccess)
			{
				GameIF.GetPopUpDia("您已领取过新手房卡，还可以给新玩家\n发新手礼包呦(∩_∩)",isOK,this);
			}
			else
			{
				showTips("领取成功");
			}
			
		}
		//PopUpDia确定按钮被点击
		private function isOK():void 
		{
			GameIF.ClosePopUpDia();
			GameIF.ActiveLogic(LogicManager.INVITEWINDOW);
		}
		
		
		//显示飘字
		private function showTips(text:String):void 
		{
			GameIF.GetAlphaWindowView();
			m_spreeWindow.m_Success.visible = true;
			m_spreeWindow.m_lableSuccess.text = text;
			Laya.timer.once(2000, this, visibleTips);
		}
		//隐藏飘字
		private function visibleTips():void 
		{
			m_spreeWindow.m_Success.visible = false;
			GameIF.CloseAlphaWindowView();
		}
		
		
		//查看奖励按钮点击事件
		private function onRewardClicked():void 
		{
			GameIF.DectiveLogic(LogicManager.SPREELOGIC);
			GameIF.DectiveLogic(LogicManager.GAMEHALLLOGIC);
			GameIF.ActiveLogic(LogicManager.REWARDLOGIC);
		}
		
		//关闭按钮点击事件
		private function btnCloseClick():void 
		{
			GameIF.DectiveLogic(LogicManager.SPREELOGIC);
		}
		public override function Destroy():void
		{
			m_spreeWindow.Destroy();
			m_spreeWindow.destroy();
			m_spreeWindow.visible = false;
			m_spreeWindow = null;	
		}
		
	}

}