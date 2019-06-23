package model 
{
	import view.HappyRoomView;
	/**
	 * ...
	 * @author ...
	 */
	public class RoomHappy extends Room 
	{
		
		public function RoomHappy() 
		{
			super();
			
		}
		protected override function InitRoomView():void 
		{
			
			if (m_vipRoomView == null)
			{
				m_vipRoomView = new HappyRoomView;
				m_vipRoomView.Init();
			}
		}
	}

}