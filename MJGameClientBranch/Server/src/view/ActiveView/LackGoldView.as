package view.ActiveView 
{
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class LackGoldView extends Box
	{
		protected var m_imgBg:Image;
		protected var m_btnBuy:Button;
		protected var m_btnClose:Button;
		
		public function LackGoldView() 
		{
			this.width = 345;
			this.height = 226;
			
			m_imgBg = new Image;
			m_imgBg.skin = "common/pay0.png";
			m_imgBg.x = 1136 / 2 - m_imgBg.width / 2;
			m_imgBg.y = 720 / 2 - m_imgBg.height / 2;
			this.addChild(m_imgBg);
			
			m_btnBuy = new Button;
			m_btnBuy.skin = "common/buy1.png";
			m_btnBuy.x = 345 / 2 - m_btnBuy.width / 2;
			m_btnBuy.y = 173;
			m_btnBuy.stateNum = 1;
			m_imgBg.addChild(m_btnBuy);
			
			m_btnClose = new Button;
			m_btnClose.skin = "share/close.png";
			m_btnClose.top = -15;
			m_btnClose.left = 320;
			m_btnClose.stateNum = 1;
			m_imgBg.addChild(m_btnClose);
		}
		
		public function Init():void
		{
			Laya.stage.addChild(this);
		}
		
		public function Destroy():void
		{
			Laya.stage.removeChild(this);
			this.destroy();
		}
		
		//---------------------接口-------------------------------------
		public function get btnBuy():Button 
		{
			return m_btnBuy;
		}
		
		public function set btnBuy(value:Button):void 
		{
			m_btnBuy = value;
		}
		
		public function get btnClose():Button 
		{
			return m_btnClose;
		}
		
		public function set btnClose(value:Button):void 
		{
			m_btnClose = value;
		}
		
	}

}