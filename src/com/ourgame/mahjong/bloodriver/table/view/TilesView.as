package com.ourgame.mahjong.bloodriver.table.view
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.UIEffectDefinition;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.Tile;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesWall;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesWin;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * 游戏视图
	 * @author SiaoLeon
	 */
	public class TilesView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var wall:TilesWall;
		
		public var poolCurrent:TilesPool;
		
		public var poolNext:TilesPool;
		
		public var poolOpposite:TilesPool;
		
		public var poolPrev:TilesPool;
		
		public var winCurrent:TilesWin;
		
		public var winNext:TilesWin;
		
		public var winOpposite:TilesWin;
		
		public var winPrev:TilesWin;
		
		public var handCurrent:TilesHand;
		
		public var handNext:TilesHand;
		
		public var handOpposite:TilesHand;
		
		public var handPrev:TilesHand;
		
		private var _current:Card;
		
		public function get current():Card
		{
			return this._current;
		}
		
		public function set current(card:Card):void
		{
			this._current = card;
			
			if (card == null)
			{
				this.currentArrow.visible = false;
				return;
			}
			
			var tile:Tile;
			
			if (tile == null)
			{
				tile = this.poolCurrent.getTileByCard(card);
			}
			
			if (tile == null)
			{
				tile = this.poolOpposite.getTileByCard(card);
			}
			
			if (tile == null)
			{
				tile = this.poolNext.getTileByCard(card);
			}
			
			if (tile == null)
			{
				tile = this.poolPrev.getTileByCard(card);
			}
			
			if (tile == null)
			{
				this.currentArrow.visible = false;
			}
			else
			{
				var offset:Number = (tile.position == Position.CURRENT || tile.position == Position.OPPOSITE) ? 0 : 5;
				var point:Point = tile.localToGlobal(new Point(tile.width / 2, tile.height / 2));
				this.currentArrow.visible = true;
				this.currentArrow.x = this.module.x + point.x;
				this.currentArrow.y = this.module.y + point.y + offset;
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var wallMask:MovieClip;
		
		private var currentArrow:MovieClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.wall = new TilesWall();
			
			this.poolCurrent = new TilesPool(Position.CURRENT);
			this.poolNext = new TilesPool(Position.NEXT);
			this.poolOpposite = new TilesPool(Position.OPPOSITE);
			this.poolPrev = new TilesPool(Position.PREV);
			
			this.winCurrent = new TilesWin(Position.CURRENT);
			this.winNext = new TilesWin(Position.NEXT);
			this.winOpposite = new TilesWin(Position.OPPOSITE);
			this.winPrev = new TilesWin(Position.PREV);
			
			this.handCurrent = new TilesHand(Position.CURRENT);
			this.handNext = new TilesHand(Position.NEXT);
			this.handOpposite = new TilesHand(Position.OPPOSITE);
			this.handPrev = new TilesHand(Position.PREV);
			
			this.currentArrow = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.CurrentArrow);
			this.currentArrow.visible = false;
			
			TableLayer.instance.tile.addChild(this.handOpposite);
			TableLayer.instance.tile.addChild(this.handPrev);
			
			TableLayer.instance.tile.addChild(this.winOpposite);
			TableLayer.instance.tile.addChild(this.winPrev);
			
			TableLayer.instance.tile.addChild(this.poolNext);
			TableLayer.instance.tile.addChild(this.poolCurrent);
			
			TableLayer.instance.tile.addChild(this.wall);
			
			TableLayer.instance.tile.addChild(this.poolOpposite);
			TableLayer.instance.tile.addChild(this.poolPrev);
			
			TableLayer.instance.tile.addChild(this.winNext);
			TableLayer.instance.tile.addChild(this.winCurrent);
			
			TableLayer.instance.tile.addChild(this.handNext);
			TableLayer.instance.tile.addChild(this.handCurrent);
			
			TableLayer.instance.tile.addChild(this.currentArrow);
		}
		
		override public function onRemove():void
		{
			TweenMax.killTweensOf(this.wall);
			
			this.clear();
			
			TableLayer.instance.tile.removeChild(this.currentArrow);
			
			TableLayer.instance.tile.removeChild(this.handCurrent);
			TableLayer.instance.tile.removeChild(this.handNext);
			
			TableLayer.instance.tile.removeChild(this.winCurrent);
			TableLayer.instance.tile.removeChild(this.winNext);
			
			TableLayer.instance.tile.removeChild(this.poolOpposite);
			TableLayer.instance.tile.removeChild(this.poolPrev);
			
			TableLayer.instance.tile.removeChild(this.wall);
			
			TableLayer.instance.tile.removeChild(this.poolCurrent);
			TableLayer.instance.tile.removeChild(this.poolNext);
			
			TableLayer.instance.tile.removeChild(this.winOpposite);
			TableLayer.instance.tile.removeChild(this.winPrev);
			
			TableLayer.instance.tile.removeChild(this.handPrev);
			TableLayer.instance.tile.removeChild(this.handOpposite);
			
			this.currentArrow = null;
			
			this.handPrev = null;
			this.handOpposite = null;
			this.handNext = null;
			this.handCurrent = null;
			
			this.winPrev = null;
			this.winOpposite = null;
			this.winNext = null;
			this.winCurrent = null;
			
			this.poolPrev = null;
			this.poolOpposite = null;
			this.poolNext = null;
			this.poolCurrent = null;
			
			this.wall = null;
		}
		
		public function showWall():void
		{
			this.wallMask = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.WallMask);
			this.wallMask.x = 216;
			this.wallMask.y = 72;
			TableLayer.instance.tile.addChild(this.wallMask);
			
			this.wall.init();
			this.wall.y = 145;
			this.wall.mask = this.wallMask;
			TweenMax.to(this.wall, 0.3, {y: 87, onComplete: onWallUp, ease: Strong.easeOut});
		}
		
		private function onWallUp():void
		{
			TweenMax.to(this.wall, 0.1, {y: 94, onComplete: onWallDown});
		}
		
		private function onWallDown():void
		{
			TweenMax.to(this.wall, 0.1, {y: 93, onComplete: onWallShow});
		}
		
		private function onWallShow():void
		{
			this.wall.mask = null;
			
			TableLayer.instance.tile.removeChild(this.wallMask);
			this.wallMask = null;
		}
		
		public function clear():void
		{
			this.wall.clear();
			
			this.poolCurrent.clear();
			this.poolNext.clear();
			this.poolOpposite.clear();
			this.poolPrev.clear();
			
			this.winCurrent.clear();
			this.winNext.clear();
			this.winOpposite.clear();
			this.winPrev.clear();
			
			this.handCurrent.clear();
			this.handNext.clear();
			this.handOpposite.clear();
			this.handPrev.clear();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
