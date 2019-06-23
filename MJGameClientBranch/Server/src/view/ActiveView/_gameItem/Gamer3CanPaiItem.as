package view.ActiveView._gameItem 
{
	import laya.ui.Button;
	import laya.ui.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Gamer3CanPaiItem extends BasePaiItem
	{
		
		public function Gamer3CanPaiItem() 
		{
			super();
			m_paiBg.skin = "game/pai/btn_3canPai.png";
			
			m_imgPaiValue.x = 13;
			m_imgPaiValue.y = 23;
			m_imgPaiValue.width = 24;
			m_imgPaiValue.height = 51;
			m_imgPaiValue.skewY = -16;
			m_imgPaiValue.rotation = -90;
			m_paiBg.addChild(m_imgPaiValue);
		}
	}

}