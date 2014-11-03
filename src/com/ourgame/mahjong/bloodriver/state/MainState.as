package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.controller.ConnectController;
	import com.ourgame.mahjong.bloodriver.controller.StartupController;
	import com.ourgame.mahjong.bloodriver.model.TableModel;
	import com.ourgame.mahjong.bloodriver.view.MainView;
	import com.wecoit.mvc.State;
	
	/**
	 * 主状态
	 * @author SiaoLeon
	 */
	public class MainState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var view:MainView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function MainState(key:Object=null)
		{
			super(key);
			
			this.add(new TableState());
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.view = new MainView();
		}
		
		override public function onEnter():void
		{
			this.addModel(TableModel);
			
			this.addView(this.view);
			
			this.addController(new ConnectController());
			this.addController(new StartupController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
