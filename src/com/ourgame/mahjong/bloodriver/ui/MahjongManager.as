package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.wecoit.errors.SingletonError;
	
	/**
	 * 麻将牌管理器
	 * @author SiaoLeon
	 */
	public class MahjongManager
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static var _instance:MahjongManager;
		
		/**
		 * 获取单例对象
		 */
		public static function get instance():MahjongManager
		{
			if (_instance == null)
			{
				_instance = new MahjongManager();
			}
			return _instance;
		}
		
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
		 * 构造函数，单例模式
		 */
		public function MahjongManager()
		{
			if (_instance != null)
			{
				throw new SingletonError(this);
			}
			_instance = this;
			
			this.init();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function init():void
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
		}
	
	}
}
