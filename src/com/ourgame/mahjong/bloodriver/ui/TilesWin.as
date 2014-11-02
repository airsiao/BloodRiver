package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.wecoit.display.DisplayElement;
	
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * 胡过的牌
	 * @author SiaoLeon
	 */
	public class TilesWin extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static const WidthV:Number = 25;
		
		private static const WidthH:Number = 20;
		
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
		public function TilesWin(position:uint)
		{
			super();
			
			this._position = position;
			
			switch (this.position)
			{
				case Position.CURRENT:
					this.x = 305;
					this.y = 440;
					break;
				case Position.OPPOSITE:
					this.x = 654;
					this.y = 58;
					break;
				case Position.PREV:
					this.x = 180;
					this.y = 110;
					break;
				case Position.NEXT:
					this.x = 748;
					this.y = 394;
					break;
			}
			
			this.filters = [new ColorMatrixFilter([0.64, 0, 0, 0, 0, 0, 1, 0, 0, 44, 0, 0, 0.83, 0, 0, 0, 0, 0, 1, 0])];
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function init(list:Vector.<Card>):void
		{
			for each (var card:Card in list)
			{
				this.add(card);
			}
		}
		
		public function add(card:Card):void
		{
			var tile:Tile = new Tile(card, this.position, CardStatus.POOL);
			var index:uint = this.numChildren % 16;
			var offset:Number = Math.floor(this.numChildren / 16) * 7;
			
			switch (this.position)
			{
				case Position.CURRENT:
					tile.x = (index % 14) * WidthV;
					tile.y = 0 - offset;
					break;
				case Position.OPPOSITE:
					tile.x = (index % 14 + 1) * WidthV * -1;
					tile.y = 0 - offset;
					break;
				case Position.PREV:
					tile.x = 0;
					tile.y = (index % 14) * WidthH - offset;
					break;
				case Position.NEXT:
					tile.x = 0;
					tile.y = (index % 14 + 1) * WidthH * -1 - offset;
					break;
			}
			
			this.addChildAt(tile, (this.position == Position.NEXT || this.position == Position.OPPOSITE) ? Math.max(0, Math.floor(this.numChildren / 16) * 16) : this.numChildren);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
