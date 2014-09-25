package com.ourgame.mahjong.bloodriver.vo
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.wecoit.data.ValueObject;
	
	/**
	 * 玩家对象
	 * @author SiaoLeon
	 */
	public class Player extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 换牌
		 * @return
		 */
		public function get swap():Vector.<Card>
		{
			var result:Vector.<Card> = new Vector.<Card>();
			
			var wan:CardList = new CardList(this.handCards.cards.getCards(CardColor.WAN));
			var bing:CardList = new CardList(this.handCards.cards.getCards(CardColor.BING));
			var tiao:CardList = new CardList(this.handCards.cards.getCards(CardColor.TIAO));
			
			var array:Array = new Array(wan, bing, tiao);
			array.sortOn("length");
			
			for each (var list:CardList in array)
			{
				if (list.length < 3)
				{
					array.splice(array.indexOf(list), 1);
				}
			}
			
			if (array.length > 0)
			{
				var cards:Vector.<Card> = (array[0] as CardList).list.concat();
				
				while (result.length < 3)
				{
					var index:uint = Math.floor(Math.random() * cards.length);
					var card:Card = cards[index];
					result.push(card);
				}
			}
			
			return result;
		}
		
		/**
		 * 手牌
		 * @return
		 */
		public function get handCards():HandCards
		{
			return this.getProperty("handCards", new HandCards());
		}
		
		public function set handCards(value:HandCards):void
		{
			this.setProperty("handCards", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Player()
		{
			super();
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
