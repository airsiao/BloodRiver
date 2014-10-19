package com.ourgame.mahjong.bloodriver.vo
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.enum.CardGroupType;
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
		
		/**
		 * 是否断一门
		 * @return
		 */
		public function get isLack():Boolean
		{
			var wan:uint = this.cards.getCards(CardColor.WAN).length + this.groups.getGroupsByColor(CardColor.WAN).length;
			var tiao:uint = this.cards.getCards(CardColor.TIAO).length + this.groups.getGroupsByColor(CardColor.TIAO).length;
			var bing:uint = this.cards.getCards(CardColor.BING).length + this.groups.getGroupsByColor(CardColor.BING).length;
			
			return (wan == 0 || tiao == 0 || bing == 0);
		}
		
		/**
		 * 是否可和
		 * @return
		 */
		public function get isWin():Boolean
		{
			return this.isLack && this.cards.isWin;
		}
		
		/**
		 * 可听的牌
		 * @return
		 */
		public function get tings():Vector.<Card>
		{
			return (this.isLack) ? this.cards.tings : new Vector.<Card>();
		}
		
		/**
		 * 可杠的牌
		 * @return
		 */
		public function get gangs():Vector.<CardGroup>
		{
			var result:Vector.<CardGroup> = new Vector.<CardGroup>();
			var cards:CardList = new CardList(this.cards.list.concat());
			
			var pengs:Vector.<CardGroup> = this.groups.getGroupsByType(CardGroupType.KE);
			
			for each (var peng:CardGroup in pengs)
			{
				if (cards.getCards(peng.color, peng.point).length > 0)
				{
					var bu:CardGroup = new CardGroup();
					bu.type = CardGroupType.GANG_BU;
					bu.fill(peng.cards);
					bu.cards.push(cards.getCards(peng.color, peng.point)[0]);
					result.push(bu);
				}
			}
			
			var gangs:Vector.<CardGroup> = this.cards.gangs;
			
			for each (var an:CardGroup in gangs)
			{
				result.push(an);
			}
			
			return result;
		}
		
		/**
		 * 牌列表
		 * @default
		 */
		public var cards:CardList;
		
		/**
		 * 牌组列表
		 * @default
		 */
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
