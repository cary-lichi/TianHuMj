package 
{
	import blls.BaseLogic;
	import blls.LoadingLogic;
	import blls.PopUpLogic;
	import core.Constants;
	import core.GameIF;
	import core.LogicManager;
	import core.UiManager;
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.net.Loader;
	import laya.utils.Handler;
	import laya.webgl.WebGL;
	import tool.Tool;
	/**
	 * ...
	 * @author ...
	 */
	public class ChessMahjong 
	{
		
		public function ChessMahjong() 
		{
			//AS3版本初始化微信小游戏的适配
			//MiniAdpter.init();
			
			Laya.init(1136, 640,WebGL);
			GameIF.getInstance().Init();
			//Laya.stage.fullScreenEnabled = true;
			//Laya.stage.bgColor = "red";
			/**
			*屏幕适配
			**/
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			//Laya.stage.scaleMode = Stage.SCALE_EXACTFIT;
			if (!Constants.isAdaptPhone)
			{
				//整个应用程序在指定区域中可见，但不尝试保持原始高宽比。可能会发生扭曲，应用程序可能会拉伸或压缩显示。
				Laya.stage.scaleMode = Stage.SCALE_EXACTFIT;
			}
			else
			{
				Laya.stage.scaleMode = Stage.SCALE_FIXED_HEIGHT;
			}
			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_MIDDLE;
			//加载界面
			Laya.loader.load([{url:"res/atlas/loading.json", type:Loader.ATLAS}], Handler.create(this, Loading));
			
		}
		//进入加载界面
		private function Loading():void 
		{
			//显示加载界面
			GameIF.ActiveLogic(LogicManager.LOADINGLOGIC);
			
			//加载资源
			var assetArray:Array = [{url:"res/atlas/gameHall.json", type:Loader.ATLAS} , {url:"res/atlas/common.json", type:Loader.ATLAS}
								, {url:"res/atlas/record.json", type:Loader.ATLAS}
								, {url:"res/atlas/set.json", type:Loader.ATLAS}, {url:"res/atlas/inputRoomID.json", type:Loader.ATLAS}
								, {url:"res/atlas/game/pai.json", type:Loader.ATLAS}, {url:"res/atlas/game.json", type:Loader.ATLAS}
								, {url:"res/atlas/certification.json", type:Loader.ATLAS} , {url:"res/atlas/notice.json", type:Loader.ATLAS}
								, {url:"res/atlas/coop.json", type:Loader.ATLAS} , {url:"res/atlas/ai.json", type:Loader.ATLAS} 
								, {url:"res/atlas/spree.json", type:Loader.ATLAS} , {url:"res/atlas/roomGold.json", type:Loader.ATLAS}
								, {url:"res/atlas/effectCircle.json", type:Loader.ATLAS} , {url:"res/atlas/effectCanPaiCircle.json", type:Loader.ATLAS} 
								, {url:"res/atlas/effectCanPaiRotate.json", type:Loader.ATLAS}, {url:"res/atlas/effectHead.json", type:Loader.ATLAS}
								, {url:"res/atlas/reward.json", type:Loader.ATLAS}, {url:"res/atlas/detail.json", type:Loader.ATLAS}
								, {url:"res/atlas/createjoinroom.json", type:Loader.ATLAS}, {url:"res/atlas/chat.json", type:Loader.ATLAS}
								, {url:"res/atlas/turntable.json", type:Loader.ATLAS}, {url:"res/atlas/totalScore.json", type:Loader.ATLAS}];
			Laya.loader.load(assetArray, Handler.create(this, onLoaded),Handler.create(this, onLoading, null, false));
		}
		//加载中...
		private function onLoading(progress:Number):void 
		{
			var lg:LoadingLogic = GameIF.GetLogic(LogicManager.LOADINGLOGIC) as LoadingLogic;
			lg.changeValue(progress);
		}
		//加载完成
		private function onLoaded():void
		{
			__JS__('GetLocation(this.LocationCallBack)');//  定位
			//销毁加载
			GameIF.DectiveLogic(LogicManager.LOADINGLOGIC);
			//进入登录界面
			GameIF.ActiveLogic(LogicManager.LOGINLOGIC);
			//测试入口
			//GameIF.ActiveLogic(LogicManager.RETRIEVELOGIC);
		}
		private function LocationCallBack(info:*):void
		{
			Constants.sSelfLng = info.lng.toString();
			Constants.sSelfLat = info.lat.toString();
			Constants.sSelfAddress = info.address;
			Constants.bIsLocation = info.accuracy != null;
			//Constants.bIsLocation = true;
		}
	}
}

