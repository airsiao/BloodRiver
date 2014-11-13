package com.ourgame.mahjong.bloodriver.table.utils
{
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.errors.SingletonError;
	
	/**
	 * 麻将工厂
	 * @author SiaoLeon
	 */
	public class MahjongFactory
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		private static var _instance:MahjongFactory;
		
		/**
		 * 获取单例对象
		 */
		public static function get instance():MahjongFactory
		{
			if (_instance == null)
			{
				_instance = new MahjongFactory();
			}
			return _instance;
		}
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数，单例模式
		 */
		public function MahjongFactory()
		{
			if (_instance != null)
			{
				throw new SingletonError(this);
			}
			_instance = this;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		/**
		 * 生成一张麻将牌
		 * @param color
		 * @param point
		 * @param index
		 * @param isMagic
		 * @return
		 */
		public function create(color:int, point:int, index:int=0, isMagic:Boolean=false):Card
		{
			var id:int = 0;
			id |= index;
			id |= point << 2;
			id |= color << 6;
			
			if (isMagic)
			{
				id |= 0x400;
			}
			
			return new Card(id);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
