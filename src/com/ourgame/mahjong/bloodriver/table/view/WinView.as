package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.WinType;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.ourgame.mahjong.bloodriver.table.ui.ActionEffect;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.table.ui.WinFan;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.Win;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.setTimeout;
	
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
		
		private var notice:INotice;
		
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
			this.notice = notice;
			
			var action:Action = this.notice.params;
			var win:Win = action.params;
			
			for (var i:int = 0; i < win.fan.length; i++)
			{
				var position:uint = CommonData.table.getSeatPosition(i);
				
				if (win.fan[i] > 0)
				{
					TableLayer.instance.foreground.addChild(new ActionEffect(position, (win.type == WinType.SELF) ? ActionEffect.ZIMO : ActionEffect.HU));
				}
			}
			
			setTimeout(this.showFan, (win.type == WinType.SELF) ? 2200 : 2200);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function showFan():void
		{
			var action:Action = this.notice.params;
			var win:Win = action.params;
			
			var pool:TilesPool = null;
			var hand:TilesHand = null;
			
			switch (CommonData.table.getSeatPosition(action.seat))
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
			
			if ((this.context as GameState).tiles.current != null && (this.context as GameState).tiles.current.id == action.card.id)
			{
				(this.context as GameState).tiles.current = null;
			}
			
			(this.context as GameState).tiles.poolCurrent.removeCard(action.card);
			(this.context as GameState).tiles.poolNext.removeCard(action.card);
			(this.context as GameState).tiles.poolOpposite.removeCard(action.card);
			(this.context as GameState).tiles.poolPrev.removeCard(action.card);
			
			hand.removeCard(action.card);
			hand.resetTiles();
			hand.sort();
			
			for (var i:int = 0; i < win.fan.length; i++)
			{
				var position:uint = CommonData.table.getSeatPosition(i);
				
				if (win.fan[i] > 0)
				{
					switch (position)
					{
						case Position.CURRENT:
							(this.context as GameState).tiles.winCurrent.add(new Card(action.card.id));
							break;
						case Position.NEXT:
							(this.context as GameState).tiles.winNext.add(new Card(action.card.id));
							break;
						case Position.OPPOSITE:
							(this.context as GameState).tiles.winOpposite.add(new Card(action.card.id));
							break;
						case Position.PREV:
							(this.context as GameState).tiles.winPrev.add(new Card(action.card.id));
							break;
					}
				}
				
				if (win.fan[i] != 0)
				{
					TableLayer.instance.tile.addChild(new WinFan(position, win.fan[i]));
				}
			}
			
			setTimeout(this.notice.complete, 1000);
		}
	
	}
}
