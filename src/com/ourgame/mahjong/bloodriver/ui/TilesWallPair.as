package com.ourgame.mahjong.bloodriver.ui
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.wecoit.display.DisplayElement;
	
	/**
	 * 牌墙一对
	 * @author SiaoLeon
	 */
	public class TilesWallPair extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _down:Tile;
		
		public function get down():Tile
		{
			return this._down;
		}
		
		private var _up:Tile;
		
		public function get up():Tile
		{
			return this._up;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var position:uint;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesWallPair(position:uint=Position.CURRENT)
		{
			super();
			
			this.position = position;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function add():void
		{
			if (this._down == null)
			{
				this._down = new Tile(null, position, CardStatus.WALL);
				this._down.x = 0;
				this._down.y = 11;
				this.addChild(this._down);
				return;
			}
			
			if (this._up == null)
			{
				this._up = new Tile(null, position, CardStatus.WALL);
				this._up.x = 0;
				this._up.y = 0;
				this.addChild(this._up);
				return;
			}
		}
		
		public function pop():Tile
		{
			var tile:Tile = null;
			
			if (this._up != null)
			{
				tile = this.up;
				this._up = null;
				TweenMax.to(tile, 0.2, {y: tile.y - 7, alpha: 0, onComplete: onPopComplete, onCompleteParams: [tile]});
				return tile;
			}
			
			if (this.down != null)
			{
				tile = this.down;
				this._down = null;
				TweenMax.to(tile, 0.2, {y: tile.y - 7, alpha: 0, onComplete: onPopComplete, onCompleteParams: [tile]});
				return tile;
			}
			
			return null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onPopComplete(tile:Tile):void
		{
			this.removeChild(tile);
		}
	
	}
}
