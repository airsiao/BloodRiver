package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.DiscardBoard;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
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
		
		public function play(notice:INotice):void
		{
			var action:Action = notice.params;
			var pool:TilesPool = null;
			var hand:TilesHand = null;
			var position:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(action.seat);
			
			switch (position)
			{
				case Position.CURRENT:
					pool = (this.context as GameState).tiles.poolCurrent;
					hand = (this.context as GameState).tiles.handCurrent;
					break;
				case Position.NEXT:
					pool = (this.context as GameState).tiles.poolNext;
					hand = (this.context as GameState).tiles.handNext;
					break;
				case Position.OPPOSITE:
					pool = (this.context as GameState).tiles.poolOpposite;
					hand = (this.context as GameState).tiles.handOpposite;
					break;
				case Position.PREV:
					pool = (this.context as GameState).tiles.poolPrev;
					hand = (this.context as GameState).tiles.handPrev;
					break;
			}
			
			pool.addCard(action.card);
			hand.removeCard(action.card);
			hand.sort();
			hand.resetTiles();
			
			(this.context as GameState).tiles.current = action.card;
			
			LayerManager.instance.tile.addChild(new DiscardBoard(position, action.card));
			
			notice.complete();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
