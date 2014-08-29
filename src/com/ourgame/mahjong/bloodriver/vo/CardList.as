package com.ourgame.mahjong.bloodriver.vo
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.utils.MahjongFactory;
	import com.ourgame.mahjong.bloodriver.utils.compareCardByID;
	
	/**
	 * 麻将牌列表
	 * @author SiaoLeon
	 */
	public class CardList
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 是否除将外全为刻
		 * @return
		 */
		public function get isPeng():Boolean
		{
			var pairs:Vector.<Card> = this.pairs;
			
			if (pairs.length != 1)
			{
				return false;
			}
			
			for each (var card:Card in this.list)
			{
				if (card.color == pairs[0].color && card.point == pairs[0].point)
				{
					continue;
				}
				
				if (this.getCards(card.color, card.point).length < 3)
				{
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * 是否断一门
		 * @return
		 */
		public function get isLack():Boolean
		{
			var wan:Vector.<Card> = this.getCards(CardColor.WAN);
			var tiao:Vector.<Card> = this.getCards(CardColor.TIAO);
			var bing:Vector.<Card> = this.getCards(CardColor.BING);
			
			return (wan.length == 0 || tiao.length == 0 || bing.length == 0);
		}
		
		/**
		 * 是否可和
		 * @return
		 */
		public function get isWin():Boolean
		{
			if (this.list.length % 3 != 2 || !this.isLack)
			{
				//不是 3 × n + 2 格式 或者 没有断一门
				return false;
			}
			
			var pairs:Vector.<Card> = this.pairs;
			
			if (pairs.length < 1)
			{
				//没有将牌
				return false;
			}
			
			//检查不同将的情况下是否胡牌
			for each (var jong:Card in pairs)
			{
				//获取除将牌外的其他牌列表
				var temp:Vector.<Card> = this.list.concat();
				temp.sort(compareCardByID);
				temp.splice(temp.indexOf(jong), 2);
				
				while (temp.length > 0)
				{
					var cards:CardList = new CardList(temp);
					var card:Card = temp[0];
					
					//去掉刻
					var sames:Vector.<Card> = cards.getCards(card.color, card.point);
					
					if (sames.length >= 3)
					{
						temp.splice(0, 3);
						continue;
					}
					
					//不是 万饼条，不考虑顺子牌型
					if (card.color == CardColor.WIND || card.color == CardColor.JIAN || card.color == CardColor.SEASON || card.color == CardColor.FLOWER)
					{
						break;
					}
					
					//大于7点，无法向上去掉顺
					if (card.point > 7)
					{
						break;
					}
					
					//去掉顺
					var mids:Vector.<Card> = cards.getCards(card.color, card.point + 1);
					var ends:Vector.<Card> = cards.getCards(card.color, card.point + 2);
					
					if (mids.length > 0 && ends.length > 0)
					{
						temp.splice(0, 1);
						temp.splice(temp.indexOf(mids[0]), 1);
						temp.splice(temp.indexOf(ends[0]), 1);
					}
					else
					{
						break;
					}
				}
				
				if (temp.length == 0)
				{
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * 是否同色连续
		 */
		public function get isColorSerial():Boolean
		{
			this.list.sort(compareCardByID);
			
			var color:int = CardColor.UNKNOW;
			
			for (var i:int = 0; i < this.list.length; i++)
			{
				var card:Card = this.list[i];
				
				if (color == CardColor.UNKNOW)
				{
					color = card.color;
				}
				
				if (card.color == color || card.point - this.list[0].point != i)
				{
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * 可听的牌
		 * @return
		 */
		public function get tings():Vector.<Card>
		{
			var result:Vector.<Card> = new Vector.<Card>();
			
			if (this.list.length % 3 == 1)
			{
				for (var c:int = CardColor.WAN; c <= CardColor.BING; c++)
				{
					//忽略断门
					if (this.getCards(c).length == 0)
					{
						continue;
					}
					
					for (var p:int = 1; p < 10; p++)
					{
						var card:Card = MahjongFactory.instance.create(c, p, 0);
						var cards:CardList = new CardList(this.list.concat());
						cards.add(card);
						
						if (cards.isWin)
						{
							result.push(card);
						}
					}
				}
			}
			
			return result;
		}
		
		/**
		 * 可用作将的对牌
		 * @return
		 */
		public function get pairs():Vector.<Card>
		{
			var result:Vector.<Card> = new Vector.<Card>();
			var cards:Vector.<Card> = this.list.concat();
			cards.sort(compareCardByID);
			
			while (cards.length > 1)
			{
				var c:Card = cards[0];
				var n:Card = cards[1];
				
				if (c.color == n.color && c.point == n.point)
				{
					result.push(c);
					cards.splice(0, 2);
				}
				else
				{
					cards.splice(0, 1);
				}
			}
			
			return result;
		}
		
		/**
		 * 花色，不同花色为未知
		 */
		public function get color():uint
		{
			var color:int = CardColor.UNKNOW;
			
			for each (var card:Card in this.list)
			{
				if (color == CardColor.UNKNOW)
				{
					color = card.color;
				}
				
				if (color != card.color)
				{
					return CardColor.UNKNOW;
				}
			}
			
			return color;
		}
		
		/**
		 * 列表
		 * @default
		 */
		public var list:Vector.<Card>;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function CardList(cards:Vector.<Card>=null)
		{
			this.list = (cards == null) ? new Vector.<Card>() : cards;
			this.list.sort(compareCardByID);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return this.list.toString();
		}
		
		/**
		 * 添加一张牌
		 * @param card
		 */
		public function add(card:Card):void
		{
			this.list.push(card);
			this.list.sort(compareCardByID);
		}
		
		/**
		 * 移除一张牌
		 * @param card
		 */
		public function remove(card:Card):void
		{
			if (this.list.indexOf(card) < 0)
			{
				return;
			}
			
			this.list.splice(this.list.indexOf(card), 1);
		}
		
		/**
		 * 获取一种牌
		 * @return
		 */
		public function getCards(color:int, point:int=0):Vector.<Card>
		{
			var result:Vector.<Card> = new Vector.<Card>();
			
			for each (var card:Card in this.list)
			{
				if (card.color == color && (card.point == point || point == 0))
				{
					result.push(card);
				}
			}
			
			return result;
		}
		
		/**
		 * 根据ID获取一张牌
		 * @param id
		 * @return
		 */
		public function getCardByID(id:int):Card
		{
			for each (var card:Card in this.list)
			{
				if (card.id == id)
				{
					return card;
				}
			}
			
			return null;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
