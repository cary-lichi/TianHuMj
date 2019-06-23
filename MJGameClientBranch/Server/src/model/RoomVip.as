package model 
{
	import view.VIPRoomView;
	/**
	 * ...
	 * @author ...
	 */
	public class RoomVip extends Room 
	{
		
		public function RoomVip() 
		{
			super();
			
		}
		protected override function InitRoomView():void 
		{
			if (m_vipRoomView == null)
			{
				m_vipRoomView = new VIPRoomView;
				
				m_vipRoomView.Init();
			}
		}
	}

}