package blls 
{
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import laya.ui.Image;
	import view.ActiveView.ShopView;
	/**
	 * ...
	 * @author ...
	 */
	public class ShopLogic extends BaseLogic
	{
		private var m_shopView:ShopView;
		
		public function ShopLogic() 
		{
			super();
		}
		
		public override function Init():void
		{	
			if (m_shopView == null)
			{
				m_shopView = new ShopView;
				m_shopView.Init();
			}
			m_shopView.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
			
			
		}
		//注册所有按钮事件
		private function registerEventClick():void 
		{
			m_shopView.imgClose.on(Event.CLICK, this, onShopCloseClicked);
		}
		
		//商城的关闭按钮
		private function onShopCloseClicked():void
		{
			GameIF.DectiveLogic(LogicManager.SHOPLOGIC);
		}
		
		public override function Destroy():void
		{
			m_shopView.visible = false;
			m_shopView.Destroy();
			m_shopView.destroy();
			m_shopView = null;
		}
		
		public function get shopView():ShopView 
		{
			return m_shopView;
		}
		
		public function set shopView(value:ShopView):void 
		{
			m_shopView = value;
		}
		
	}

}