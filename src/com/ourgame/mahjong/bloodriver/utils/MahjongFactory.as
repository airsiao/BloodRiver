package com.ourgame.mahjong.bloodriver.utils
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.wecoit.errors.SingletonError;
	
	/**
	 * 麻将工厂
	 * @author SiaoLeon
	 */
	public class MahjongFactory
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static var _instance:MahjongFactory;
		
		/**
		 * 获取单例对象
		 */
		public static function get instance():MahjongFactory
		{
			if (_instance == null)
			{
				_instance = new MahjongFactory();
			}
			return _instance;
		}
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数，单例模式
		 */
		public function MahjongFactory()
		{
			if (_instance != null)
			{
				throw new SingletonError(this);
			}
			_instance = this;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		/**
		 * 生成一副麻将牌
		 */
		public function createMahjong():Vector.<Card>
		{
			var mahjong:Vector.<Card> = new Vector.<Card>();
			
			//生成万条饼
			for (var c:int = CardColor.WAN; c <= CardColor.BING; c++)
			{
				for (var p:int = 1; p < 10; p++)
				{
					for (var i:int = 0; i < 4; i++)
					{
						mahjong.push(this.createCard(c, p, i));
					}
				}
			}
			
			return mahjong;
		}
		
		/**
		 * 生成一张麻将牌
		 * @param color
		 * @param point
		 * @param index
		 * @param isMagic
		 * @return
		 */
		public function createCard(color:int, point:int, index:int=0, isMagic:Boolean=false):Card
		{
			var id:int = 0;
			id |= index;
			id |= point << 2;
			id |= color << 6;
			
			if (isMagic)
			{
				id |= 0x400;
			}
			
			return new Card(id);
		}
		
		/**
		 * 随机生成一副手牌
		 * @param count 张数
		 * @return
		 */
		public function randomCards(count:uint):Vector.<Card>
		{
			var mahjong:Vector.<Card> = this.createMahjong();
			var cards:Vector.<Card> = new Vector.<Card>();
			
			for (var i:int = 0; i < count; i++)
			{
				var index:uint = Math.floor(Math.random() * mahjong.length);
				
				cards.push(mahjong[index]);
				
				mahjong.splice(index, 1);
			}
			
			cards.sort(compareCardByID);
			
			return cards;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
