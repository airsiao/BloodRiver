package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	/**
	 * 打牌视图
	 * @author SiaoLeon
	 */
	public class DiscardView extends View
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
		public function DiscardView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function discard(action:Action):void
		{
			var player:GamePlayer = GameData.game.playerList.element(action.seat);
			var pool:TilesPool = null;
			var hand:TilesHand = null;
			
			switch ((this.module as BloodRiver).info.data.table.getSeatPosition(player.user.seat))
			{
				case Position.CURRENT:
					pool = ((this.context as State).manager.getState(GameState) as GameState).view.scene.poolCurrent;
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent;
					break;
				case Position.NEXT:
					pool = ((this.context as State).manager.getState(GameState) as GameState).view.scene.poolNext;
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handNext;
					break;
				case Position.OPPOSITE:
					pool = ((this.context as State).manager.getState(GameState) as GameState).view.scene.poolOpposite;
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handOpposite;
					break;
				case Position.PREV:
					pool = ((this.context as State).manager.getState(GameState) as GameState).view.scene.poolPrev;
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handPrev;
					break;
			}
			
			pool.add(action.card);
			hand.initCards(player.handCards.cards.list);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
