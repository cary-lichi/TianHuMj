package view 
{
	/**
	 * ...
	 * @author ...
	 */
	public class VIPRoomView extends RoomView
	{
		public function VIPRoomView() 
		{
			super();
		}
		protected override function InitView():void 
		{
			this.m_btnDelegateOn.visible = false;
		}
	}

}