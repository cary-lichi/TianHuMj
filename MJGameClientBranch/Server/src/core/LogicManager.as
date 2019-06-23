package core 
{
	import blls.BaseLogic;
	import blls.CoopLogic;
	import blls.GameLogic;
	import blls.GamehallLogic;
	import blls.LoadingLogic;
	import blls.LoginAccountLogic;
	import blls.LoginLogic;
	import blls.PopUpLogic;
	import blls.RecordLogic;
	import blls.RegisterLogic;
	import blls.RegularLogic;
	import blls.RetrieveLogic;
	import blls.RewardLogic;
	import blls.RoomGoldLogic;
	import blls.SharePromptLogic;
	import blls.TurntableLogic;
	import blls.UserAgreementLogic;
	import blls.VIPHallLogic;
	import blls._Game.ChatLogic;
	import blls._Game.GameSettlementLogic;
	import blls._Game.GamerInfoLogic;
	import blls._Game.LackGoldLogic;
	import blls._Game.RoomSetLogic;
	import blls._Game.TotalScoreLogic;
	import blls._Game.VIPRoomLogic;
	import blls._Game.VIPRoomLogic;
	import blls._GamehallLogic.AboutLogic;
	import blls._GamehallLogic.AddWXLogic;
	import blls._GamehallLogic.CertificationLogic;
	import blls._GamehallLogic.DetailLogic;
	import blls._GamehallLogic.InputRoomIDLogic;
	import blls._GamehallLogic.InviteLogic;
	import blls._GamehallLogic.MailLogic;
	import blls._GamehallLogic.NoticeLogic;
	import blls._GamehallLogic.RecordRuleLogic;
	import blls._GamehallLogic.ServiceLogic;
	import blls._GamehallLogic.SetLogic;
	import blls._GamehallLogic.SpreeLogic;
	import blls._GamehallLogic._ServiceLogic.OnlineLogic;
	import blls._GamehallLogic._ServiceLogic.ProposalLogic;
	import model.User;
	import blls.ShopLogic;
	import laya.utils.Dictionary;
	import blls.WinningLogic;
	/**
	 * ...
	 * @author ...
	 */
	public class LogicManager 
	{
		public static const LOGINLOGIC:int = 1;
		public static const GAMELOGIC:int = 2;
		public static const GAMEHALLLOGIC:int = 3;
		public static const MAILLOGIC:int = 4;
		public static const SHOPLOGIC:int = 5;
		public static const REGULARLOGIC:int = 6;
		public static const SPREELOGIC:int = 7;
		public static const SETLOGIC:int = 8;
		public static const LOGINACCOUNTLOGIC:int = 9;
		public static const RETRIEVELOGIC:int = 10;
		public static const RECORDLOGIC:int = 11;
		public static const REWARDLOGIC:int = 12;
		public static const LACKGOLDLOGIC:int = 13;
		public static const VIPROOMLOGIC:int = 14;
		public static const TURNTABLELOGIC:int = 15;
		public static const WINNINGLOGIC:int = 16;
		public static const LOADINGLOGIC:int = 17;
		public static const REGISTERLOGIC:int = 18;
		public static const CERTIFICATIONLOGIC:int = 19;
		public static const SERVICELOGIC:int = 20;
		public static const INPUTROOMIDLOGIC:int = 21;
		public static const NOTICELOGIC:int = 22;
		public static const SHAREPROMPTLOGIC:int = 23;
		public static const COOPLOGIC:int = 24;
		public static const INVITEWINDOW:int = 25;
		public static const ADDWXLOGIC:int = 26;
		public static const ROOMGOLDLOGIC:int = 27;
		public static const GAMEINFOLOGIC:int = 28;
		public static const DETAILLOGIC:int = 29;
		
		public static const VIPHALLLOGIC:int = 31;
		public static const ABOUTLOGIC:int = 32;


		public static const ONLINELOGIC:int = 35;
		public static const PROPOSALDIA:int = 36;

		public static const POPUPLOGIC:int = 38;
		public static const BONUSHALLLOGIC:int = 39;
		public static const GAMESETTLEMENTLOGIC:int = 40;
		public static const USERAGREEMENTLOGIC:int = 41;
		public static const TOTASCORELOGIC:int = 42;
		public static const CHATLOGIC:int = 43;
		public static const ROOMSETLOGIC:int = 44;
		public static const RECORDRULELOGIC:int = 45;
		
		public function LogicManager()
		{
			
		}
		
		private var m_logicMap:Dictionary = new Dictionary;
		
		//注册所有逻辑
		public function RegisterAllLogics():void
		{
			m_logicMap.set(GAMELOGIC, new GameLogic);
			m_logicMap.set(LOGINLOGIC , new LoginLogic);
			m_logicMap.set(GAMEHALLLOGIC, new GamehallLogic);
			m_logicMap.set(SHAREPROMPTLOGIC, new SharePromptLogic);
			m_logicMap.set(SHOPLOGIC, new ShopLogic);
			m_logicMap.set(REGULARLOGIC, new RegularLogic);
			m_logicMap.set(SETLOGIC,new SetLogic);
			m_logicMap.set(LOGINACCOUNTLOGIC, new LoginAccountLogic);
			m_logicMap.set(RETRIEVELOGIC , new RetrieveLogic);
			m_logicMap.set(SPREELOGIC, new SpreeLogic);
			m_logicMap.set(LACKGOLDLOGIC , new LackGoldLogic);
			m_logicMap.set(VIPROOMLOGIC , new VIPRoomLogic);
			m_logicMap.set(TURNTABLELOGIC , new TurntableLogic);
			m_logicMap.set(WINNINGLOGIC , new WinningLogic);
			m_logicMap.set(LOADINGLOGIC , new LoadingLogic);
			m_logicMap.set(REGISTERLOGIC, new RegisterLogic);
			m_logicMap.set(CERTIFICATIONLOGIC, new CertificationLogic);
			m_logicMap.set(SERVICELOGIC, new ServiceLogic);
			m_logicMap.set(INPUTROOMIDLOGIC, new InputRoomIDLogic);
			m_logicMap.set(NOTICELOGIC, new NoticeLogic);
			
			m_logicMap.set(COOPLOGIC, new CoopLogic);
			m_logicMap.set(INVITEWINDOW, new InviteLogic);
			m_logicMap.set(ADDWXLOGIC, new AddWXLogic);
			m_logicMap.set(ROOMGOLDLOGIC, new RoomGoldLogic);
			m_logicMap.set(RECORDLOGIC, new RecordLogic);
			m_logicMap.set(REWARDLOGIC, new RewardLogic);
			m_logicMap.set(GAMEINFOLOGIC, new GamerInfoLogic);
			m_logicMap.set(DETAILLOGIC, new DetailLogic);
			
			m_logicMap.set(VIPHALLLOGIC, new VIPHallLogic);
			m_logicMap.set(ONLINELOGIC, new OnlineLogic);
			m_logicMap.set(PROPOSALDIA, new ProposalLogic);
			m_logicMap.set(POPUPLOGIC, new PopUpLogic);
			m_logicMap.set(GAMESETTLEMENTLOGIC, new GameSettlementLogic);
			m_logicMap.set(USERAGREEMENTLOGIC, new UserAgreementLogic);
			m_logicMap.set(TOTASCORELOGIC, new TotalScoreLogic);
			m_logicMap.set(CHATLOGIC, new ChatLogic);
			m_logicMap.set(ROOMSETLOGIC, new RoomSetLogic);
			m_logicMap.set(RECORDRULELOGIC, new RecordRuleLogic);
			m_logicMap.set(ABOUTLOGIC, new AboutLogic);
			m_logicMap.set(MAILLOGIC, new MailLogic);

			
		}
		//销毁所有逻辑
		public function UnRegisterAllLogics():void
		{
			for each(var v:BaseLogic in m_logicMap.values)
			{
				v.OnLogicQuit();
			}
			m_logicMap.clear();
		}
		
		public function GetLogic(id:int):BaseLogic
		{
			return m_logicMap.get(id);
		}
		
		//使逻辑可用
		public function ActiveLogic(id:int):void
		{
			var logic:BaseLogic = GetLogic(id);
			logic.OnLogicEnter();
		}
		
		//使逻辑不可用
		public function DectiveLogic(id:int):void
		{
			var logic:BaseLogic = GetLogic(id);
			logic.OnLogicQuit();
		}
		
		//把逻辑从逻辑地图中移除
		public function RemoveLogic(id:int):void
		{
			var logic:BaseLogic = GetLogic(id);
			logic.OnLogicQuit();
			m_logicMap.remove(id);
		}
		
		//使能逻辑
		//public function RespawnLogic(id:int):void
		//{
			//RemoveLogic(id);
			//RegisterAllLogics();
			//ActiveLogic(id);
		//}
		
		////测试
		//public function OnReceiveMessage(msg:*):void
		//{
			//GetLogic(LogicManager.REGISTERLOGIC).OnReceiveMessage(msg);
		//}
		//
		//消息接收
		public function OnReceiveMessage(msg:*):void
		{
			if (msg.type == 86)//assetUpdateNotify
			{
				OnAssetUpdateNotify(msg.notify.assetUpdateNotify);
				return;
			}
			for each(var v:BaseLogic in m_logicMap.values)
			{
				v.OnReceiveMessage(msg);
			}
		}
		//资产更新
		private function OnAssetUpdateNotify(message:*):void 
		{
			var user:User = GameIF.GetUser();
			user.nGold = message.nGold;
			user.nMoney = message.nMoney?message.nMoney:user.nMoney;
		}
	}

}