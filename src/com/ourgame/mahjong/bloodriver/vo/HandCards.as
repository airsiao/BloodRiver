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
			
			result.push(FanType.PING);
			
			if (this.cards.isPeng && this.groups.isPeng)
			{
				result.push(FanType.PENGPENG);
			}
			
			if (this.cards.color != CardColor.UNKNOW && (this.groups.color == CardColor.UNKNOW || this.cards.color == this.groups.color))
			{
				result.push(FanType.QINGYISE);
			}
			
			if (result.indexOf(FanType.PENGPENG) >= 0 && result.indexOf(FanType.QINGYISE) >= 0)
			{
				result.push(FanType.QINGPENG);
			}
			
			return result;
		}
		
		/**
		 * 胡牌番值
		 * @return
		 */
		public function get fanValue():uint
		{
			var types:Vector.<uint> = this.fanTypes;
			
			if (types.length <= 0)
			{
				//没胡
				return 0;
			}
			
			//算番
			var fan:uint = 0;
			
			if (types.indexOf(FanType.PING) >= 0)
			{
				fan = 3;
			}
			
			if (types.indexOf(FanType.PENGPENG) >= 0)
			{
				fan = 6;
			}
			
			if (types.indexOf(FanType.QINGYISE) >= 0)
			{
				fan = 8;
			}
			
			if (types.indexOf(FanType.QINGPENG) >= 0)
			{
				fan = 14;
			}
			
			//算杠
			var gang:uint = 0;
			
			for each (var group:CardGroup in this.groups.list)
			{
				if (group.type == CardGroupType.GANG_MING || group.type == CardGroupType.GANG_BU)
				{
					gang += 1;
				}
				
				if (group.type == CardGroupType.GANG_AN)
				{
					gang += 2;
				}
			}
			
			return fan + gang;
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
		public function get tings():Vector.<TingInfo>
		{
			var result:Vector.<TingInfo> = new Vector.<TingInfo>();
			
			if (!this.isLack)
			{
				return result;
			}
			
			var last:Card = null;
			
			for each (var card:Card in this.cards.list)
			{
				if (last != null && card.color == last.color && card.point == last.point)
				{
					continue;
				}
				
				var cards:CardList = new CardList(this.cards.list.concat());
				var hands:HandCards = new HandCards(cards, this.groups);
				cards.remove(card);
				
				if (cards.tings.length > 0)
				{
					var tings:TingInfo = new TingInfo(card);
					
					for each (var ting:Card in cards.tings)
					{
						cards.add(ting);
						tings.tings.put(ting, hands.fanValue);
						cards.remove(ting);
					}
					
					result.push(tings);
				}
				
				last = card;
			}
			
			return result;
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
