package com.ourgame.mahjong.bloodriver.vo
{
	
	/**
	 * 抓牌动作
	 * @author SiaoLeon
	 */
	public class Action
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		private var _seat:uint;
		
		public function get seat():uint
		{
			return this._seat;
		}
		
		private var _reverse:Boolean;
		
		public function get reverse():Boolean
		{
			return this._reverse;
		}
		
		private var _card:Card;
		
		public function get card():Card
		{
			return this._card;
		}
		
		/**
		 * 构造函数
		 */
		public function Action(seat:uint, card:Card, reverse:Boolean=false)
		{
			this._seat = seat;
			this._card = card;
			this._reverse = reverse;
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}