package view.ActiveView._gameItem 
{
	import laya.ui.Button;
	import laya.ui.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Gamer1CanPaiItem extends BasePaiItem
	{
		
		public function Gamer1CanPaiItem() 
		{
			super();
			m_paiBg.skin = "game/pai/btn_1canPai.png";
			
			m_imgPaiValue.x = 58;
			m_imgPaiValue.y = 0;
			m_imgPaiValue.width = 24;
			m_imgPaiValue.height = 50;
			m_imgPaiValue.skewY = 17;
			m_imgPaiValue.rotation = 90;
			m_paiBg.addChild(m_imgPaiValue);
		}
	}

}