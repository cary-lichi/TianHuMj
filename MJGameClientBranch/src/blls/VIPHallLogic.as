package blls 
{
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Handler;
	import model.Gamer;
	import model.GamerBottom;
	import model.Room;
	import model.User;
	import network.NetworkManager;
	import tool.Tool;
	import view.ActiveView.PopUpDia;
	import view.ActiveView.VIPHallView;
	/**
	 * ...
	 * @author ...
	 */
	public class VIPHallLogic extends BaseLogic 
	{
		private var m_vipHallView:VIPHallView;
		//玩法子类
		private var m_PlayWayArr:Array = [];
		//玩法大类型(哈尔滨、牡丹江)
		private var m_nPlayType:int = 1;
		//玩法子类大类型(传统胡法、夹胡玩法)
		private var m_nPlayChildType:int=4;
		//房间类型(普通房间,比赛房间)
		private var m_nRoomType:int = 0;
		//房卡类型(2、4、8圈房卡)
		private var m_CardType:int = 1;
		//房间人数（ 2 3 4 人）
		private var m_nPlayers:int = 4;
		
		private  var m_Hhzdb:int;
		private  var m_Hhzmtf:int ;
		private  var m_Hdf:int ;
		private  var m_Hdb:int ;
		private  var m_Hbh:int ;
		private  var m_Hddsj:int ;
		private  var m_Hzfb:int ;
		private  var m_Hypdx:int ;
		
		private  var m_Mdb:int ;
		private  var m_Mdf:int ;
		private  var m_Mdk:int ;
		private  var m_Mxd:int ;
		private  var m_Mhzmtf:int ;
		private  var m_Mzfb :int;
		private  var m_Mypdx:int;
		private var m_popUpDia:view.ActiveView.PopUpDia;
		
		public function VIPHallLogic() 
		{
			super();
			
		}
		public override function Init():void
		{
			//初始化LoginView
			if (m_vipHallView == null)
			{
				m_vipHallView = new VIPHallView;
				m_vipHallView.Init();
			}
			m_vipHallView.visible = true;

			//注册所有按钮事件
			registerEventClick();
			//哈尔滨玩法
			InitHEBCBEvent();
			//牡丹江玩法
			InitMDJEvent();
			//从配置文件获取信息
			InitJson();
			
			m_PlayWayArr = [m_Hhzdb, m_Hhzmtf, m_Hdf, m_Hdb];
		}
		
		//从配置文件获取信息
		private function InitJson():void 
		{
			m_Hhzdb = GameIF.GetJson()['haerbin']['hongzhongbao'];
			m_Hhzmtf = GameIF.GetJson()['haerbin']['hongzhong'];
			m_Hdf = GameIF.GetJson()['haerbin']['dafeng'];
			m_Hdb = GameIF.GetJson()['haerbin']['duibao'];
			m_Hbh = GameIF.GetJson()['haerbin']['bianhu'];
			m_Hddsj = GameIF.GetJson()['haerbin']['dandiao'];
			m_Hzfb = GameIF.GetJson()['haerbin']['zhuang'];
			m_Hypdx = GameIF.GetJson()['haerbin']['duoxiang'];
			
			m_Mdb = GameIF.GetJson()['mudanjiang']['duibao'];
			m_Mdf = GameIF.GetJson()['mudanjiang']['dafeng'];
			m_Mdk = GameIF.GetJson()['mudanjiang']['dakou'];
			m_Mxd = GameIF.GetJson()['mudanjiang']['xiadan'];
			m_Mhzmtf = GameIF.GetJson()['mudanjiang']['hongzhong'];
			m_Mzfb = GameIF.GetJson()['mudanjiang']['zhuang'];
			m_Mypdx = GameIF.GetJson()['mudanjiang']['duoxiang'];
		}
		
		//哈尔滨玩法
		private function InitHEBCBEvent():void 
		{
			m_vipHallView.m_cbHZDB.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbHZSS.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbGDF.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbDB.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbSQBSJ.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbDDSJ.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbYPDX.on(Event.CLICK, this, OnHEBCBClicked);
			m_vipHallView.m_cbZJFB.on(Event.CLICK, this, OnHEBCBClicked);
		}
		
		//牡丹江玩法
		private function InitMDJEvent():void 
		{
			m_vipHallView.m_cbMdb.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMxd.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMdf.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMdk.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMhzmtf.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMzfb.on(Event.CLICK, this, OnMDJCBClicked);
			m_vipHallView.m_cbMypdx.on(Event.CLICK, this, OnMDJCBClicked);
		}
		
		private function OnHEBCBClicked(e:Event):void
		{
			if (m_vipHallView.m_radioHRB.selectedIndex==1)
				{
					m_nPlayChildType = GameIF.GetJson()['haerbin']['jiahu'];
					m_vipHallView.m_radioHRB.selectedIndex = 0;
				}
			switch(e.target.name)
			{
				case "hzdb":
					if (m_vipHallView.m_cbHZDB.selected)
					{
						AddPlayWay(m_Hhzdb);
					}
					else if (!m_vipHallView.m_cbHZDB.selected)
					{
						DelPlayWay(m_Hhzdb);
					}
					break;
					
				case "hzss":
					if (m_vipHallView.m_cbHZSS.selected)
					{
						AddPlayWay(m_Hhzmtf);
					}
					else if (!m_vipHallView.m_cbHZSS.selected)
					{
						DelPlayWay(m_Hhzmtf);
					}
					break;
					
				case "gdf":
					if (m_vipHallView.m_cbGDF.selected)
					{
						AddPlayWay(m_Hdf);
					}
					else if (!m_vipHallView.m_cbGDF.selected)
					{
						DelPlayWay(m_Hdf);
					}
					break;
					
				case "db":
					if (m_vipHallView.m_cbDB.selected)
					{
						AddPlayWay(m_Hdb);
					}
					else if (!m_vipHallView.m_cbDB.selected)
					{
						DelPlayWay(m_Hdb);
					}
					break;
					
				case "bh":
					if (m_vipHallView.m_cbSQBSJ.selected)
					{
						AddPlayWay(m_Hbh);
					}
					else if (!m_vipHallView.m_cbSQBSJ.selected)
					{
						DelPlayWay(m_Hbh);
					}
					break;
					
				case "ddsj":
					if (m_vipHallView.m_cbDDSJ.selected)
					{
						AddPlayWay(m_Hddsj);
					}
					else if (!m_vipHallView.m_cbDDSJ.selected)
					{
						DelPlayWay(m_Hddsj);
					}
					break;
					
				case "zjfb":
					if (m_vipHallView.m_cbZJFB.selected)
					{
						AddPlayWay(m_Hzfb);
					}
					else if (!m_vipHallView.m_cbZJFB.selected)
					{
						DelPlayWay(m_Hzfb);
					}
					break;
					
				case "ypdx":
					if (m_vipHallView.m_cbYPDX.selected)
					{
						AddPlayWay(m_Hypdx);
					}
					else if (!m_vipHallView.m_cbYPDX.selected)
					{
						DelPlayWay(m_Hypdx);
					}
					break;
			}
		}
		
		private function OnMDJCBClicked(e:Event):void
		{
			if (m_vipHallView.m_radioMDJ.selectedIndex==1)
				{
					m_nPlayChildType = GameIF.GetJson()['mudanjiang']['jiahu'];
					m_vipHallView.m_radioMDJ.selectedIndex = 0;
				}
			switch(e.target.name)
			{
					
				case "db":
					if (m_vipHallView.m_cbMdb.selected)
					{
						AddPlayWay(m_Mdb);
					}
					else if (!m_vipHallView.m_cbMdb.selected)
					{
						DelPlayWay(m_Mdb);
					}
					break;
					
				case "df":
					if (m_vipHallView.m_cbMdf.selected)
					{
						AddPlayWay(m_Mdf);
					}
					else if (!m_vipHallView.m_cbMdf.selected)
					{
						DelPlayWay(m_Mdf);
					}
					break;
					
				case "dk":
					if (m_vipHallView.m_cbMdk.selected)
					{
						AddPlayWay(m_Mdk);
					}
					else if (!m_vipHallView.m_cbMdk.selected)
					{
						DelPlayWay(m_Mdk);
					}
					break;
					
				case "xd":
					if (m_vipHallView.m_cbMxd.selected)
					{
						AddPlayWay(m_Mxd);
					}
					else if (!m_vipHallView.m_cbMxd.selected)
					{
						DelPlayWay(m_Mxd);
					}
					break;
					
				case "hzmtf":
					if (m_vipHallView.m_cbMhzmtf.selected)
					{
						AddPlayWay(m_Mhzmtf);
					}
					else if (!m_vipHallView.m_cbMhzmtf.selected)
					{
						DelPlayWay(m_Mhzmtf);
					}
					break;
					
				case "ypdx":
					if (m_vipHallView.m_cbMypdx.selected)
					{
						AddPlayWay(m_Mypdx);
					}
					else if (!m_vipHallView.m_cbMypdx.selected)
					{
						DelPlayWay(m_Mypdx);
					}
					break;
					
				case "zfb":
					if (m_vipHallView.m_cbMzfb.selected)
					{
						AddPlayWay(m_Mzfb);
					}
					else if (!m_vipHallView.m_cbMzfb.selected)
					{
						DelPlayWay(m_Mzfb);
					}
					break;
			}
		}
		
		private function AddPlayWay(index:Number):void
		{
			m_PlayWayArr.push(index);
		}
		
		private function DelPlayWay(index:Number):void
		{
			for (var i:Number = 0; i < m_PlayWayArr.length; i++ )
			{
				if (m_PlayWayArr[i] == index)
				{
					m_PlayWayArr.splice(i, 1);
					break;
				}
			}
		}
		
		//初始化哈尔滨选框
		private function InitHEBCB():void 
		{
			//全不选
			m_vipHallView.m_cbHZDB.selected = false;
			m_vipHallView.m_cbHZSS.selected = false;
			m_vipHallView.m_cbGDF.selected = false;
			m_vipHallView.m_cbDB.selected = false;
			m_vipHallView.m_cbSQBSJ.selected = false;
			m_vipHallView.m_cbDDSJ.selected = false;
			m_vipHallView.m_cbYPDX.selected = false;
			m_vipHallView.m_cbZJFB.selected = false;
		}
		
		//哈尔滨全选
		private function SetHEBCBAllSelect():void
		{
			m_vipHallView.m_cbHZDB.selected = true;
			m_vipHallView.m_cbHZSS.selected = true;
			m_vipHallView.m_cbGDF.selected = true;
			m_vipHallView.m_cbDB.selected = true;
			m_vipHallView.m_cbSQBSJ.selected = false;
			m_vipHallView.m_cbDDSJ.selected = false;
			m_vipHallView.m_cbYPDX.selected = false;
			m_vipHallView.m_cbZJFB.selected = false;
		}

		
		//初始化牡丹江选框
		private function InitMDJCB():void 
		{
			//全不选
			m_vipHallView.m_cbMypdx.selected = false;
			m_vipHallView.m_cbMdb.selected = false;
			m_vipHallView.m_cbMxd.selected = false;
			m_vipHallView.m_cbMhzmtf.selected = false;
			m_vipHallView.m_cbMdf.selected = false;
			m_vipHallView.m_cbMdk.selected = false;
			m_vipHallView.m_cbMzfb.selected = false;
		}
		//牡丹江全选
		private function SetMDJCBAllSelect():void
		{
			m_vipHallView.m_cbMypdx.selected = true;
			m_vipHallView.m_cbMdb.selected = true;
			m_vipHallView.m_cbMxd.selected = true;
			m_vipHallView.m_cbMhzmtf.selected = true;
			m_vipHallView.m_cbMdf.selected = false;
			m_vipHallView.m_cbMdk.selected = false;
			m_vipHallView.m_cbMzfb.selected = false;
		}
		//哈尔滨  胡法
		private function onHEBRadioChange(index:int):void 
		{
			
			if (index == 0)//胡死夹
			{
				m_PlayWayArr = [];
				if (m_nPlayChildType == GameIF.GetJson()['haerbin']['chuantong'])
				{
					SetHEBCBAllSelect();
					m_PlayWayArr = [m_Hhzdb, m_Hhzmtf, m_Hdf, m_Hdb];
				}
				m_nPlayChildType = GameIF.GetJson()['haerbin']['jiahu'];
			}
			else if (index == 1)//传统胡法
			{
				m_PlayWayArr = [];
				InitHEBCB();
				m_nPlayChildType = GameIF.GetJson()['haerbin']['chuantong'];
			}
			
			
			
		}
		//牡丹江
		private function onMDJadioChange(index:int):void 
		{
			
			if (index == 0)//胡死夹
			{
				m_PlayWayArr = [];
				if (m_nPlayChildType==GameIF.GetJson()['mudanjiang']['chuantong'])
				{
					SetMDJCBAllSelect();
					m_PlayWayArr = [m_Mypdx, m_Mdb, m_Mxd, m_Mhzmtf];
					m_nPlayChildType = GameIF.GetJson()['mudanjiang']['jiahu'];
				}
				
			}
			else if (index == 1)//传统胡法
			{
				m_PlayWayArr = [];
				InitMDJCB();
				m_nPlayChildType = GameIF.GetJson()['mudanjiang']['chuantong'];
			}
			
		}
		//哈尔滨 牡丹江  圈数 
		private function onNumCHange(index:int):void 
		{
			m_CardType = index + 1;
			m_vipHallView.m_6_2.text = "x" + (m_vipHallView.m_RadioNum.selectedIndex+2);
		}
		//人数
		private function onGamerNumCHange(index:int):void 
		{
			m_nPlayers = 4 - index;
		}
		public override function Destroy():void
		{
			if (m_vipHallView)
			{
				m_vipHallView.Destroy();
				m_vipHallView.destroy();
				m_vipHallView = null;
			}
		}
		
		//注册所有按钮事件	
		private function registerEventClick():void 
		{
			m_vipHallView.m_btnBack.on(Event.CLICK, this, onBackClicked);
			 //创建房间
			 m_vipHallView.m_createRoom.offAll();
			 m_vipHallView.m_createRoom.on(Event.CLICK, this, onCreateRoomClicked);
			 //胡牌
			m_vipHallView.m_radioHRB.selectHandler = new Handler(this, onHEBRadioChange);
			m_vipHallView.m_radioMDJ.selectHandler = new Handler(this, onMDJadioChange);
			//局数
			m_vipHallView.m_RadioNum.selectHandler = new Handler(this, onNumCHange);
			//人数
			m_vipHallView.m_RadioGamerNum.selectHandler = new Handler(this,onGamerNumCHange);
		}
		
		//普通房间
		private function onCreateRoomClicked():void 
		{
			//连接Socket
			GameIF.getInstance().networkManager.InitSocket(this,CreateVIPRoom);
			GameIF.getInstance().networkManager.SocketConnect(GameIF.GetDalManager().daluser.nID);
		}
		//代理房间
		private function onCreateDeleRoomClicked():void 
		{
			//直接发送
			CreateDeleRoom();
		}
		
		private function onBackClicked():void 
		{
			GameIF.DectiveLogic(LogicManager.VIPHALLLOGIC);
			GameIF.ActiveLogic(LogicManager.GAMEHALLLOGIC);
		}
		//代理房间
		public function SetDeleReateRoom():void 
		{
			m_vipHallView.m_createRoom.offAll();
			m_vipHallView.m_createRoom.on(Event.CLICK, this, onCreateDeleRoomClicked);
		}
		//哈尔滨玩法
		public function ShowHRBCreateRoom():void 
		{
			m_PlayWayArr = [];
			m_nPlayType = 1;
			m_nPlayChildType = GameIF.GetJson()['haerbin']['jiahu'];
			m_PlayWayArr = [m_Hhzdb, m_Hhzmtf, m_Hdf, m_Hdb];
			m_vipHallView.m_boxHRBplay.visible = true;
		}
		//牡丹江玩法
		public function ShowMDJCreateRoom():void 
		{
			m_PlayWayArr = [];
			m_nPlayType = 2;
			m_nPlayChildType = GameIF.GetJson()['mudanjiang']['jiahu'];
			m_PlayWayArr = [m_Mypdx, m_Mdb, m_Mxd, m_Mhzmtf];
			m_vipHallView.m_boxMDJplay.visible = true;
		}
		//VipHall创建房间
		private function CreateVIPRoom():void
		{	
			var CreateGamePlayMsg:* = NetworkManager.m_msgRoot.lookupType("GamePlay");
			var createGamePlayMsg:* = CreateGamePlayMsg.create({
				nType:m_nPlayChildType,
				optionals:m_PlayWayArr
			});
			
			//Request当中具体的内容
			var CreateRoomRequest:* = NetworkManager.m_msgRoot.lookupType("CreateRoomRequest");
			var createRoomRequestMsg:* = CreateRoomRequest.create({
				nUserID:GameIF.GetDalManager().daluser.nID,
				sCardType:m_CardType.toString(),
				nPlayers:m_nPlayers.toString(),
				gamePlay:createGamePlayMsg
			});
			
			//包含了Request的内容
			var Request:* = NetworkManager.m_msgRoot.lookupType("Request");
			var requestMsg:* = Request.create({
				createRoomRequest:createRoomRequestMsg
			});
			
			//最终发送的是这个Msg，它里面包含了所嵌套的消息
			var Msg:* = NetworkManager.m_msgRoot.lookupType("Msg");
			var MsgMessage:* = Msg.create({
				type:5,
				request:requestMsg
			});
			
			//发送之前需要编码，编码使用具体发送时用于查找的那个lookup的变量
			var encodeMessage:* = Msg.encode(MsgMessage).finish();
			GameIF.getInstance().networkManager.SocketSendMessage(encodeMessage);
		}
		//创建代理房间
		private function CreateDeleRoom():void 
		{
			var CreateGamePlayMsg:* = NetworkManager.m_msgRoot.lookupType("GamePlay");
			var createGamePlayMsg:* = CreateGamePlayMsg.create({
				nType:m_nPlayChildType,
				optionals:m_PlayWayArr
			});
			
			//Request当中具体的内容
			var CreateRoomRequest:* = NetworkManager.m_msgRoot.lookupType("CreateDeleRoomRequest");
			var createRoomRequestMsg:* = CreateRoomRequest.create({
				nUserID:GameIF.GetDalManager().daluser.nID,
				sCardType:m_CardType.toString(),
				nPlayers:m_nPlayers.toString(),
				gamePlay:createGamePlayMsg
			});
			
			//包含了Request的内容
			var Request:* = NetworkManager.m_msgRoot.lookupType("Request");
			var requestMsg:* = Request.create({
				createRoomRequest:createRoomRequestMsg
			});
			
			//最终发送的是这个Msg，它里面包含了所嵌套的消息
			var Msg:* = NetworkManager.m_msgRoot.lookupType("Msg");
			var MsgMessage:* = Msg.create({
				type:5,
				request:requestMsg
			});
			
			//发送之前需要编码，编码使用具体发送时用于查找的那个lookup的变量
			var encodeMessage:* = Msg.encode(MsgMessage).finish();
			GameIF.getInstance().networkManager.HttpSendMessage(encodeMessage,"deleCreateRoom");
		}
		////发送加入房间的请求
		//private function CreatJoinRoomMessage():void
		//{
			//var CreateJoinRoomRequest:* = NetworkManager.m_msgRoot.lookupType("JoinRoomRequest");
			//var createJoinRoomRequestMsg:* = CreateJoinRoomRequest.create({
				//nUserID:GameIF.GetDalManager().daluser.nID,
				//sRoomID:"123"
			//});
			//
			//var Request:* = NetworkManager.m_msgRoot.lookupType("Request");
			//var requestMsg:* = Request.create({
				//joinRoomRequest:createJoinRoomRequestMsg
			//});
			//
			//var Msg:* = NetworkManager.m_msgRoot.lookupType("Msg");
			//var MsgMessage:* = Msg.create({
				//type:7,
				//request:requestMsg
			//});
			//
			//var encodeMessage:* = Msg.encode(MsgMessage).finish();
			//GameIF.getInstance().networkManager.SocketSendMessage(encodeMessage);
		//}
		
		//创建房间时接收到的消息
		public override function OnReceiveMessage(msg:*):void
		{
			//最好写个枚举类型定义或直接用Proto中定义的
			if (msg.type == 6)//createroomresponse
			{
				OnCreateRoomResponse(msg.response.createRoomResponse);
			}
			else if (msg.type == 102)
			{
				OnCreateDeleRoomResponse(msg.response.createRoomResponse);
			}
		}
		
		//接受消息
		private function OnCreateRoomResponse(message:*):void
		{
			var nErrorCode:JSON = GameIF.GetJson()["nErrorCode"];
			if (message.nErrorCode == nErrorCode["success"])
			{
				var room:Room = Tool.getNewRoom(message.sCardType);
				room.sRoomID = message.sRoomID;
				room.sCardType = message.sCardType;
				room.SetPlayers(message.nPlayers);
				//添加一个room
				GameIF.GetDalManager().dalRoom.AddRoom(room);
				
				var gamer:Gamer = Tool.getNewGamer(0,0);
				var user:User = GameIF.GetUser();
				gamer.nGID = user.nUserID;
				gamer.nPos = 0;//东南西北
				gamer.bBoss = true;
				gamer.bOwner = true;
				gamer.sNick = user.sNick;
				gamer.sHeadimg = user.sHeadimg;
				gamer.vipRoomView = room.vipRoomView;
				gamer.nGameState = GameIF.GetJson()["gameState"]["join"];
				gamer.nGender = user.nGender;
				gamer.bIsLocation = user.bIsLocation;
				gamer.sLat = user.sLat;
				gamer.sLng = user.sLng;
				gamer.sAddress = user.sAddress;
				gamer.Init();
				room.AddGamer(gamer);
				room.SetGamePlay(message.gamePlay);
				room.ShowMyGPS();
				//进入游戏逻辑
				
				if (m_vipHallView)
				{
					GameIF.DectiveLogic(LogicManager.VIPHALLLOGIC);
				}
				else
				{
					GameIF.DectiveLogic(LogicManager.GAMEHALLLOGIC);
				}
				GameIF.ActiveLogic(LogicManager.VIPROOMLOGIC);
				
				//测试//
				//room.OnStartGameClicked();
			}
			else if (message.nErrorCode == nErrorCode["moneyerror"])
			{
				ShowPopUpDia();
			}
		}
		
		//代开房间
		private function OnCreateDeleRoomResponse(message:*):void 
		{
			var nErrorCode:JSON = GameIF.GetJson()["nErrorCode"];
			if (message.nErrorCode == nErrorCode["success"])
			{
				InviteFriend(message);
			}
			else
			{
				GameIF.GetPopUpDia("网络繁忙，创建失败");
			}
		}
		//分享好友
		protected function InviteFriend(message:*):void 
		{
			var json:JSON = GameIF.GetJson();
				if (json["equipType"] == json["equipEnum"]["Web"])
					henderWeb(message);
				if (json["equipType"] == json["equipEnum"]["Android"])
					henderAndroidWX(message);
				if (json["equipType"] == json["equipEnum"]["IOS"])
					henderIOSWX(message);
				if (json["equipType"] == json["equipEnum"]["wxWeb"])
					henderWX(message);
			
		}
		
		protected function henderWeb(message:*):void 
		{
			//GameIF.ActiveLogic(LogicManager.SHAREPROMPTLOGIC);
			return ;
		} 
		
		protected function henderAndroidWX(message:*):void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("com.tianhu.majiang.WxAndroid");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			var roomID:String = message.sRoomID;
			var sICode:String= GameIF.GetUser().sICode;
			testAdd.callWithBack(null,"wxShareSceneSession",roomID,sICode);
		}
		
		protected function henderIOSWX(message:*):void 
		{
			//创建Test类
			var Test:*=Laya.PlatformClass.createClass("SwxClass");
			//创建Test 对象
			var testAdd:* = Test.newObject(); //不支持构造函数
			//调用成员函数
			testAdd.callWithBack(null,"wxShareSceneSession");
		}
		protected function henderWX(message:*):void 
		{
			GameIF.ActiveLogic(LogicManager.SHAREPROMPTLOGIC);
			var roomID:String = message.sRoomID;
			var sICode:String= GameIF.GetUser().sICode;
			__JS__('btnShareAppMessage(roomID,sICode)');
			
		}
		
		private function ShowPopUpDia():void 
		{
			m_popUpDia = null;
			m_popUpDia = new PopUpDia;
			m_popUpDia.Init();
			m_popUpDia.m_lableisOK.text = "去充值";
			m_popUpDia.m_lableTitle.text = "您的钻石不足";
			m_popUpDia.m_btnIsOK.on(Event.CLICK, this, OnIsOkClicked);
			m_popUpDia.m_imgBackBg.on(Event.CLICK, this, OnBackBgClicked);
			m_popUpDia.m_btnClose.visible = true;
			m_popUpDia.m_btnClose.on(Event.CLICK, this, OnCloseClicked);
		}
		
		private function OnCloseClicked():void 
		{
			m_popUpDia.Destroy();
			m_popUpDia = null;
		}
		
		private function OnBackBgClicked():void 
		{
			return;
		}
		
		private function OnIsOkClicked():void 
		{
			GameIF.ActiveLogic(LogicManager.ROOMGOLDLOGIC);
		}
	}

}