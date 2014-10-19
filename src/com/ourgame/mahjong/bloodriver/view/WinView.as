package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.ui.TilesWin;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.Win;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 胡牌视图
	 * @author SiaoLeon
	 */
	public class WinView extends View
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
		public function WinView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function play(notice:INotice):void
		{
			var action:Action = notice.params;
			var info:Win = action.params;
			var pool:TilesPool = null;
			var hand:TilesHand = null;
			
			switch ((this.module as BloodRiver).info.data.table.getSeatPosition(action.seat))
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
			
			pool.removeCard(action.card, true);
			hand.removeCard(action.card, true);
			
			for (var i:int = 0; i < info.fan.length; i++)
			{
				if (info.fan[i] <= 0)
				{
					continue;
				}
				
				var win:TilesWin = null;
				
				switch ((this.module as BloodRiver).info.data.table.getSeatPosition(i))
				{
					case Position.CURRENT:
						win = (this.context as GameState).tiles.winCurrent;
						break;
					case Position.NEXT:
						win = (this.context as GameState).tiles.winNext;
						break;
					case Position.OPPOSITE:
						win = (this.context as GameState).tiles.winOpposite;
						break;
					case Position.PREV:
						win = (this.context as GameState).tiles.winPrev;
						break;
				}
				
				win.add(new Card(action.card.id));
			}
			
			notice.complete();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
