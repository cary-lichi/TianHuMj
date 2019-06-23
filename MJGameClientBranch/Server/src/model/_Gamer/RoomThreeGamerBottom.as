package model._Gamer 
{
	import laya.ui.Component;
	import model.GamerBottom;
	import model.Pai;
	import view.ActiveView._gameItem.Gamer0PutPaiItem;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RoomThreeGamerBottom extends GamerBottom 
	{
		
		public function RoomThreeGamerBottom() 
		{
			super();
			
		}
		protected override function InitGamer():void 
		{
			//设置putpai的属性
			vipRoomView.m_listPutPai.x = 393;
			vipRoomView.m_listPutPai.y = 350;
			vipRoomView.m_listPutPai.repeatX = 8;
		}
	}

}