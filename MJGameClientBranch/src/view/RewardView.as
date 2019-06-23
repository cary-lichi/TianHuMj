package view 
{
	import core.Constants;
	import laya.utils.Browser;
	import tool.Tool;
	import ui.MahjongRoot.RewardPageUI;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RewardView extends RewardPageUI 
	{
		
		public function RewardView() 
		{
			super();
		}
		public function Init():void
		{		
			Laya.stage.addChild(this);
			if (Constants.isAdaptPhone)
			{
				reSetViewUi();
				var rewardView:RewardView = this;
				Browser.window.addEventListener("resize", function():void {
				Laya.timer.once(1000, rewardView, reSetViewUi);
				
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