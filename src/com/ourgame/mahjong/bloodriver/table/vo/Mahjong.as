package com.ourgame.mahjong.bloodriver.table.vo
{
	import com.ourgame.mahjong.bloodriver.table.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.table.utils.MahjongFactory;
	
	/**
	 * 一副麻将牌
	 * @author SiaoLeon
	 */
	public class Mahjong
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 牌列表
		 * @default
		 */
		public var cards:Vector.<Card>;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Mahjong()
		{
			this.cards = new Vector.<Card>();
			this.shuffle();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		/**
		 * 洗牌，重新创建一副完整的麻将牌
		 */
		public function shuffle():void
		{
			this.cards.splice(0, this.cards.length);
			
			for (var c:int = CardColor.WAN; c <= CardColor.BING; c++)
			{
				for (var p:int = 1; p < 10; p++)
				{
					for (var i:int = 0; i < 4; i++)
					{
						this.cards.push(MahjongFactory.instance.create(c, p, i));
					}
				}
			}
		}
		
		/**
		 * 随机抓一张牌，并将该张牌从整幅麻将牌中删除
		 * @return
		 */
		public function deal():Card
		{
			var index:int = Math.floor(Math.random() * this.cards.length);
			var card:Card = this.cards[index];
			this.cards.splice(index, 1);
			
			return card;
		}
		
		/**
		 * 添加一张牌
		 * @param card
		 */
		public function add(card:Card):void
		{
			if (card == null)
			{
				return;
			}
			
			for each (var info:Card in this.cards)
			{
				if (info == card || info.id == card.id)
				{
					return;
				}
			}
			
			this.cards.push(card);
		}
		
		/**
		 * 移除一张牌
		 * @param card
		 */
		public function remove(card:Card):void
		{
			if (card == null)
			{
				return;
			}
			
			for each (var info:Card in this.cards)
			{
				if (info == card || info.id == card.id)
				{
					this.cards.splice(this.cards.indexOf(info), 1);
					break;
				}
			}
		}
		
		/**
		 * 获取一种牌
		 * @param color
		 * @param point
		 * @return
		 */
		public function getCards(color:uint, point:uint):Vector.<Card>
		{
			var result:Vector.<Card> = new Vector.<Card>();
			
			for each (var info:Card in this.cards)
			{
				if (info.color == color && info.point == point)
				{
					result.push(info);
				}
			}
			
			return result;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
