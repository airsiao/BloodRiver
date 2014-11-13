package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.table.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.display.DisplayElement;
	
	/**
	 * 牌池
	 * @author SiaoLeon
	 */
	public class TilesPool extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static const WidthV:Number = 25;
		
		private static const HeightV:Number = 32;
		
		private static const WidthH:Number = 20;
		
		private static const HeightH:Number = 32;
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _position:uint;
		
		public function get position():uint
		{
			return this._position;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesPool(position:uint)
		{
			super();
			
			this._position = position;
			
			this.x = (this.position == Position.CURRENT || this.position == Position.OPPOSITE) ? 344 : (this.position == Position.PREV) ? 255 : 640;
			this.y = (this.position == Position.PREV || this.position == Position.NEXT) ? 150 : (this.position == Position.CURRENT) ? 312 : 145;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function init(list:Vector.<Card>):void
		{
			for each (var card:Card in list)
			{
				this.addCard(card);
			}
		}
		
		public function addCard(card:Card):void
		{
			var tile:Tile = new Tile(card, this.position, CardStatus.POOL);
			var index:uint = this.numChildren % 22;
			var offset:Number = Math.floor(this.numChildren / 22) * 7;
			var targetY:Number;
			
			switch (this.position)
			{
				case Position.CURRENT:
					tile.x = (index % 11) * WidthV;
					targetY = Math.floor(index / 11) * HeightV - offset;
					break;
				case Position.OPPOSITE:
					tile.x = ((21 - index) % 11) * WidthV;
					targetY = Math.floor(Math.abs(index - 21) / 11) * HeightV - offset;
					break;
				case Position.PREV:
					tile.x = Math.floor(Math.abs(index - 21) / 11) * HeightH;
					targetY = (index % 11) * WidthH - offset;
					break;
				case Position.NEXT:
					tile.x = Math.floor(index / 11) * HeightH;
					targetY = ((21 - index) % 11) * WidthH - offset;
					break;
			}
			
			this.addChildAt(tile, (this.position == Position.NEXT || this.position == Position.OPPOSITE) ? Math.max(0, Math.floor(this.numChildren / 22) * 22) : this.numChildren);
			
			tile.y = targetY - 15;
			tile.alpha = 0;
			TweenMax.to(tile, 0.15, {y: targetY, alpha: 1});
		}
		
		/**
		 * 移除一张牌
		 * @param card
		 * @param sort
		 */
		public function removeCard(card:Card):void
		{
			for (var i:int = 0; i < this.numChildren; i++)
			{
				var tile:Tile = this.getChildAt(i) as Tile;
				
				if (tile == null)
				{
					continue;
				}
				
				if (tile.card == card || tile.card.id == card.id)
				{
					if (this.contains(tile))
					{
						//	tile.alpha = 0.4;
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
			for (var i:int = 0; i < this.numChildren; i++)
			{
				var tile:Tile = this.getChildAt(i) as Tile;
				
				if (tile == null)
				{
					continue;
				}
				
				if (tile.card == card || tile.card.id == card.id)
				{
					return tile;
				}
			}
			
			return null;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
