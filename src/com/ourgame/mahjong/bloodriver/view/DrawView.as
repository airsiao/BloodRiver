package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	/**
	 * 抓牌视图
	 * @author SiaoLeon
	 */
	public class DrawView extends View
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
		public function DrawView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function draw(action:Action):void
		{
			((this.context as State).manager.getState(GameState) as GameState).view.scene.wall.draw(action.reverse);
			
			var player:GamePlayer = GameData.game.playerList.element(action.seat);
			var hand:TilesHand = null;
			
			switch ((this.module as BloodRiver).info.data.table.getSeatPosition(player.user.seat))
			{
				case Position.CURRENT:
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent;
					break;
				case Position.NEXT:
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handNext;
					break;
				case Position.OPPOSITE:
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handOpposite;
					break;
				case Position.PREV:
					hand = ((this.context as State).manager.getState(GameState) as GameState).view.scene.handPrev;
					break;
			}
			
			hand.initCards(player.handCards.cards.list);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
