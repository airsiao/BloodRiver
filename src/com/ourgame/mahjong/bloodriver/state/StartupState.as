package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.controller.StartupController;
	import com.wecoit.mvc.State;
	
	/**
	 * 启动状态
	 * @author SiaoLeon
	 */
	public class StartupState extends State
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
		public function StartupState(key:Object=null)
		{
			super(key);
			
			this.add(new ConnectState());
			this.add(new TableState());
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onEnter():void
		{
			this.addController(new StartupController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
