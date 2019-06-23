package view 
{
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.ui.Label;
	/**
	 * ...
	 * @author ...
	 */
	public class RoomItem extends Box
	{
		protected var m_imgRoomBg:Image;
		protected var m_imgVIPNum:Image;
		
		protected var m_labBaseScore:Label;
		protected var m_labPeopleNum:Label;
		protected var m_labLimit:Label;
		
		public function RoomItem() 
		{
			m_imgRoomBg = new Image;
			m_imgRoomBg.height = 273;
			m_imgRoomBg.width = 171;
			this.addChild(m_imgRoomBg);
			
			m_imgVIPNum = new Image;
			m_imgVIPNum.height = 148;
			m_imgVIPNum.width = 171;
			m_imgVIPNum.top = 153;
			m_imgRoomBg.addChild(m_imgVIPNum);
			
		}
		
		public function get imgRoomBg():Image 
		{
			return m_imgRoomBg;
		}
		
		public function set imgRoomBg(value:Image):void 
		{
			m_imgRoomBg = value;
		}
		
		public function get imgVIPNum():Image 
		{
			return m_imgVIPNum;
		}
		
		public function set imgVIPNum(value:Image):void 
		{
			m_imgVIPNum = value;
		}
		
		public function get labBaseScore():Label 
		{
			return m_labBaseScore;
		}
		
		public function set labBaseScore(value:Label):void 
		{
			m_labBaseScore = value;
		}
		
		public function get labPeopleNum():Label 
		{
			return m_labPeopleNum;
		}
		
		public function set labPeopleNum(value:Label):void 
		{
			m_labPeopleNum = value;
		}
		
		public function get labLimit():Label 
		{
			return m_labLimit;
		}
		
		public function set labLimit(value:Label):void 
		{
			m_labLimit = value;
		}
		
	}

}