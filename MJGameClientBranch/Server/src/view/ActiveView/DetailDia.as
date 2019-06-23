package view.ActiveView 
{
	import ui.MahjongRoot.DetailDiaUI;
	
	/**
	 * ...
	 * @author ...
	 */
	public class DetailDia extends DetailDiaUI 
	{
		
		public function DetailDia() 
		{
			super();
		}
		public function Init():void 
		{
			var top:int = (640 - this.height) / 2;
			var left:int = (1136 - this.width) / 2;
			this.pos(left,top);
			Laya.stage.addChild(this);
		}
		
		public function Destroy():void 
		{
			Laya.stage.removeChild(this);
			this.destroy();
		}
		
		
	}

}