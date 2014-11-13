package com.ourgame.mahjong.bloodriver
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.utils.SocketProcessor;
	import com.wecoit.debug.Log;
	import com.wecoit.display.DisplayElement;
	import com.wecoit.events.BytesEvent;
	import com.wecoit.loader.ApplicationLoader;
	
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	
	[SWF(width="960", height="600", backgroundColor="#000000", frameRate="24")]
	
	/**
	 * 血流成河程序
	 * @author SiaoLeon
	 */
	public class BloodRiver extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var loader:ApplicationLoader;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function BloodRiver()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		override protected function onAddedToStage():void
		{
			if (this.parent.hasOwnProperty("proxy"))
			{
				CommonData.dataPorxy = this.parent["proxy"];
			}
			
			CommonData.baseDomain = ApplicationDomain.currentDomain;
			CommonData.socketProxy = new SocketProcessor();
			
			this.loader = new ApplicationLoader();
			this.loader.addEventListener(BytesEvent.ERROR, onError, false, 0, true);
			this.loader.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
			this.loader.addEventListener(BytesEvent.COMPLETE, onComplete, false, 0, true);
			this.loader.load("Lobby", CommonData.basePath, new ApplicationDomain(CommonData.baseDomain));
		}
		
		override protected function onRemovedFromStage():void
		{
			this.loader.removeEventListener(BytesEvent.ERROR, onError);
			this.loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loader.removeEventListener(BytesEvent.COMPLETE, onComplete);
			this.loader = null;
		}
		
		private function onError(event:BytesEvent):void
		{
			Log.info("加载错误", this.loader.current);
			
			this.loader = null;
		}
		
		private function onProgress(event:ProgressEvent):void
		{
			var pre:Number = this.loader.currentLoaded / this.loader.currentTotal / this.loader.countTotal + this.loader.countLoaded / this.loader.countTotal;
			pre = isNaN(pre) ? this.loader.countLoaded / this.loader.countTotal : pre;
			
			Log.debug("加载进度：", Math.floor(pre * 100), this.loader.countLoaded, this.loader.countTotal);
		}
		
		private function onComplete(event:BytesEvent):void
		{
			Log.info("加载完成");
			
			this.addChild(this.loader.main);
			this.loader = null;
		}
	
	}
}
