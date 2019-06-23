package view.ActiveView 
{
	import laya.ui.Box;
	import laya.ui.Button;
	/**
	 * ...
	 * @author ...
	 */
	public class ShopItem extends Box
	{
		protected var m_btnBg:Button;
		
		public function ShopItem() 
		{
			m_btnBg = new Button;
			m_btnBg.stateNum = 1;
			this.addChild(m_btnBg);
		}
		
		public function get btnBg():Button 
		{
			return m_btnBg;
		}
		
		public function set btnBg(value:Button):void 
		{
			m_btnBg = value;
		}
		
	}

}