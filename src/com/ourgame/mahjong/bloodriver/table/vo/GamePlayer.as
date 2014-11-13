package com.ourgame.mahjong.bloodriver.table.vo
{
	import com.ourgame.mahjong.bloodriver.common.vo.UserInfo;
	import com.ourgame.mahjong.bloodriver.table.enum.CardColor;
	import com.wecoit.data.ValueObject;
	
	/**
	 * 玩家对象
	 * @author SiaoLeon
	 */
	public class GamePlayer extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public function get user():UserInfo
		{
			return this.getProperty("user", null);
		}
		
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
			
			for (var i:int = array.length; i > 0; i--)
			{
				var list:CardList = array[i - 1];
				
				if (list.length < 3)
				{
					array.splice(i - 1, 1);
				}
			}
			
			if (array.length > 0)
			{
				var cards:Vector.<Card> = (array[0] as CardList).list.concat();
				
				while (result.length < 3)
				{
					var index:uint = Math.floor(Math.random() * cards.length);
					result = result.concat(cards.splice(index, 1));
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
		
		/**
		 * 牌池
		 * @return
		 */
		public function get poolCards():CardList
		{
			return this.getProperty("poolCards", new CardList());
		}
		
		public function set poolCards(value:CardList):void
		{
			this.setProperty("poolCards", value);
		}
		
		/**
		 * 胡过的牌
		 * @return
		 */
		public function get winCards():CardList
		{
			return this.getProperty("winCards", new CardList());
		}
		
		public function set winCards(value:CardList):void
		{
			this.setProperty("winCards", value);
		}
		
		/**
		 * 结算
		 * @return
		 */
		public function get result():ResultInfo
		{
			return this.getProperty("result", new ResultInfo());
		}
		
		public function set result(value:ResultInfo):void
		{
			this.setProperty("result", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GamePlayer(user:UserInfo)
		{
			super();
			
			this.setProperty("user", user);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
