package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.ActionType;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.ourgame.mahjong.bloodriver.table.ui.ActionEffect;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.GamePlayer;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.events.Event;
	
	/**
	 * 动作视图
	 * @author SiaoLeon
	 */
	public class ActionView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ActionView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function play(notice:INotice):void
		{
			this.notice = notice;
			
			var action:Action = notice.params;
			var position:uint = CommonData.table.getSeatPosition(action.seat);
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
			
			(this.context as GameState).tiles.poolCurrent.removeCard(action.card);
			(this.context as GameState).tiles.poolNext.removeCard(action.card);
			(this.context as GameState).tiles.poolOpposite.removeCard(action.card);
			(this.context as GameState).tiles.poolPrev.removeCard(action.card);
			
			if ((this.context as GameState).tiles.current == null || (this.context as GameState).tiles.current == action.card || (this.context as GameState).tiles.current.id == action.card.id)
			{
				(this.context as GameState).tiles.current = null;
			}
			
			var cards:Vector.<Card> = action.params;
			
			if (action.type == ActionType.GANG_BU)
			{
				cards = new Vector.<Card>();
				cards.push(action.card);
			}
			
			for each (var card:Card in cards)
			{
				hand.removeCard(card);
			}
			
			hand.layout();
			
			var player:GamePlayer = GameData.currentGame.playerList.element(action.seat);
			hand.initGroups(player.handCards.groups.list);
			
			var effect:ActionEffect = null;
			
			switch (action.type)
			{
				case ActionType.GANG:
				case ActionType.GANG_AN:
				case ActionType.GANG_BU:
					effect = new ActionEffect(position, ActionEffect.GANG);
					break;
				case ActionType.PENG:
					effect = new ActionEffect(position, ActionEffect.PENG);
					break;
			}
			
			effect.addEventListener(Event.COMPLETE, onEffectComplete);
			TableLayer.instance.foreground.addChild(effect);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onEffectComplete(event:Event):void
		{
			this.notice.complete();
		}
	
	}
}
