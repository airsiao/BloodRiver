package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.wecoit.display.Align;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.setTimeout;
	
	/**
	 * 换牌视图
	 * @author SiaoLeon
	 */
	public class SwapCardsView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function SwapCardsView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function outCards(notice:INotice):void
		{
			var seat:uint = notice.params[0];
			var cards:Vector.<Card> = notice.params[1];
			var position:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(seat);
			var hand:TilesHand = null;
			
			switch (position)
			{
				case Position.CURRENT:
					hand = (this.context as GameState).tiles.handCurrent;
					break;
				case Position.NEXT:
					hand = (this.context as GameState).tiles.handNext;
					break;
				case Position.OPPOSITE:
					hand = (this.context as GameState).tiles.handOpposite;
					break;
				case Position.PREV:
					hand = (this.context as GameState).tiles.handPrev;
					break;
			}
			
			for each (var card:Card in cards)
			{
				hand.removeCard(card);
			}
			
			hand.resetTiles();
			hand.layout(Align.LEFT);
			
			notice.complete();
		}
		
		public function inCards(notice:INotice):void
		{
			var hand:TilesHand;
			
			for (var i:int = 0; i < GameData.currentGame.playerList.length; i++)
			{
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				
				var position:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(i);
				
				switch (position)
				{
					case Position.CURRENT:
						hand = (this.context as GameState).tiles.handCurrent;
						break;
					case Position.NEXT:
						hand = (this.context as GameState).tiles.handNext;
						break;
					case Position.OPPOSITE:
						hand = (this.context as GameState).tiles.handOpposite;
						break;
					case Position.PREV:
						hand = (this.context as GameState).tiles.handPrev;
						break;
				}
				
				hand.initCards(player.handCards.cards.list);
			}
			
			setTimeout(this.sort, 3000, notice);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function sort(notice:INotice):void
		{
			(this.context as GameState).tiles.handCurrent.sort();
			
			notice.complete();
		}
	
	}
}
