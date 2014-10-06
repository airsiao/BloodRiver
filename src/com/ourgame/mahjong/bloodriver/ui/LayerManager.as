package com.ourgame.mahjong.bloodriver.ui
{
	import com.wecoit.errors.SingletonError;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * 图层管理器
	 * @author SiaoLeon
	 */
	public class LayerManager
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static var _instance:LayerManager;
		
		/**
		 * 获取单例对象
		 */
		public static function get instance():LayerManager
		{
			if (_instance == null)
			{
				_instance = new LayerManager();
			}
			return _instance;
		}
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _foreground:DisplayObjectContainer;
		
		public function get foreground():DisplayObjectContainer
		{
			return this._foreground;
		}
		
		private var _background:DisplayObjectContainer;
		
		public function get background():DisplayObjectContainer
		{
			return this._background;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数，单例模式
		 */
		public function LayerManager()
		{
			if (_instance != null)
			{
				throw new SingletonError(this);
			}
			_instance = this;
			
			this.init();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function init():void
		{
			this._background = new Sprite();
			this._foreground = new Sprite();
		}
	
	}
}
