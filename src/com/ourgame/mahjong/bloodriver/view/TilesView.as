package com.ourgame.mahjong.bloodriver.view
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UIEffectDefinition;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.Tile;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.ui.TilesWall;
	import com.ourgame.mahjong.bloodriver.ui.TilesWin;
	import com.ourgame.mahjong.bloodriver.vo.Card;
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
				var point:Point = tile.localToGlobal(new Point(tile.width / 2, tile.height / 2));
				this.currentArrow.visible = true;
				this.currentArrow.x = point.x;
				this.currentArrow.y = point.y;
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
			
			LayerManager.instance.tile.addChild(this.handOpposite);
			LayerManager.instance.tile.addChild(this.handPrev);
			
			LayerManager.instance.tile.addChild(this.winOpposite);
			LayerManager.instance.tile.addChild(this.winPrev);
			
			LayerManager.instance.tile.addChild(this.poolNext);
			LayerManager.instance.tile.addChild(this.poolCurrent);
			
			LayerManager.instance.tile.addChild(this.wall);
			
			LayerManager.instance.tile.addChild(this.poolOpposite);
			LayerManager.instance.tile.addChild(this.poolPrev);
			
			LayerManager.instance.tile.addChild(this.winNext);
			LayerManager.instance.tile.addChild(this.winCurrent);
			
			LayerManager.instance.tile.addChild(this.handNext);
			LayerManager.instance.tile.addChild(this.handCurrent);
			
			LayerManager.instance.tile.addChild(this.currentArrow);
		}
		
		override public function onRemove():void
		{
			LayerManager.instance.tile.removeChild(this.currentArrow);
			
			LayerManager.instance.tile.removeChild(this.handCurrent);
			LayerManager.instance.tile.removeChild(this.handNext);
			
			LayerManager.instance.tile.removeChild(this.winCurrent);
			LayerManager.instance.tile.removeChild(this.winNext);
			
			LayerManager.instance.tile.removeChild(this.poolOpposite);
			LayerManager.instance.tile.removeChild(this.poolPrev);
			
			LayerManager.instance.tile.removeChild(this.wall);
			
			LayerManager.instance.tile.removeChild(this.poolCurrent);
			LayerManager.instance.tile.removeChild(this.poolNext);
			
			LayerManager.instance.tile.removeChild(this.winOpposite);
			LayerManager.instance.tile.removeChild(this.winPrev);
			
			LayerManager.instance.tile.removeChild(this.handPrev);
			LayerManager.instance.tile.removeChild(this.handOpposite);
			
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
			LayerManager.instance.tile.addChild(this.wallMask);
			
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
			LayerManager.instance.tile.removeChild(this.wallMask);
			this.wallMask = null;
			this.wall.mask = null;
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
