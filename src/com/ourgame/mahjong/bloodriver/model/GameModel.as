package com.ourgame.mahjong.bloodriver.model
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.IGameProxy;
	import com.wecoit.mvc.Model;
	import com.wecoit.mvc.State;
	
	/**
	 * 游戏数据模型
	 * @author SiaoLeon
	 */
	public class GameModel extends Model implements IGameProxy
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var data:DataExchange;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			this.data.gameProxy = this;
		}
		
		override public function onRemove():void
		{
			this.data.gameProxy = null;
			this.data = null;
		}
		
		public function start():void
		{
			this.notify(GameMethod.GAME_ENTER);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
