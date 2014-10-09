package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.events.TileEvent;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.Tile;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	import flash.utils.setTimeout;
	
	/**
	 * 选择换牌视图
	 * @author SiaoLeon
	 */
	public class SelectSwapView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var cards:Vector.<Card> = new Vector.<Card>();
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function SelectSwapView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			setTimeout(change, 7000);
			
			((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent.enable = true;
			((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent.addEventListener(TileEvent.CONFIRM, onSelect);
		}
		
		override public function onRemove():void
		{
			((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent.removeEventListener(TileEvent.CONFIRM, onSelect);
			((this.context as State).manager.getState(GameState) as GameState).view.scene.handCurrent.enable = false;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onSelect(event:TileEvent):void
		{
			var tile:Tile = event.tile;
			var index:int = this.cards.indexOf(tile.card);
			
			if (index < 0)
			{
				this.cards.push(tile.card);
			}
			else
			{
				this.cards.splice(index, 1);
			}
			
			if (this.cards.length >= 3)
			{
				this.notify(GameMethod.CONFIRM_SWAP, this.cards);
			}
		}
		
		private function change():void
		{
			var player:GamePlayer = GameData.game.playerList.element((this.module as BloodRiver).info.data.user.seat);
			var swap:Vector.<Card> = player.swap;
			
			this.notify(GameMethod.CONFIRM_SWAP, swap);
		}
	
	}
}
