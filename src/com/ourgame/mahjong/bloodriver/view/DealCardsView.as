package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.libaray.data.CommonData;
	import com.wecoit.display.Align;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	/**
	 * 发牌视图
	 * @author SiaoLeon
	 */
	public class DealCardsView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
		private var timer:Timer;
		
		private var timeout:uint;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function DealCardsView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.timer = new Timer(200, 16);
			this.timer.addEventListener(TimerEvent.TIMER, onTimer);
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		override public function onRemove():void
		{
			this.timer.stop();
			this.timer.removeEventListener(TimerEvent.TIMER, onTimer);
			this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			this.timer = null;
			
			clearTimeout(this.timeout);
		}
		
		public function play(notice:INotice):void
		{
			this.notice = notice;
			this.timer.start();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onTimer(event:TimerEvent):void
		{
			var seat:uint = (GameData.currentGame.dealer + this.timer.currentCount - 1) % 4;
			var player:GamePlayer = GameData.currentGame.playerList.element(seat);
			var hand:TilesHand = null;
			
			switch (CommonData.table.getSeatPosition(player.user.seat))
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
			
			var index:uint = (this.timer.currentCount - 1) / 4;
			
			if (this.timer.currentCount > 12)
			{
				(this.context as GameState).tiles.wall.draw();
				hand.addCard(player.handCards.cards.list[12], Align.LEFT);
			}
			else
			{
				(this.context as GameState).tiles.wall.deal();
				hand.addCard(player.handCards.cards.list[index * 4], Align.LEFT);
				hand.addCard(player.handCards.cards.list[index * 4 + 1], Align.LEFT);
				hand.addCard(player.handCards.cards.list[index * 4 + 2], Align.LEFT);
				hand.addCard(player.handCards.cards.list[index * 4 + 3], Align.LEFT);
			}
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			(this.context as GameState).tiles.handCurrent.status = CardStatus.HIDE;
			this.timeout = setTimeout(this.sort, 400);
		}
		
		private function sort():void
		{
			(this.context as GameState).tiles.handCurrent.sort();
			(this.context as GameState).tiles.handCurrent.status = CardStatus.STAND;
			
			this.notice.complete();
			
			this.notify(GameMethod.SELECT_SWAP);
		}
	
	}
}
