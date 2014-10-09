package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.wecoit.display.DisplayElement;
	
	/**
	 * 牌墙
	 * @author SiaoLeon
	 */
	public class TilesWall extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static const WidthH:Number = 25.4;
		
		private static const WidthV:Number = 18.3;
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var list:Vector.<TilesWallPair>;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesWall()
		{
			super();
			
			this.x = 217;
			this.y = 93;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function init(dealer:uint=Position.CURRENT, dice:uint=0, count:uint=108, gang:uint=0):void
		{
			this.clear();
			this.list = new Vector.<TilesWallPair>();
			
			var start:uint = 0;
			var over:uint = 108 - gang - count;
			
			switch ((dealer + dice - 1) % 4)
			{
				case Position.OPPOSITE:
					start = dice * 2;
					break;
				case Position.NEXT:
					start = 14 * 2 + dice * 2;
					break;
				case Position.CURRENT:
					start = 14 * 2 + 13 * 2 + dice * 2;
					break;
				case Position.PREV:
					start = 14 * 2 + 13 * 2 + 14 * 2 + dice * 2;
					break;
			}
			
			var startIndex:uint = (start + over) % 108;
			var endIndex:uint = (start - gang + 108 - 1) % 108;
			
			for (var i:int = 0; i < 108 / 2; i++)
			{
				var position:uint = i < 14 ? Position.OPPOSITE : i < 14 + 13 ? Position.NEXT : i < 14 + 13 + 14 ? Position.CURRENT : Position.PREV;
				var pair:TilesWallPair = new TilesWallPair(position);
				
				for (var j:int = 0; j < 2; j++)
				{
					var index:uint = i * 2 + j;
					
					if (startIndex > endIndex && index > endIndex && index < startIndex)
					{
						continue;
					}
					
					if (startIndex < endIndex && (index > endIndex || index < startIndex))
					{
						continue;
					}
					
					if (count < 1)
					{
						continue;
					}
					
					pair.add();
				}
				
				if (pair.up != null || pair.down != null)
				{
					this.list.push(pair);
				}
				
				switch (position)
				{
					case Position.OPPOSITE:
						pair.x = 86 + i * WidthH;
						pair.y = 0;
						this.addChild(pair);
						break;
					case Position.NEXT:
						pair.x = 493;
						pair.y = 44 + (i - 14) * WidthV;
						this.addChild(pair);
						break;
					case Position.CURRENT:
						pair.x = 86 + (13 - (i - 14 - 13)) * WidthH;
						pair.y = 293;
						this.addChild(pair);
						break;
					case Position.PREV:
						pair.x = 0;
						pair.y = 44 + (12 - (i - 14 - 13 - 14)) * WidthV;
						this.addChildAt(pair, 0);
						break;
				}
			}
			
			this.list = this.list.concat(this.list.splice(0, Math.ceil((endIndex + 1) / 2)));
		}
		
		public function draw(reverse:Boolean=false):Tile
		{
			if (this.list.length <= 0)
			{
				return null;
			}
			
			var pair:TilesWallPair = (reverse) ? this.list[this.list.length - 1] : this.list[0];
			var tile:Tile = pair.pop();
			
			if (pair.up == null && pair.down == null)
			{
				(reverse) ? this.list.pop() : this.list.shift();
			}
			
			return null;
		}
		
		public function deal():void
		{
			for (var i:int = 0; i < 13 * 4; i++)
			{
				this.draw();
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
