package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.wecoit.display.DisplayElement;
	import com.wecoit.errors.SingletonError;
	
	/**
	 * 图层管理器
	 * @author SiaoLeon
	 */
	public class TableLayer
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static var _instance:TableLayer;
		
		/**
		 * 获取单例对象
		 */
		public static function get instance():TableLayer
		{
			if (_instance == null)
			{
				_instance = new TableLayer();
			}
			return _instance;
		}
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _tip:DisplayElement;
		
		/**
		 * 提示层
		 * @return
		 */
		public function get tip():DisplayElement
		{
			return this._tip;
		}
		
		private var _pop:DisplayElement;
		
		/**
		 * 弹出层
		 * @return
		 */
		public function get pop():DisplayElement
		{
			return this._pop;
		}
		
		private var _foreground:DisplayElement;
		
		/**
		 * 前景层
		 * @return
		 */
		public function get foreground():DisplayElement
		{
			return this._foreground;
		}
		
		private var _role:DisplayElement;
		
		/**
		 * 角色层
		 * @return
		 */
		public function get role():DisplayElement
		{
			return this._role;
		}
		
		private var _tile:DisplayElement;
		
		/**
		 * 牌层
		 * @return
		 */
		public function get tile():DisplayElement
		{
			return this._tile;
		}
		
		private var _background:DisplayElement;
		
		/**
		 * 背景层
		 * @return
		 */
		public function get background():DisplayElement
		{
			return this._background;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数，单例模式
		 */
		public function TableLayer()
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
			this._background = new DisplayElement();
			this._tile = new DisplayElement();
			this._role = new DisplayElement();
			this._foreground = new DisplayElement();
			this._pop = new DisplayElement();
			this._tip = new DisplayElement();
		}
	
	}
}
