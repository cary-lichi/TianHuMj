package view.ActiveView 
{
	import core.Constants;
	import laya.utils.Browser;
	import tool.Tool;
	import ui.MahjongRoot.InviteWindowUI;
	
	/**
	 * ...
	 * @author ...
	 */
	public class InviteWindow extends InviteWindowUI 
	{	
		public function InviteWindow() 
		{
			super();
		}
		
		public function Init():void 
		{
			var top:int = (640 - this.height) / 2;
			var left:int = (1136 - this.width) / 2;
			this.pos(left,top);
			Laya.stage.addChild(this);
		if (Constants.isAdaptPhone)
			{
				reSetViewUi();
				var view:* = this;
				Browser.window.addEventListener("resize", function():void {
				Laya.timer.once(1000, view, reSetViewUi);
				
				});
				
			}
		}
			
		private function reSetViewUi():void
		{
			Tool.Adaptation(this);
		}
		
		public function Destroy():void 
		{
			Laya.stage.removeChild(this);
			this.destroy();
		}
	}

}