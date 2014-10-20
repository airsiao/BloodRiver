package com.ourgame.mahjong.bloodriver.vo
{
	
	/**
	 * 抓牌动作
	 * @author SiaoLeon
	 */
	public class Action implements IAction
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		private var _type:uint;
		
		public function get type():uint
		{
			return this._type;
		}
		
		public function set type(value:uint):void
		{
			this._type = value;
		}
		
		private var _seat:uint;
		
		public function get seat():uint
		{
			return this._seat;
		}
		
		private var _card:Card;
		
		public function get card():Card
		{
			return this._card;
		}
		
		private var _params:*;
		
		public function get params():*
		{
			return this._params;
		}
		
		public function set params(value:*):void
		{
			this._params = value;
		}
		
		/**
		 * 构造函数
		 */
		public function Action(type:uint, seat:uint, card:Card, params:*=null)
		{
			this._type = type;
			this._seat = seat;
			this._card = card;
			this._params = params;
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
