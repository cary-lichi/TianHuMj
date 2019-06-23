package view.ActiveView 
{
	import core.Constants;
	import laya.utils.Browser;
	import tool.Tool;
	import ui.MahjongRoot.AddWXWindowUI;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AddWXWindow extends AddWXWindowUI 
	{
		
		public function AddWXWindow() 
		{
			super();
		}
		
		public function Init():void 
		{
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