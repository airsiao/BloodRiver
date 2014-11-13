package com.ourgame.mahjong.bloodriver.lobby.model
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.data.XmlValue;
	import com.wecoit.debug.Log;
	import com.wecoit.events.BytesEvent;
	import com.wecoit.loader.ApplicationLoader;
	import com.wecoit.mvc.Model;
	
	import flash.display.DisplayObject;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	
	/**
	 * 游戏加载数据模型
	 * @author SiaoLeon
	 */
	public class GameLoadModel extends Model
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _currentMain:DisplayObject;
		
		public function get currentMain():DisplayObject
		{
			return this._currentMain;
		}
		
		private var _currentName:String;
		
		public function get currentName():String
		{
			return this._currentName;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var loader:ApplicationLoader;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameLoadModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.loader = new ApplicationLoader();
			this.loader.addEventListener(BytesEvent.ERROR, onError, false, 0, true);
			this.loader.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
			this.loader.addEventListener(BytesEvent.COMPLETE, onComplete, false, 0, true);
		}
		
		override public function onRemove():void
		{
			this.loader.removeEventListener(BytesEvent.ERROR, onError);
			this.loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loader.removeEventListener(BytesEvent.COMPLETE, onComplete);
			this.loader = null;
		}
		
		public function load(id:uint):void
		{
			var gameList:Vector.<XmlValue> = AssetsManager.instance.getConfig("Games").getOptions("id", id);
			
			if (gameList.length <= 0)
			{
				this.notify(LobbyMethod.LOAD_GAME_ERROR);
				return;
			}
			
			var game:XmlValue = gameList[0];
			
			if (this.currentMain == null || this.currentName != game.name)
			{
				this.loader.load(game.name, CommonData.basePath, new ApplicationDomain(CommonData.baseDomain));
			}
			else
			{
				this.notify(LobbyMethod.LOAD_GAME_COMPLETE);
			}
		}
		
		public function unload():void
		{
			if (this.currentMain != null)
			{
				if (this._currentMain.parent != null)
				{
					this._currentMain.parent.removeChild(this._currentMain);
				}
				
				this._currentMain = null;
			}
			
			this._currentName = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onError(event:BytesEvent):void
		{
			this.notify(LobbyMethod.LOAD_GAME_ERROR, this.loader.current);
		}
		
		private function onProgress(event:ProgressEvent):void
		{
			var pre:Number = this.loader.currentLoaded / this.loader.currentTotal / this.loader.countTotal + this.loader.countLoaded / this.loader.countTotal;
			pre = isNaN(pre) ? this.loader.countLoaded / this.loader.countTotal : pre;
			
			Log.debug("加载进度：", Math.floor(pre * 100), this.loader.countLoaded, this.loader.countTotal);
			
			this.notify(LobbyMethod.LOAD_GAME_PROGRESS, pre);
		}
		
		private function onComplete(event:BytesEvent):void
		{
			Log.info("加载完成");
			
			this._currentMain = this.loader.main;
			this._currentName = this.loader.appName;
			
			this.notify(LobbyMethod.LOAD_GAME_COMPLETE);
		}
	
	}
}
