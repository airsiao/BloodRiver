package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.events.TileEvent;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.vo.HandCards;
	import com.wecoit.display.DisplayElement;
	
	import flash.events.MouseEvent;
	
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
					this.y = 570;
					break;
				case Position.OPPOSITE:
					this.x = 655;
					this.y = 50;
					break;
				case Position.PREV:
					this.x = 144;
					this.y = 140;
					break;
				case Position.NEXT:
					this.x = 815;
					this.y = 390;
					break;
			}
			
			if (this.position == Position.CURRENT)
			{
				this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function init(hands:HandCards):void
		{
			this.initGroups(hands.groups.list);
			this.initCards(hands.cards.list);
		}
		
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
				
				switch (position)
				{
					case Position.CURRENT:
						tile.x = 167 * i;
						tile.y = -77.65;
						break;
					case Position.OPPOSITE:
						tile.x = (i == 0) ? -73.75 : 78 * i * -1 - 73.75;
						tile.y = -37.1;
						break;
					case Position.PREV:
						tile.x = 0;
						tile.y = 66.65 * i;
						break;
					case Position.NEXT:
						tile.x = -32.2;
						tile.y = (i == 0) ? -63.7 : 66.65 * i * -1 - 63.7;
						break;
				}
				
				this.groups.push(tile);
				this.addChild(tile);
			}
			
			this.layout();
		}
		
		public function initCards(list:Vector.<Card>):void
		{
			while (this.cards.length > 0)
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
				var tile:Tile = new Tile(card, this.position);
				this.cards.push(tile);
				this.addChild(tile);
			}
			
			this.layout();
		}
		
		public function layout():void
		{
			for (var i:int = 0; i < this.cards.length; i++)
			{
				var index:uint = (this.cards.length % 3 == 2) ? 14 - this.cards.length + i : 13 - this.cards.length + i;
				var offset:Number;
				var spacing:Number;
				
				var tile:Tile = this.cards[i];
				tile.status = this.status;
				
				var tileX:Number = 0;
				var tileY:Number = 0;
				
				switch (position)
				{
					case Position.CURRENT:
						offset = (this.status == CardStatus.STAND) ? 0 : 12 * this.groups.length;
						spacing = (this.status == CardStatus.STAND) ? 56.2 : 52;
						tileX = (index == 13) ? spacing * index + 10 + offset : spacing * index + offset;
						tileY = tile.height * -1;
						break;
					case Position.OPPOSITE:
						offset = (this.status == CardStatus.STAND) ? 0 : 4.25 * this.groups.length;
						spacing = (this.status == CardStatus.STAND) ? 31.65 : 24.65;
						tileX = (index == 13) ? 0 - (spacing * (index + 1) + 6 + offset) : 0 - (spacing * (index + 1) + offset);
						tileY = tile.height * -1;
						break;
					case Position.PREV:
						offset = (this.status == CardStatus.STAND) ? 0 : 10 * this.groups.length;
						spacing = (this.status == CardStatus.STAND) ? 22.05 : 18.95;
						tileX = 0;
						tileY = (index == 13) ? spacing * index + 15 + offset : spacing * index + offset;
						break;
					case Position.NEXT:
						offset = (this.status == CardStatus.STAND) ? 7 : 10 * this.groups.length + 7;
						spacing = (this.status == CardStatus.STAND) ? 22.05 : 18.95;
						tileX = tile.width * -1;
						tileY = (index == 13) ? 0 - (spacing * (index + 1) + 15 + offset) : 0 - (spacing * (index + 1) + offset);
						this.setChildIndex(tile, 0);
						break;
				}
				
				if (tile.x != tileX || tile.y != tileY)
				{
					tile.x = tileX;
					tile.y = tileY;
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
				if (tile.card == card)
				{
					return tile;
				}
			}
			
			return null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onMouseOver(event:MouseEvent):void
		{
			var target:Tile = event.target as Tile;
			
			if (target == null)
			{
				return;
			}
			
			this._selected = target;
			
			this.update();
			
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.removeEventListener(MouseEvent.CLICK, onMouseClick);
			
			this._selected = null;
			
			this.update();
		}
		
		private function onMouseClick(event:MouseEvent):void
		{
			var target:Tile = event.target as Tile;
			
			if (target == null)
			{
				return;
			}
			
			target.confirm = !target.confirm;
			
			this.dispatchEvent(new TileEvent(TileEvent.CONFIRM, target));
		}
		
		private function update():void
		{
			for each (var tile:Tile in this.cards)
			{
				tile.select = (tile == this.selected && this.enable || tile.confirm);
			}
			
			this.dispatchEvent(new TileEvent(TileEvent.SELECT, this.selected));
		}
	
	}
}
