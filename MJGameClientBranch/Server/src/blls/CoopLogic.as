package blls 
{
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import view.CoopView;
	/**
	 * ...
	 * @author ...
	 */
	public class CoopLogic extends BaseLogic 
	{
		private var m_coopView:CoopView;
		
		public function CoopLogic() 
		{
			super();
		}
		
		public override function Init():void
		{
			//初始化LoginView
			if (m_coopView == null)
			{
				m_coopView = new CoopView;
				m_coopView.Init();
			}
			m_coopView.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
		}
		
		public override function Destroy():void
		{
			m_coopView.Destroy();
			m_coopView.destroy();
			m_coopView = null;
		}
		
		//注册所有按钮事件	
		private function registerEventClick():void 
		{
			m_coopView.m_btnBack.on(Event.CLICK,this,onBackClicked);
			
		}
		
		private function onBackClicked():void 
		{
			GameIF.DectiveLogic(LogicManager.COOPLOGIC);
			GameIF.ActiveLogic(LogicManager.GAMEHALLLOGIC);
		}
		
		
	}

}