package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.WinType;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.ActionEffect;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.ui.TilesWin;
	import com.ourgame.mahjong.bloodriver.ui.WinFan;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
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
			
			pool.removeCard(action.card);
			hand.removeCard(action.card, true);
			
			for (var i:int = 0; i < info.fan.length; i++)
			{
				var position:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(i);
				
				if (info.fan[i] != 0)
				{
					LayerManager.instance.tile.addChild(new WinFan(position, info.fan[i]));
				}
				
				if (info.fan[i] > 0)
				{
					LayerManager.instance.foreground.addChild(new ActionEffect(position, (info.type == WinType.SELF) ? ActionEffect.ZIMO : ActionEffect.HU));
				}
				
				if (info.fan[i] <= 0)
				{
					var list:Vector.<CardGroup> = (GameData.currentGame.playerList.element(i) as GamePlayer).handCards.groups.list;
					
					switch (position)
					{
						case Position.CURRENT:
							(this.context as GameState).tiles.handCurrent.initGroups(list);
							break;
						case Position.NEXT:
							(this.context as GameState).tiles.handNext.initGroups(list);
							break;
						case Position.OPPOSITE:
							(this.context as GameState).tiles.handOpposite.initGroups(list);
							break;
						case Position.PREV:
							(this.context as GameState).tiles.handPrev.initGroups(list);
							break;
					}
					
					continue;
				}
				
				var win:TilesWin = null;
				
				switch (position)
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
