package core
{
	import laya.events.Event;
	import laya.net.Loader;
	import laya.net.LocalStorage;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ConfigManager
	{
		private var m_config:Object;
		private var m_strBgMusicName:String;
		private var m_json:JSON;
		
		public function ConfigManager()
		{
		
		}
		public function Init():void 
		{
			//设置初始的背景音乐。由配置文件确定
			onLoaded();
			Laya.loader.load("config.json", Handler.create(this, onJsonLoad), null, Loader.JSON);
		}
		
		
		//加载json
		private function onJsonLoad():void 
		{
            m_json= Laya.loader.getRes("config.json");
		}
		//加载LocalStorage
		public function onLoaded():void
		{
			if (!LocalStorage.getJSON("Config"))
			{
				m_config = {"Language": "Putonghua", "MusicVolume": 30,"SoundVolume": 30};
				var str:String = JSON.stringify(m_config);
				LocalStorage.setItem("Config", str);
			}
			//trace("LocalStorage获取成功");
		}
		
		public function GetBgMusicName():String
		{
			m_strBgMusicName = LocalStorage.getJSON("Config").Language;
			return m_strBgMusicName;
			trace(m_strBgMusicName);
		}
		public function GetMusicVolume():int
		{
			return  LocalStorage.getJSON("Config").MusicVolume;
		}
		public function SetBgMusicName(name:String):void
		{
			m_config = LocalStorage.getJSON("Config")
			m_config.Language = name;
			var str:String = JSON.stringify(m_config);
			LocalStorage.setItem("Config", str);
		}
		public function SetMusicVolume(value:int):void
		{
			m_config = LocalStorage.getJSON("Config")
			m_config.MusicVolume = value;
			var str:String = JSON.stringify(m_config);
			LocalStorage.setItem("Config", str);
			GameIF.getInstance().musicManager.ChangeMusicVolume(value / 100);
		}
		public function GetSoundVolume():int
		{
			return  LocalStorage.getJSON("Config").SoundVolume;
		}
		public function SetSoundVolume(value:int):void
		{
			m_config = LocalStorage.getJSON("Config")
			m_config.SoundVolume = value;
			var str:String = JSON.stringify(m_config);
			LocalStorage.setItem("Config", str);
			GameIF.getInstance().musicManager.ChangeSoundVolume(value / 100);
		}
		public function get json():JSON 
		{
			return m_json;
		}


	}

}