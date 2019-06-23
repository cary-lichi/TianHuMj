package view.ActiveView._gameItem 
{
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Gamer2CanPaiItem extends BasePaiItem
	{
		
		public function Gamer2CanPaiItem() 
		{
			super();
			m_paiBg.skin = "game/pai/btn_2canPai.png";
			
			m_imgPaiValue.x = 33;
			m_imgPaiValue.y = 28;
			m_imgPaiValue.width = 33;
			m_imgPaiValue.height = 28;
			m_imgPaiValue.rotation = 180;
			m_paiBg.addChild(m_imgPaiValue);
			
		}	
	}

}