package blls._Game 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import view.ActiveView.LackGoldView;
	/**
	 * ...
	 * @author ...
	 */
	public class LackGoldLogic extends BaseLogic
	{
		private var m_lackGoldView:LackGoldView;
		
		public function LackGoldLogic() 
		{
			super();
		}
		
		public override function Init():void
		{	
			if (m_lackGoldView == null)
			{
				m_lackGoldView = new LackGoldView;
				m_lackGoldView.Init();
			}
			m_lackGoldView.visible = true;
			
			m_lackGoldView.btnClose.on(Event.CLICK, this, onCloseClicked);
			m_lackGoldView.btnBuy.on(Event.CLICK, this, onBuyClicked);
		}
		
		public override function Destroy():void
		{
			m_lackGoldView.visible = false;
			m_lackGoldView.Destroy();
			m_lackGoldView = null;
		}
		
		private function onCloseClicked():void
		{
			GameIF.DectiveLogic(LogicManager.LACKGOLDLOGIC);
		}
		
		private function onBuyClicked():void
		{
			GameIF.DectiveLogic(LogicManager.LACKGOLDLOGIC);
			//GameIF.GetBlackWindowView();
			GameIF.ActiveLogic(LogicManager.SHOPLOGIC);
		}
		
	}

}