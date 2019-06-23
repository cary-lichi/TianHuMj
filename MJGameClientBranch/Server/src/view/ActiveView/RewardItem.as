package view.ActiveView 
{
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.ui.Label;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RewardItem extends Box 
	{
		private var m_sTime:Label;
		private var m_sUsername:Label;
		private var m_sState:Label;
		private var m_bg:Image;
		public function RewardItem() 
		{
			m_bg = new Image;
			m_bg.skin = "reward/img_list.png";
			m_bg.bottom = 0;
			this.addChild(m_bg);
			
			m_sTime = new Label;
			m_sTime.width = 0;
			m_sTime.height = 60;
			m_sTime.left = 120;
			m_sTime.valign = "middle";
			m_sTime.align = "center";
			m_sTime.color = "#d1642e" ;
			m_sTime.font = "微软雅黑";
			m_sTime.fontSize = 26;
			this.addChild(m_sTime);
			
			m_sUsername = new Label;
			m_sUsername.width = 430;
			m_sUsername.height = 60;
			m_sUsername.left = 300;
			m_sUsername.valign = "middle";
			m_sUsername.align = "center";
			m_sUsername.color = "#d1642e" ;
			m_sUsername.font = "微软雅黑";
			m_sUsername.fontSize = 26;
			this.addChild(m_sUsername);
			
			m_sState = new Label;
			m_sState.width = 126;
			m_sState.height = 60;
			m_sState.left = 845;
			m_sState.valign = "middle";
			m_sState.align = "center";
			m_sState.color = "#d1642e" ;
			m_sState.font = "微软雅黑";
			m_sState.fontSize = 26;
			this.addChild(m_sState);
		}
		
		public function get sTime():Label 
		{
			return m_sTime;
		}
		
		public function set sTime(value:Label):void 
		{
			m_sTime = value;
		}
		
		public function get sUsername():Label 
		{
			return m_sUsername;
		}
		
		public function set sUsername(value:Label):void 
		{
			m_sUsername = value;
		}
		
		public function get sState():Label 
		{
			return m_sState;
		}
		
		public function set sState(value:Label):void 
		{
			m_sState = value;
		}
		
	}

}