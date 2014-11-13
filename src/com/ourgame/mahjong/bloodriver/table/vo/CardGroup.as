package com.ourgame.mahjong.bloodriver.table.vo
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
		
		/**
		 * CardGroupType，牌组类型
		 * @return
		 */
		public function get type():uint
		{
			return this._type;
		}
		
		public function set type(value:uint):void
		{
			this._type = value;
		}
		
		/**
		 * CardColor，牌组花色
		 * @return
		 */
		public function get color():uint
		{
			if (this.cards != null && this.cards.length > 0)
			{
				return this.cards[0].color;
			}
			
			return -1;
		}
		
		/**
		 * 牌组起始点数（如果为碰、杠则点数一样，如果为顺则为最小点数）
		 * @return
		 */
		public function get point():uint
		{
			if (this.cards != null && this.cards.length > 0)
			{
				return this.cards[0].point;
			}
			
			return -1;
		}
		
		private var _cards:Vector.<Card>;
		
		/**
		 * 牌列表
		 * @return
		 */
		public function get cards():Vector.<Card>
		{
			return this._cards;
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
		
		public function fill(cards:Vector.<Card>):void
		{
			this._cards.splice(0, this._cards.length);
			this._cards = cards.concat();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
