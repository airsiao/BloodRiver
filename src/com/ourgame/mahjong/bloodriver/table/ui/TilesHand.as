package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.table.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.events.TileEvent;
	import com.ourgame.mahjong.bloodriver.table.utils.compareTileByID;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.table.vo.HandCards;
	import com.wecoit.display.Align;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[Event(name="select", type="com.ourgame.mahjong.bloodriver.events.TileEvent")]
	
	[Event(name="confirm", type="com.ourgame.mahjong.bloodriver.events.TileEvent")]
	
	/**
	 * 手牌
	 * @author SiaoLeon
	 */
	public class TilesHand extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _position:uint;
		
		public function get position():uint
		{
			return this._position;
		}
		
		private var _status:String;
		
		public function get status():String
		{
			return this._status;
		}
		
		public function set status(value:String):void
		{
			this._status = value;
			
			this.layout();
		}
		
		private var _enable:Boolean;
		
		public function get enable():Boolean
		{
			return this._enable;
		}
		
		public function set enable(value:Boolean):void
		{
			this._enable = value;
			
			if (!value)
			{
				this._selected = null;
			}
			
			this.update();
		}
		
		private var _selected:Tile;
		
		public function get selected():Tile
		{
			return this._selected;
		}
		
		public function set selected(value:Tile):void
		{
			this._selected = value;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var groups:Vector.<TilesGroup>;
		
		private var cards:Vector.<Tile>;
		
		private var cardPositions:Vector.<Point>;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesHand(position:uint)
		{
			super();
			
			this._position = position;
			this._status = CardStatus.STAND;
			
			this.groups = new Vector.<TilesGroup>();
			this.cards = new Vector.<Tile>();
			
			switch (position)
			{
				case Position.CURRENT:
					this.x = 136;
					this.y = 485;
					break;
				case Position.OPPOSITE:
					this.x = 650;
					this.y = 12;
					break;
				case Position.PREV:
					this.x = 154;
					this.y = 103;
					break;
				case Position.NEXT:
					this.x = 785;
					this.y = 425;
					break;
			}
			
			this.initPositions();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		/**
		 * 初始化
		 * @param hands
		 */
		public function init(hands:HandCards):void
		{
			this.initGroups(hands.groups.list);
			this.initCards(hands.cards.list);
		}
		
		/**
		 * 初始化牌组
		 * @param list
		 */
		public function initGroups(list:Vector.<CardGroup>):void
		{
			while (this.groups.length > 0)
			{
				var remove:TilesGroup = this.groups.pop();
				
				if (this.contains(remove))
				{
					this.removeChild(remove);
				}
			}
			
			for (var i:int = 0; i < list.length; i++)
			{
				var group:CardGroup = list[i];
				var tile:TilesGroup = new TilesGroup(this.position, group);
				var offset:Number = 0;
				
				switch (position)
				{
					case Position.CURRENT:
						offset = 3 * list.length;
						tile.x = (168 + 3) * i - offset;
						tile.y = 3.75;
						break;
					case Position.OPPOSITE:
						offset = 3 * list.length;
						tile.x = (i == 0) ? -90.3 + offset : ((90.3 + 3) * i + 90.3) * -1 + offset;
						tile.y = 3.2;
						break;
					case Position.PREV:
						offset = 5 * list.length;
						tile.x = -14.15;
						tile.y = (66 + 5) * i - offset;
						break;
					case Position.NEXT:
						offset = 5 * list.length + 11;
						tile.x = 0;
						tile.y = (i == 0) ? -66 + offset : ((66 + 5) * i + 66) * -1 + offset;
						break;
				}
				
				this.groups.push(tile);
				this.addChild(tile);
				
				if (this.position == Position.PREV)
				{
					this.setChildIndex(tile, i);
				}
				
				if (this.position == Position.NEXT)
				{
					this.setChildIndex(tile, this.numChildren - i - 1);
				}
			}
			
			this.layout();
		}
		
		/**
		 * 初始化手牌
		 * @param list
		 */
		public function initCards(list:Vector.<Card>):void
		{
			while (this.cards.length > list.length)
			{
				var remove:Tile = this.cards.pop();
				
				if (this.contains(remove))
				{
					this.removeChild(remove);
				}
			}
			
			for (var i:int = 0; i < list.length; i++)
			{
				var card:Card = list[i];
				
				if (i < this.cards.length)
				{
					this.cards[i].card = card;
				}
				else
				{
					var tile:Tile = new Tile(card, this.position);
					this.cards.push(tile);
					this.addChild(tile);
				}
			}
			
			this.layout();
		}
		
		/**
		 * 布局
		 */
		public function layout(align:uint=Align.RIGHT):void
		{
			var start:uint = (align == Align.LEFT) ? 0 : (this.cards.length % 3 == 2) ? 14 - this.cards.length : 13 - this.cards.length;
			
			for (var i:int = 0; i < this.cards.length; i++)
			{
				var point:Point = this.cardPositions[i + start];
				var tile:Tile = this.cards[i];
				tile.status = this.status;
				
				var pointX:Number = point.x;
				var pointY:Number = point.y;
				
				if (this.status == CardStatus.HIDE || this.status == CardStatus.SHOW)
				{
					switch (this.position)
					{
						case Position.CURRENT:
							pointY = point.y + 3.75;
							break;
						case Position.OPPOSITE:
							pointY = point.y + 3.2;
							break;
						case Position.PREV:
							pointX = point.x - 14.15;
							pointY = point.y + 3.3;
							break;
						case Position.PREV:
							pointY = point.y + 3.3;
							break;
					}
				}
				
				if (tile.x != pointX)
				{
					tile.x = pointX;
				}
				
				if (tile.y != pointY)
				{
					tile.y = pointY;
				}
				
				if (this.position == Position.PREV)
				{
					this.setChildIndex(tile, this.numChildren - 1);
				}
				
				if (this.position == Position.NEXT)
				{
					this.setChildIndex(tile, 0);
				}
			}
		}
		
		/**
		 * 整理排序
		 */
		public function sort():void
		{
			this.cards.sort(compareTileByID);
			this.layout();
		}
		
		/**
		 * 添加一张牌
		 * @param card
		 * @param sort
		 */
		public function addCard(card:Card, align:uint=Align.RIGHT):void
		{
			var start:uint = (align == Align.LEFT) ? 0 : (this.cards.length % 3 == 2) ? 14 - this.cards.length : 13 - this.cards.length;
			var point:Point = (this.cards.length + start >= this.cardPositions.length) ? this.cardPositions[start] : this.cardPositions[this.cards.length + start];
			
			var tile:Tile = new Tile(card, this.position);
			tile.x = point.x;
			tile.y = point.y - 15;
			
			this.cards.push(tile);
			this.addChild(tile);
			
			if (this.position == Position.PREV)
			{
				this.setChildIndex(tile, this.numChildren - 1);
			}
			
			if (this.position == Position.NEXT)
			{
				this.setChildIndex(tile, 0);
			}
			
			TweenMax.to(tile, 0.2, {y: point.y});
		}
		
		/**
		 * 移除一张牌
		 * @param card
		 * @param sort
		 */
		public function removeCard(card:Card):void
		{
			for each (var tile:Tile in this.cards)
			{
				if (tile.card == card || tile.card.id == card.id)
				{
					this.cards.splice(this.cards.indexOf(tile), 1);
					
					if (this.contains(tile))
					{
						this.removeChild(tile);
						break;
					}
				}
			}
		}
		
		/**
		 * 根据牌信息获取麻将牌
		 * @param card
		 * @return
		 */
		public function getTileByCard(card:Card):Tile
		{
			for each (var tile:Tile in this.cards)
			{
				if (tile.card == card || tile.card.id == card.id)
				{
					return tile;
				}
			}
			
			return null;
		}
		
		/**
		 * 重置牌状态
		 */
		public function resetTiles():void
		{
			for each (var tile:Tile in this.cards)
			{
				tile.tingInfo = null;
				tile.confirm = false;
				tile.select = (tile == this.selected && this.enable);
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		override protected function onAddedToStage():void
		{
			if (this.position == Position.CURRENT)
			{
				this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				this.addEventListener(MouseEvent.CLICK, onMouseClick);
				this.stage.addEventListener(Event.MOUSE_LEAVE, onMouseOut);
			}
		}
		
		override protected function onRemovedFromStage():void
		{
			for (var i:int = 0; i < this.numChildren; i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				TweenMax.killTweensOf(child);
				this.removeChildAt(i);
			}
			
			if (this.position == Position.CURRENT)
			{
				this.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				this.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				this.removeEventListener(MouseEvent.CLICK, onMouseClick);
				this.stage.removeEventListener(Event.MOUSE_LEAVE, onMouseOut);
			}
		}
		
		private function initPositions():void
		{
			this.cardPositions = new Vector.<Point>();
			
			for (var i:int = 0; i < 14; i++)
			{
				var spacing:Number;
				var pointX:Number;
				var pointY:Number;
				
				switch (position)
				{
					case Position.CURRENT:
						spacing = 56;
						pointX = (i == 13) ? spacing * i + 10 : spacing * i;
						pointY = 0;
						break;
					case Position.OPPOSITE:
						spacing = 30;
						pointX = (i == 13) ? 0 - spacing * (i + 1) - 6 : 0 - spacing * (i + 1);
						pointY = 0;
						break;
					case Position.PREV:
						spacing = 22;
						pointX = 0;
						pointY = (i == 13) ? spacing * i + 15 : spacing * i;
						break;
					case Position.NEXT:
						spacing = 22;
						pointX = 0;
						pointY = (i == 13) ? 0 - spacing * (i + 1) - 15 : 0 - spacing * (i + 1);
						break;
				}
				
				this.cardPositions.push(new Point(pointX, pointY));
			}
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			var target:Tile = event.target as Tile;
			this._selected = target;
			
			this.update();
		}
		
		private function onMouseOut(event:Event):void
		{
			this._selected = null;
			
			this.update();
		}
		
		private function onMouseClick(event:MouseEvent):void
		{
			if (!this.enable)
			{
				return;
			}
			
			var target:Tile = event.target as Tile;
			
			if (target == null)
			{
				return;
			}
			
			this.dispatchEvent(new TileEvent(TileEvent.CONFIRM, target));
		}
		
		private function update():void
		{
			for each (var tile:Tile in this.cards)
			{
				tile.select = ((tile == this.selected && this.enable) || (tile.confirm && this.enable));
			}
			
			this.dispatchEvent(new TileEvent(TileEvent.SELECT, this.selected));
		}
	
	}
}
