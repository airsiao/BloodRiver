package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.ActionType;
	import com.ourgame.mahjong.bloodriver.table.enum.CardGroupType;
	import com.ourgame.mahjong.bloodriver.table.events.TileEvent;
	import com.ourgame.mahjong.bloodriver.table.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.table.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.ourgame.mahjong.bloodriver.table.ui.ActionButton;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.utils.compareActionByType;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.table.vo.TingInfo;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * 动作视图
	 * @author SiaoLeon
	 */
	public class RequestView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var request:Action;
		
		private var buttons:Vector.<ActionButton>;
		
		private var container:Sprite;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function RequestView()
		{
			super();
			
			this.buttons = new Vector.<ActionButton>();
			this.container = new Sprite();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function show(notice:INotice):void
		{
			this.request = notice.params;
			
			if ((this.request.type & ActionType.WIN) == ActionType.WIN)
			{
				var hu:ActionButton = new ActionButton("胡", ActionType.WIN, this.request.card);
				this.buttons.push(hu);
			}
			
			if ((this.request.type & ActionType.GANG) == ActionType.GANG)
			{
				//别人打出牌后的明杠
				var ming:ActionButton = new ActionButton("杠" + this.request.card, ActionType.GANG, this.request.card);
				this.buttons.push(ming);
			}
			
			if ((this.request.type & ActionType.GANG_AN) == ActionType.GANG_AN || (this.request.type & ActionType.GANG_BU) == ActionType.GANG_BU)
			{
				//自己抓牌后的暗杠或补杠
				var gangs:Vector.<CardGroup> = GameData.currentPlayer.handCards.gangs;
				
				for each (var gang:CardGroup in gangs)
				{
					var type:uint = (gang.type == CardGroupType.GANG_AN) ? ActionType.GANG_AN : ActionType.GANG_BU;
					var card:Card = GameData.currentPlayer.handCards.cards.getCards(gang.cards[0].color, gang.cards[0].point)[0];
					var anbu:ActionButton = new ActionButton("杠" + gang.cards[0], type, card);
					this.buttons.push(anbu);
				}
			}
			
			if ((this.request.type & ActionType.PENG) == ActionType.PENG)
			{
				var peng:ActionButton = new ActionButton("碰", ActionType.PENG, this.request.card);
				this.buttons.push(peng);
			}
			
			if (this.request.type > 1 && (this.request.type & ActionType.GIVEUP) == ActionType.GIVEUP)
			{
				var giveup:ActionButton = new ActionButton("弃", ActionType.GIVEUP, this.request.card);
				this.buttons.push(giveup);
			}
			
			if ((this.request.type & ActionType.DISCARD) == ActionType.DISCARD)
			{
				Log.debug("可听", GameData.currentPlayer.handCards.tings);
				
				for each (var ting:TingInfo in GameData.currentPlayer.handCards.tings)
				{
					var hands:Vector.<Card> = GameData.currentPlayer.handCards.cards.getCards(ting.drop.color, ting.drop.point);
					
					for each (var drop:Card in hands)
					{
						(this.context as GameState).tiles.handCurrent.getTileByCard(drop).tingInfo = ting;
					}
				}
				
				(this.context as GameState).tiles.handCurrent.addEventListener(TileEvent.SELECT, onSelect, false, 0, true);
				(this.context as GameState).tiles.handCurrent.addEventListener(TileEvent.CONFIRM, onConfirm, false, 0, true);
				(this.context as GameState).tiles.handCurrent.enable = ((this.context as GameState).tiles.winCurrent.numChildren == 0);
			}
			
			if (this.request.type > 1)
			{
				this.layout();
				TableLayer.instance.foreground.addChild(this.container);
			}
			
			notice.complete();
		}
		
		public function hide():void
		{
			(this.context as GameState).tiles.handCurrent.removeEventListener(TileEvent.SELECT, onSelect);
			(this.context as GameState).tiles.handCurrent.removeEventListener(TileEvent.CONFIRM, onConfirm);
			(this.context as GameState).tiles.handCurrent.enable = false;
			
			while (this.buttons.length > 0)
			{
				var button:ActionButton = this.buttons.shift();
				button.remove();
				button.removeEventListener(MouseEvent.CLICK, onAction);
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function layout():void
		{
			while (this.container.numChildren > 0)
			{
				this.container.removeChildAt(0);
			}
			
			this.buttons.sort(compareActionByType);
			
			for (var i:int = 0; i < this.buttons.length; i++)
			{
				var button:ActionButton = this.buttons[i];
				button.x = (i + 1) * -100;
				button.addEventListener(MouseEvent.CLICK, onAction, false, 0, true);
				this.container.addChild(button);
			}
			
			this.container.x = 750;
			this.container.y = 440;
		}
		
		private function onSelect(event:TileEvent):void
		{
			this.notify(OperateMethod.SHOWTING, (event.tile == null) ? null : event.tile.tingInfo);
		}
		
		private function onConfirm(event:TileEvent):void
		{
			this.hide();
			
			this.notify(OperateMethod.SHOWTING, null);
			this.notify(OperateMethod.DISCARD, event.tile.card);
		}
		
		private function onAction(event:MouseEvent):void
		{
			var button:ActionButton = event.target as ActionButton;
			
			var params:Array = new Array();
			
			if (button.type == ActionType.PENG || button.type == ActionType.GANG)
			{
				var cards:Vector.<Card> = GameData.currentPlayer.handCards.cards.getCards(button.card.color, button.card.point);
				var count:uint = (button.type == ActionType.PENG) ? 2 : cards.length;
				
				for (var i:int = 0; i < count; i++)
				{
					var c:Card = cards[i];
					
					if (c.id != button.card.id)
					{
						params.push(c.id);
					}
				}
			}
			
			if (button.type == ActionType.GANG_BU || button.type == ActionType.GANG_AN)
			{
				for each (var group:CardGroup in GameData.currentPlayer.handCards.gangs)
				{
					if (group.color == button.card.color && group.point == button.card.point)
					{
						for each (var card:Card in group.cards)
						{
							if (card.id != button.card.id)
							{
								params.push(card.id);
							}
						}
					}
				}
			}
			
			this.hide();
			
			var action:Action = new Action(button.type, this.request.seat, button.card, 0, params);
			this.notify(OperateMethod.ACTION, action);
			
			if (action.type == ActionType.GIVEUP && (this.request.type & ActionType.DISCARD) == ActionType.DISCARD)
			{
				var discard:Action = new Action(ActionType.DISCARD, this.request.seat, this.request.card);
				this.notify(GameMethod.REQUEST, discard);
			}
		}
	
	}
}
