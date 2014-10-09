package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
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
			for (var i:int = 0; i < GameData.game.playerList.length; i++)
			{
				var player:GamePlayer = GameData.game.playerList.element(i);
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
				
				hand.init(player.handCards);
			}
			
			((this.context as State).manager.getState(GameState) as GameState).view.scene.wall.deal();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
