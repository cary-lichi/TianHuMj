package blls._GamehallLogic 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import view.ActiveView.DetailDia;
	
	/**
	 * ...
	 * @author ...
	 */
	public class DetailLogic extends BaseLogic 
	{
		private var m_detailDia:DetailDia;
		
		public function DetailLogic() 
		{
			super();
			
		}
		public override function Init():void
		{
			if (m_detailDia == null)
			{
				m_detailDia = new DetailDia;
				m_detailDia.Init();
			}
			m_detailDia.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
		}
		
		private function registerEventClick():void 
		{
			//关闭按钮
			m_detailDia.btn_close.on(Event.CLICK,this,btnCloseClick);
		}
		
		//关闭按钮点击事件
		private function btnCloseClick():void 
		{
			GameIF.DectiveLogic(LogicManager.DETAILLOGIC);
		}
		
		public override function Destroy():void
		{
			m_detailDia.Destroy();
			m_detailDia.destroy();
			m_detailDia.visible = false;
			m_detailDia = null;	
		}
	}

}