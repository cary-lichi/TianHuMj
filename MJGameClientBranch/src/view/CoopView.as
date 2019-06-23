package view 
{
	import core.Constants;
	import laya.utils.Browser;
	import tool.Tool;
	import ui.MahjongRoot.CoopPageUI;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CoopView extends CoopPageUI 
	{
		
		public function CoopView() 
		{
			super();
		}
		
		public function Init():void
		{		
			Laya.stage.addChild(this);
			if (Constants.isAdaptPhone)
			{
				reSetViewUi();
				var coopView:CoopView= this;
				Browser.window.addEventListener("resize", function():void {
				Laya.timer.once(1000, coopView, reSetViewUi);
				
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