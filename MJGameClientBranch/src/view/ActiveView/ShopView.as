package view.ActiveView 
{
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Component;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.ui.List;
	import laya.utils.Handler;
	/**
	 * ...
	 * @author ...
	 */
	public class ShopView extends Box
	{
		protected var m_imgBg:Image;
		protected var m_imgTitleBg:Image;
		protected var m_imgClose:Button;
		protected var m_btnLeBiClicked:Button;
		protected var m_btnFangKaClicked:Button;
		protected var m_btnJinBiClicked:Button;
		
		protected var m_labLeBNum:Label;
		protected var m_labRoomCardNum:Label;
		protected var m_labJBNum:Label;
		
		private var m_LeBList:List;
		private var m_RoomCardList:List;
		private var m_JBList:List
		
		public function ShopView() 
		{
			//商城背景
			m_imgBg = new Image;
			m_imgBg.skin = "mall/mall_bg.png";
			m_imgBg.top = 186;
			m_imgBg.left = 225.5;
			this.addChild(m_imgBg);
			
			//按钮背景
			m_imgTitleBg = new Image;
			m_imgTitleBg.skin = "mall/titlebg.png";
			m_imgTitleBg.top = -24;
			m_imgTitleBg.left = 75.5;
			m_imgBg.addChild(m_imgTitleBg);
			
			m_imgClose = new Button;
			m_imgClose.skin = "share/close.png";
			m_imgClose.top = -20;
			m_imgClose.left = 660;
			m_imgClose.stateNum = 1;
			m_imgBg.addChild(m_imgClose);
			
			//乐币按钮
			m_btnLeBiClicked = new Button;
			m_btnLeBiClicked.skin = "mall/lebi1.png";
			m_btnLeBiClicked.stateNum = 1;
			m_btnLeBiClicked.top = 2;
			m_btnLeBiClicked.left = 2;
			m_imgTitleBg.addChild(m_btnLeBiClicked);
			
			//房卡按钮
			m_btnFangKaClicked = new Button;
			m_btnFangKaClicked.skin = "mall/card.png";
			m_btnFangKaClicked.stateNum = 1;
			m_btnFangKaClicked.top = 2;
			m_btnFangKaClicked.left = 178;
			m_btnFangKaClicked.visible = true;
			m_imgTitleBg.addChild(m_btnFangKaClicked);
			
			//金币按钮
			m_btnJinBiClicked = new Button;
			m_btnJinBiClicked.skin = "mall/gold.png";
			m_btnJinBiClicked.stateNum = 1;
			m_btnJinBiClicked.top = 2;
			m_btnJinBiClicked.left = 354;
			m_btnJinBiClicked.visible = true;
			m_imgTitleBg.addChild(m_btnJinBiClicked);
			
			//乐币数量
			m_labLeBNum = new Label;
			m_labLeBNum.width = 105;
			m_labLeBNum.text = "0";
			m_labLeBNum.overflow = "hidden";
			m_labLeBNum.color = "#f7d489" ;
			m_labLeBNum.font = "微软雅黑";
			m_labLeBNum.fontSize = 12;
			m_labLeBNum.top = 335;
			m_labLeBNum.left = 145;
			m_imgTitleBg.addChild(m_labLeBNum);
			
			//房卡数量
			m_labRoomCardNum = new Label;
			m_labRoomCardNum.width = 105;
			m_labRoomCardNum.text = "3";
			m_labRoomCardNum.overflow = "hidden";
			m_labRoomCardNum.color = "#f7d489" ;
			m_labRoomCardNum.font = "微软雅黑";
			m_labRoomCardNum.fontSize = 12;
			m_labRoomCardNum.top = 335;
			m_labRoomCardNum.left = 320;
			m_imgTitleBg.addChild(m_labRoomCardNum);
			
			//金币数量
			m_labJBNum = new Label;
			m_labJBNum.width = 105;
			m_labJBNum.text = "9560";
			m_labJBNum.overflow = "hidden";
			m_labJBNum.color = "#f7d489" ;
			m_labJBNum.font = "微软雅黑";
			m_labJBNum.fontSize = 12;
			m_labJBNum.top = 335;
			m_labJBNum.left = 480;
			m_imgTitleBg.addChild(m_labJBNum);
		}
		
		public function Init():void
		{
			Laya.stage.addChild(this);
			InitList();
		}
		
		public function Destroy():void
		{
			Laya.stage.removeChild(this);
			this.destroy();
		}
		
		private function InitList():void
		{
			InitLeBList();
			InitRoomCardList();
			InitJBList();
			
			//默认乐币显示，房卡金币不显示
			m_RoomCardList.visible = false;
			m_JBList.visible = false;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////
		private function InitLeBList():void
		{
			m_LeBList = new List;
			//有滚动条但滚动条不显示
			m_LeBList.hScrollBarSkin = "";
			m_LeBList.top = 35;
			m_LeBList.left = 25;
			m_LeBList.height = 260;
			m_LeBList.width = 640;
			m_LeBList.scrollBar.elasticBackTime = 150;//弹簧返回时间
			m_LeBList.scrollBar.elasticDistance = 640;//弹簧能拉最远距离
			m_LeBList.repeatX = 4;//X轴4个
			m_LeBList.repeatY = 1;//Y轴1个
			m_LeBList.itemRender = ShopItem;
			m_LeBList.spaceX = 160;
			
			m_LeBList.renderHandler = new Handler(this, RenderLeBList);
			
			var arr:Array = [];
			arr.push(
				{money:"mall/list_bg_l0.png"},
				{money:"mall/list_bg_l1.png"},
				{money:"mall/list_bg_l2.png"},
				{money:"mall/list_bg_l3.png"}
			);
			
			m_LeBList.array = arr;
			m_imgBg.addChild(m_LeBList);
		}
		
		private function RenderLeBList(item:Component,index:int):void 
		{
			if (index < m_LeBList.length)
			{
				var m_item:ShopItem = item as ShopItem;
				var data:* = m_LeBList.array[index];
				m_item.btnBg.skin = m_LeBList.array[index].money;
			}
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////
		private function InitRoomCardList():void
		{
			m_RoomCardList = new List;
			m_RoomCardList.top = 35;
			m_RoomCardList.left = 25;
			m_RoomCardList.height = 260;
			m_RoomCardList.width = 640;
			m_RoomCardList.hScrollBarSkin = "comp/hscroll.png";
			m_RoomCardList.scrollBar.visible = false;
			m_RoomCardList.scrollBar.elasticBackTime = 150;//弹簧返回时间
			m_RoomCardList.scrollBar.elasticDistance = 640;//弹簧能拉最远距离
			m_RoomCardList.itemRender = ShopItem;
			m_RoomCardList.repeatX = 4;//X轴4个
			m_RoomCardList.repeatY = 1;//Y轴1个
			m_RoomCardList.spaceX = 160;
			
			m_RoomCardList.renderHandler = new Handler(this, RenderRoomCardList);
			
			var arr:Array = [];
			arr.push(
				{money:"mall/list_bg0.png"},
				{money:"mall/list_bg1.png"},
				{money:"mall/list_bg2.png"},
				{money:"mall/list_bg3.png"}
			);
			
			m_RoomCardList.array = arr;
			
			m_imgBg.addChild(m_RoomCardList);
		}
		
		private function RenderRoomCardList(item:Component,index:int):void 
		{
			if (index < m_RoomCardList.length)
			{
				var m_item:ShopItem = item as ShopItem;
				var data:* = m_RoomCardList.array[index];
				m_item.btnBg.skin = m_RoomCardList.array[index].money;
			}
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////
		private function InitJBList():void
		{
			m_JBList = new List;
			m_JBList.top = 35;
			m_JBList.left = 25;
			m_JBList.height = 260;
			m_JBList.width = 640;
			m_JBList.hScrollBarSkin = "comp/hscroll.png";
			m_JBList.scrollBar.visible = false;
			m_JBList.scrollBar.elasticBackTime = 150;//弹簧返回时间
			m_JBList.scrollBar.elasticDistance = 640;//弹簧能拉最远距离
			m_JBList.itemRender = ShopItem;
			m_JBList.repeatX = 4;//X轴4个
			m_JBList.repeatY = 1;//Y轴1个
			m_JBList.spaceX = 240;
			
			m_JBList.renderHandler = new Handler(this, RenderJBList);
			
			var arr:Array = [];
			arr.push(
				{money:"mall/list_bg_g0.png"},
				{money:"mall/list_bg_g1.png"},
				{money:"mall/list_bg_g2.png"}
			);
			
			m_JBList.array = arr;
			
			m_imgBg.addChild(m_JBList);
		}
		
		private function RenderJBList(item:Component,index:int):void 
		{
			if (index < m_JBList.length)
			{
				var m_item:ShopItem = item as ShopItem;
				var data:* = m_JBList.array[index];
				m_item.btnBg.skin = m_JBList.array[index].money;
			}
		}
		
		//----------------漂亮的分割线---------------------------------------------------------
		public function get btnLeBiClicked():Button 
		{
			return m_btnLeBiClicked;
		}
		
		public function set btnLeBiClicked(value:Button):void 
		{
			m_btnLeBiClicked = value;
		}
		
		public function get btnFangKaClicked():Button 
		{
			return m_btnFangKaClicked;
		}
		
		public function set btnFangKaClicked(value:Button):void 
		{
			m_btnFangKaClicked = value;
		}
		
		public function get btnJinBiClicked():Button 
		{
			return m_btnJinBiClicked;
		}
		
		public function set btnJinBiClicked(value:Button):void 
		{
			m_btnJinBiClicked = value;
		}
		
		public function get LeBList():List 
		{
			return m_LeBList;
		}
		
		public function set LeBList(value:List):void 
		{
			m_LeBList = value;
		}
		
		public function get RoomCardList():List 
		{
			return m_RoomCardList;
		}
		
		public function set RoomCardList(value:List):void 
		{
			m_RoomCardList = value;
		}
		
		public function get JBList():List 
		{
			return m_JBList;
		}
		
		public function set JBList(value:List):void 
		{
			m_JBList = value;
		}
		
		public function get labLeBNum():Label 
		{
			return m_labLeBNum;
		}
		
		public function set labLeBNum(value:Label):void 
		{
			m_labLeBNum = value;
		}
		
		public function get labRoomCardNum():Label 
		{
			return m_labRoomCardNum;
		}
		
		public function set labRoomCardNum(value:Label):void 
		{
			m_labRoomCardNum = value;
		}
		
		public function get labJBNum():Label 
		{
			return m_labJBNum;
		}
		
		public function set labJBNum(value:Label):void 
		{
			m_labJBNum = value;
		}
		
		public function get imgClose():Button 
		{
			return m_imgClose;
		}
		
		public function set imgClose(value:Button):void 
		{
			m_imgClose = value;
		}
		
	}

}