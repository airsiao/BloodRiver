package com.ourgame.mahjong.bloodriver
{
	import com.ourgame.mahjong.bloodriver.state.MainState;
	import com.ourgame.mahjong.libaray.vo.GameInfo;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.data.HashMap;
	import com.wecoit.mvc.Application;
	import com.wecoit.mvc.core.IState;
	
	[SWF(width="960", height="600", backgroundColor="#000000", frameRate="25")]
	
	/**
	 * 血流成河程序
	 * @author SiaoLeon
	 */
	public class BloodRiver extends Application
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 信息
		 */
		private var _info:GameInfo;
		
		public function get info():GameInfo
		{
			return this._info;
		}
		
		public function set info(value:GameInfo):void
		{
			this._info = value;
			
			var assets:HashMap = this.info.assets;
			
			for each (var key:* in assets.keys)
			{
				AssetsManager.instance.saveAsset(key, assets.getValue(key));
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function BloodRiver(root:IState=null)
		{
			super(new MainState());
		
			//			//胡牌测试
			//			
			//			var time:Number = getTimer();
			//			
			//			var cards:CardList = new CardList();
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 1, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 1, 1));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 1, 2));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 2, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 3, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 4, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 5, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 6, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 7, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 8, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 9, 0));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 9, 1));
			//			cards.add(MahjongFactory.instance.createCard(CardColor.WAN, 9, 2));
			//			
			//			var hands:HandCards = new HandCards();
			//			hands.cards = cards;
			//			trace("手牌：", hands);
			//			
			//			trace("听牌：", hands.cards.tings);
			//			
			//			var draw:Card = MahjongFactory.instance.createCard(CardColor.WAN, 9, 3);
			//			trace("抓牌：", draw);
			//			hands.cards.add(draw);
			//			
			//			trace(hands.cards.isWin);
			//			
			//			trace(hands.fanTypes);
			//			
			//			trace("耗时：", getTimer() - time);
		
			//			//换牌测试
			//			var mahjong:Mahjong = new Mahjong();
			//			var player:Player = new Player();
			//			
			//			for (var i:int = 0; i < 14; i++)
			//			{
			//				player.handCards.cards.add(mahjong.deal());
			//			}
			//			
			//			trace("玩家手牌", player.handCards);
			//			trace("玩家换牌", player.swap);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
