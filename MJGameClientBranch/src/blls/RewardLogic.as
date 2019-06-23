package blls 
{
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import laya.ui.Component;
	import laya.utils.Handler;
	import model.User;
	import view.ActiveView.LoginRewardView;
	import view.ActiveView.RewardItem;
	import view.AlphaWindowView;
	import view.RewardView;
	/**
	 * ...
	 * @author ...
	 */
	public class RewardLogic extends BaseLogic 
	{
		private var m_rewardView:RewardView;
		private var m_alphaWindowView:AlphaWindowView;
		
		public function RewardLogic() 
		{
			super();
			
		}
		public override function Init():void
		{
			//初始化LoginView
			if (m_rewardView == null)
			{
				m_rewardView = new RewardView;
				m_rewardView.Init();
			}
			m_rewardView.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
			
			//数据初始化
			InitDel();
			//渲染List
			InitList();
		}
		
		public override function Destroy():void
		{
			m_rewardView.Destroy();
			m_rewardView.destroy();
			m_rewardView = null;
		}
		
		//注册所有按钮事件	
		private function registerEventClick():void 
		{
			//返回
			m_rewardView.m_btnBack.on(Event.CLICK, this, onBackClicked);
			//tab
			m_rewardView.m_tab.selectHandler = new Handler(this, onSelecte);  
			//领取按钮
			m_rewardView.m_btnReceive.on(Event.CLICK, this, onReceiveCilcked);
			//房卡加号
			m_rewardView.m_btnAddCard.on(Event.CLICK, this, onBtnShopClicked);
			
		}
		//显示商城
		private function onBtnShopClicked():void 
		{
			GameIF.ActiveLogic(LogicManager.ROOMGOLDLOGIC);
		}
		//领取按钮
		private function onReceiveCilcked():void 
		{
			var num:String = m_rewardView.m_lableCardNum.text;
			m_rewardView.m_lableCardNum.text = "0";
			if (num=="0")
			{
				GameIF.getInstance().uiManager.showTipsDia(m_rewardView.m_tipNoCard);
			}
			else
			{
				var text:String = "您已成功领取" + num + "张房卡";
				GameIF.getInstance().uiManager.showTipsDia(m_rewardView.m_Success,m_rewardView.m_lableSuccess,text);
			}
		}

        /**根据选择tab的索引切换页面**/
        private function onSelecte(index:int):void
        {
            //切换ViewStack子页面
            m_rewardView.m_viewStack.selectedIndex=index;
        }
		//返回按钮点击事件
		private function onBackClicked():void 
		{
			GameIF.DectiveLogic(LogicManager.REWARDLOGIC);
			GameIF.ActiveLogic(LogicManager.GAMEHALLLOGIC);
			GameIF.ActiveLogic(LogicManager.SPREELOGIC);
		}
		//数据初始化
		private function InitDel():void 
		{
			var user:User = GameIF.GetUser();
			//初始化金币
			GameIF.getInstance().uiManager.showNumber(m_rewardView.m_boxMa, user.nGold);
			//初始化钻石
			GameIF.getInstance().uiManager.showNumber(m_rewardView.m_boxCard, user.nMoney);
		}
		private function InitList():void 
		{
			
			var data:Array = [];
			for (var m:int = 1; m <= 100; m++)
			{
				data.push({Time:"12:38:51",Username:"巴拉贝尔",State:1});
			}
			m_rewardView.m_list.itemRender = RewardItem;//Item
			m_rewardView.m_list.renderHandler = new Handler(this, renderFun);
			
			m_rewardView.m_list.array = data;
			
			// 使用但隐藏垂直滚动条
			m_rewardView.m_list.vScrollBarSkin = "";
            //滚动在头或底回弹时间
            m_rewardView.m_list.scrollBar.elasticBackTime = 200;
            //滚动在头或底最大距离
            m_rewardView.m_list.scrollBar.elasticDistance = 400;
		}
		
		private function renderFun(item:Component,index:int):void 
		{
			var m_item:RewardItem = item as RewardItem;
			var data:* = m_rewardView.m_list.array[index];
			m_item.sTime.text = data.Time;
			m_item.sUsername.text = data.Username;
			if (data.State)
			{
				m_item.sState.text = "在线";
				m_item.sState.color = "#1a8e07";
			}
			else
			{
				m_item.sState.text = "离线";
				m_item.sState.color = "#8a6e6e";
			}
		}
		
	}

}