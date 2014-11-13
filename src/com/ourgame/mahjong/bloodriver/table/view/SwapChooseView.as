package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.events.TileEvent;
	import com.ourgame.mahjong.bloodriver.table.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.Tile;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	/**
	 * 换牌选择视图
	 * @author SiaoLeon
	 */
	public class SwapChooseView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var tip:Bitmap;
		
		private var btnPrompt:ButtonClip;
		
		private var btnConfirm:ButtonClip;
		
		private var cards:Vector.<Card>
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function SwapChooseView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.cards = new Vector.<Card>();
			
			this.tip = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.SwapTip);
			this.tip.x = 280;
			this.tip.y = 415;
			TableLayer.instance.foreground.addChild(this.tip);
			
			this.btnPrompt = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonPrompt));
			this.btnPrompt.x = 680;
			this.btnPrompt.y = 420;
			TableLayer.instance.foreground.addChild(this.btnPrompt);
			
			this.btnConfirm = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonConfirm));
			this.btnConfirm.enabled = false;
			this.btnConfirm.x = 800;
			this.btnConfirm.y = 420;
			TableLayer.instance.foreground.addChild(this.btnConfirm);
			
			((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.enable = true;
			((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.addEventListener(TileEvent.CONFIRM, onSelect);
			
			this.btnPrompt.addEventListener(MouseEvent.CLICK, onPrompt);
			this.btnConfirm.addEventListener(MouseEvent.CLICK, onConfirm);
		}
		
		override public function onRemove():void
		{
			this.btnPrompt.removeEventListener(MouseEvent.CLICK, onPrompt);
			this.btnConfirm.removeEventListener(MouseEvent.CLICK, onConfirm);
			
			((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.removeEventListener(TileEvent.CONFIRM, onSelect);
			((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.enable = false;
			
			this.cards = null;
			
			TableLayer.instance.foreground.removeChild(this.btnConfirm);
			this.btnConfirm = null;
			
			TableLayer.instance.foreground.removeChild(this.btnPrompt);
			this.btnPrompt = null;
			
			TableLayer.instance.foreground.removeChild(this.tip);
			this.tip = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onSelect(event:TileEvent):void
		{
			var tile:Tile = event.tile;
			var index:int = this.cards.indexOf(tile.card);
			
			if (this.cards.length >= 3 && index < 0)
			{
				return;
			}
			
			if (tile.confirm || this.cards.length < 3)
			{
				tile.confirm = !tile.confirm;
			}
			
			if (index < 0)
			{
				this.cards.push(tile.card);
			}
			else
			{
				this.cards.splice(index, 1);
			}
			
			this.btnConfirm.enabled = (this.cards.length >= 3);
		}
		
		private function onPrompt(event:MouseEvent):void
		{
			((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.resetTiles();
			
			this.cards.splice(0, this.cards.length);
			this.cards = GameData.currentPlayer.swap.concat();
			
			for each (var card:Card in this.cards)
			{
				((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.getTileByCard(card).select = true;
				((this.context as State).manager.getState(GameState) as GameState).tiles.handCurrent.getTileByCard(card).confirm = true;
			}
			
			this.btnConfirm.enabled = true;
		}
		
		private function onConfirm(event:MouseEvent):void
		{
			this.notify(OperateMethod.SWAP, this.cards);
		}
	
	}
}
