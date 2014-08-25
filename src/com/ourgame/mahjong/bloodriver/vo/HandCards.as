package com.ourgame.mahjong.bloodriver.vo
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.enum.FanType;
	
	/**
	 * 手牌
	 * @author SiaoLeon
	 */
	public class HandCards
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 胡牌番种列表
		 * @return
		 */
		public function get fanTypes():Vector.<uint>
		{
			var result:Vector.<uint> = new Vector.<uint>();
			
			if (!this.cards.isWin)
			{
				return result;
			}
			
			if (this.cards.isPeng && this.groups.isPeng)
			{
				result.push(FanType.PENGPENG);
			}
			
			if (this.cards.color != CardColor.UNKNOW && (this.groups.color == CardColor.UNKNOW || this.cards.color == this.groups.color))
			{
				result.push(FanType.QINGYISE);
			}
			
			return result;
		}
		
		public var cards:CardList;
		
		public var groups:GroupList;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function HandCards(cards:CardList=null, groups:GroupList=null)
		{
			this.cards = (cards == null) ? new CardList() : cards;
			this.groups = (groups == null) ? new GroupList() : groups;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return this.cards + this.groups;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
