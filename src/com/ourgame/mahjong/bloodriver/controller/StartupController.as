package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.CoreData;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.GameLoader;
	import com.ourgame.mahjong.libaray.data.CommonData;
	import com.ourgame.mahjong.libaray.enum.PlayMode;
	import com.ourgame.mahjong.libaray.vo.GameInfo;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.core.FlashPlayer;
	import com.wecoit.data.Config;
	import com.wecoit.data.XmlValue;
	import com.wecoit.debug.Log;
	import com.wecoit.events.BytesEvent;
	import com.wecoit.loader.BytesLoader;
	import com.wecoit.mvc.Application;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.utils.string.stampUrl;
	
	import flash.system.ApplicationDomain;
	
	/**
	 * 启动控制器
	 * @author SiaoLeon
	 */
	public class StartupController extends Controller
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function StartupController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.STARTUP();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function STARTUP():void
		{
			Log.debug("启动血流成河");
			
			if (((this.context as State).manager as BloodRiver).info == null)
			{
				var game:GameInfo = new GameInfo(new XmlValue(<game name="BloodRiver">BloodRiver.xml</game>));
				game.domain = ApplicationDomain.currentDomain;
				((this.context as State).manager as BloodRiver).info = game;
				
				var loader:GameLoader = new GameLoader();
				loader.addEventListener(BytesEvent.COMPLETE, onGameLoadComplete);
				loader.load(game);
			}
			else
			{
				(this.context as State).manager.switchState(TableState);
			}
		}
		
		private function onGameLoadComplete(event:BytesEvent):void
		{
			if (FlashPlayer.isDebug)
			{
				var loader:BytesLoader = new BytesLoader();
				loader.addEventListener(BytesEvent.COMPLETE, onUserLoadComplete);
				loader.addEventListener(BytesEvent.ERROR, onUserLoadError);
				loader.load(stampUrl(CoreData.DEBUG));
			}
			else
			{
				this.loadInfoFromFlashVars();
			}
		}
		
		private function onUserLoadError(event:BytesEvent):void
		{
			this.loadInfoFromFlashVars();
		}
		
		private function onUserLoadComplete(event:BytesEvent):void
		{
			var config:Config = new Config((event.target as BytesLoader).content);
			
			CommonData.user = new UserInfo();
			CommonData.ourgameID = config.getValue("ourgameID");
			CommonData.username = config.getValue("ourgameID"); //config.getValue("username");
			CommonData.rolename = config.getValue("ourgameID"); // config.getValue("rolename");
			CommonData.nickname = config.getValue("ourgameID"); // config.getValue("nickname");
			CommonData.ticket = config.getValue("ticket");
			CommonData.channelID = config.getValue("channelID");
			CommonData.playMode = config.getValue("PlayMode");
			
			AssetsManager.instance.saveAsset(config.name, (event.target as BytesLoader).content);
			
			this.notify(TableMethod.CONNECT);
		}
		
		private function loadInfoFromFlashVars():void
		{
			CommonData.user = new UserInfo();
			CommonData.ourgameID = Application.stage.loaderInfo.parameters["OurgameID"];
			CommonData.username = Application.stage.loaderInfo.parameters["UserName"];
			CommonData.rolename = Application.stage.loaderInfo.parameters["RoleName"];
			CommonData.nickname = Application.stage.loaderInfo.parameters["NickName"];
			CommonData.ticket = Application.stage.loaderInfo.parameters["Ticket"];
			CommonData.channelID = Application.stage.loaderInfo.parameters["ChannelID"];
			CommonData.playMode = PlayMode.ONLINE;
			
			this.notify(TableMethod.CONNECT);
		}
	
	}
}
