package view.ActiveView._gameItem 
{
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class MyOverPaiItem extends BasePaiItem
	{
		public function MyOverPaiItem() 
		{
			m_paiBg.skin = "game/pai/btn_green.png";
			m_paiBg.stateNum = 1;
			m_imgPaiValue.y = 15;
			this.pivot(0.5, 0.5);
			this.scale(0.8, 0.8);
			m_nSpaceX = m_paiBg.width * 0.8;
			m_paiBg.addChild(m_imgPaiValue);
			
			m_baoTip = new Image;
			m_baoTip.skin = "game/img_baoTip.png";
			m_baoTip.left = 19;
			m_baoTip.top = 15;
			m_baoTip.visible = false;
			m_paiBg.addChild(m_baoTip);
		}
		public override function ShowBaoTip():void 
		{
			m_baoTip.skin = "game/img_baoTip.png";
			m_baoTip.visible = true;
		}
		public override function ShowFengTip():void 
		{
			m_baoTip.skin = "game/img_fengTip.png";
			m_baoTip.visible = true;
		}
	}

}