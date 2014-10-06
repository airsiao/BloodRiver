package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.controller.ConsoleController;
	import com.ourgame.mahjong.bloodriver.controller.GameSocketController;
	import com.ourgame.mahjong.bloodriver.controller.TableController;
	import com.ourgame.mahjong.bloodriver.model.ConsoleModel;
	import com.ourgame.mahjong.bloodriver.model.GameModel;
	import com.ourgame.mahjong.bloodriver.model.MainSocketModel;
	import com.ourgame.mahjong.bloodriver.view.TableView;
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
		
		public var view:TableView;
		
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
			this.view = new TableView();
		}
		
		override public function onEnter():void
		{
			this.addModel(GameModel);
			
			if ((this.manager as BloodRiver).info.data.table.mode == PlayMode.CONSOLE)
			{
				this.addModel(ConsoleModel);
				this.addController(new ConsoleController());
			}
			else
			{
				this.addModel(MainSocketModel);
				this.addController(new GameSocketController());
			}
			
			this.addView(this.view);
			
			this.addController(new TableController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
