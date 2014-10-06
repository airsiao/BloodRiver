package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.wecoit.display.DisplayElement;
	
	/**
	 * 游戏场景
	 * @author SiaoLeon
	 */
	public class GameScene extends DisplayElement
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
		public function GameScene()
		{
			super();
			
			this.init();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function clear():void
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
		
		public function init():void
		{
			super.clear();
			
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
			
			this.addChild(this.handOpposite);
			this.addChild(this.handPrev);
			
			this.addChild(this.winOpposite);
			this.addChild(this.winPrev);
			
			this.addChild(this.poolNext);
			this.addChild(this.poolCurrent);
			
			this.addChild(this.wall);
			
			this.addChild(this.poolOpposite);
			this.addChild(this.poolPrev);
			
			this.addChild(this.winNext);
			this.addChild(this.winCurrent);
			
			this.addChild(this.handNext);
			this.addChild(this.handCurrent);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
