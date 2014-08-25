package com.ourgame.mahjong.bloodriver.vo
{
	
	/**
	 * 麻将牌组
	 * @author SiaoLeon
	 */
	public class CardGroup
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _type:uint;
		
		public function get type():uint
		{
			return this._type;
		}
		
		public function get color():uint
		{
			if (this.cards != null && this.cards.length > 0)
			{
				return this.cards[0].color;
			}
			
			return -1;
		}
		
		public function get point():uint
		{
			if (this.cards != null && this.cards.length > 0)
			{
				return this.cards[0].point;
			}
			
			return -1;
		}
		
		private var _cards:Vector.<Card>;
		
		public function get cards():Vector.<Card>
		{
			return this.cards;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function CardGroup(... cards)
		{
			this._cards = new Vector.<Card>();
			
			for each (var card:Card in cards)
			{
				this._cards.push(card);
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return "(" + this.cards.join(",") + ")";
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
