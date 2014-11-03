package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.controller.ConsoleController;
	import com.ourgame.mahjong.bloodriver.controller.MainSocketController;
	import com.ourgame.mahjong.bloodriver.controller.TableController;
	import com.ourgame.mahjong.bloodriver.model.ConsoleModel;
	import com.ourgame.mahjong.bloodriver.model.GameModel;
	import com.ourgame.mahjong.bloodriver.model.MainSocketModel;
	import com.ourgame.mahjong.bloodriver.view.RoleView;
	import com.ourgame.mahjong.bloodriver.view.TableView;
	import com.ourgame.mahjong.libaray.data.CommonData;
	import com.ourgame.mahjong.libaray.enum.PlayMode;
	import com.wecoit.mvc.State;
	
	/**
	 * 桌子状态
	 * @author SiaoLeon
	 */
	public class TableState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var ui:TableView;
		
		public var role:RoleView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableState(key:Object=null)
		{
			super(key);
			
			this.add(new GameState());
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.ui = new TableView();
			this.role = new RoleView();
		}
		
		override public function onEnter():void
		{
			this.addModel(GameModel);
			
			if (CommonData.playMode == PlayMode.CONSOLE)
			{
				this.addModel(ConsoleModel);
				this.addController(new ConsoleController());
			}
			else
			{
				this.addModel(MainSocketModel);
				this.addController(new MainSocketController());
			}
			
			this.addView(this.ui);
			this.addView(this.role);
			
			this.addController(new TableController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
