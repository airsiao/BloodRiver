package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.CoreData;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.GameLoader;
	import com.ourgame.mahjong.libaray.vo.GameInfo;
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
				var game:GameInfo = new GameInfo(new XmlValue(<game name="BloodRiver">BloodRiver.xml</game>), new DataExchange());
				game.domain = ApplicationDomain.currentDomain;
				((this.context as State).manager as BloodRiver).info = game;
				
				var loader:GameLoader = new GameLoader();
				loader.addEventListener(BytesEvent.COMPLETE, onGameLoadComplete);
				loader.load(game);
				
				this.context.addController(new ConnectController());
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
				loader.load(stampUrl(CoreData.DEBUG));
			}
			else
			{
				var data:DataExchange = ((this.context as State).manager as BloodRiver).info.data;
				data.ourgameID = Application.stage.loaderInfo.parameters["OurGameID"];
				data.username = Application.stage.loaderInfo.parameters["userName"];
				data.rolename = Application.stage.loaderInfo.parameters["Rolename"];
				data.nickname = Application.stage.loaderInfo.parameters["DisplayName"];
				data.ticket = Application.stage.loaderInfo.parameters["IDCertificate"];
				data.channelID = Application.stage.loaderInfo.parameters["channelID"];
				data.playMode = Application.stage.loaderInfo.parameters["PlayMode"];
				
				this.notify(TableMethod.CONNECT);
					//				(this.context as State).manager.switchState(ConnectState);
			}
		}
		
		private function onUserLoadComplete(event:BytesEvent):void
		{
			var config:Config = new Config((event.target as BytesLoader).content);
			var data:DataExchange = ((this.context as State).manager as BloodRiver).info.data;
			
			data.ourgameID = config.getValue("ourgameID");
			data.username = config.getValue("ourgameID"); //config.getValue("username");
			data.rolename = config.getValue("ourgameID"); // config.getValue("rolename");
			data.nickname = config.getValue("ourgameID"); // config.getValue("nickname");
			data.ticket = config.getValue("ticket");
			data.channelID = config.getValue("channelID");
			data.playMode = config.getValue("PlayMode");
			
			AssetsManager.instance.saveAsset(config.name, (event.target as BytesLoader).content);
			
			this.notify(TableMethod.CONNECT);
			//			(this.context as State).manager.switchState(ConnectState);
		}
	
	}
}
