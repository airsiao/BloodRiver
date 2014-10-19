package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.ui.TilesPool;
	import com.ourgame.mahjong.bloodriver.ui.TilesWall;
	import com.ourgame.mahjong.bloodriver.ui.TilesWin;
	import com.wecoit.mvc.View;
	
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
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
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
			
			LayerManager.instance.foreground.addChild(this.handOpposite);
			LayerManager.instance.foreground.addChild(this.handPrev);
			
			LayerManager.instance.foreground.addChild(this.winOpposite);
			LayerManager.instance.foreground.addChild(this.winPrev);
			
			LayerManager.instance.foreground.addChild(this.poolNext);
			LayerManager.instance.foreground.addChild(this.poolCurrent);
			
			LayerManager.instance.foreground.addChild(this.wall);
			
			LayerManager.instance.foreground.addChild(this.poolOpposite);
			LayerManager.instance.foreground.addChild(this.poolPrev);
			
			LayerManager.instance.foreground.addChild(this.winNext);
			LayerManager.instance.foreground.addChild(this.winCurrent);
			
			LayerManager.instance.foreground.addChild(this.handNext);
			LayerManager.instance.foreground.addChild(this.handCurrent);
		}
		
		override public function onRemove():void
		{
			LayerManager.instance.foreground.removeChild(this.handCurrent);
			LayerManager.instance.foreground.removeChild(this.handNext);
			
			LayerManager.instance.foreground.removeChild(this.winCurrent);
			LayerManager.instance.foreground.removeChild(this.winNext);
			
			LayerManager.instance.foreground.removeChild(this.poolOpposite);
			LayerManager.instance.foreground.removeChild(this.poolPrev);
			
			LayerManager.instance.foreground.removeChild(this.wall);
			
			LayerManager.instance.foreground.removeChild(this.poolCurrent);
			LayerManager.instance.foreground.removeChild(this.poolNext);
			
			LayerManager.instance.foreground.removeChild(this.winOpposite);
			LayerManager.instance.foreground.removeChild(this.winPrev);
			
			LayerManager.instance.foreground.removeChild(this.handPrev);
			LayerManager.instance.foreground.removeChild(this.handOpposite);
			
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
