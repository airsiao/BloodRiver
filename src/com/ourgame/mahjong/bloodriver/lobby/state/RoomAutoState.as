package com.ourgame.mahjong.bloodriver.lobby.state
{
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.State;
	
	/**
	 * 自动配桌房间状态
	 * @author SiaoLeon
	 */
	public class RoomAutoState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function RoomAutoState(key:Object=null)
		{
			super(key);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onEnter():void
		{
			Log.debug("进入自动配桌房间");
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
