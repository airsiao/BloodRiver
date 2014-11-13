package com.ourgame.mahjong.bloodriver.table.state
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.enum.PlayMode;
	import com.ourgame.mahjong.bloodriver.table.controller.RoleController;
	import com.ourgame.mahjong.bloodriver.table.controller.TableController;
	import com.ourgame.mahjong.bloodriver.table.controller.TableSocketController;
	import com.ourgame.mahjong.bloodriver.table.model.TableModel;
	import com.ourgame.mahjong.bloodriver.table.model.TableSocketModel;
	import com.ourgame.mahjong.bloodriver.table.view.LayerView;
	import com.ourgame.mahjong.bloodriver.table.view.RoleView;
	import com.ourgame.mahjong.bloodriver.table.view.TableView;
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
		
		public var layer:LayerView;
		
		public var table:TableView;
		
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
			this.layer = new LayerView();
			this.table = new TableView();
			this.role = new RoleView();
		}
		
		override public function onEnter():void
		{
			this.addModel(TableModel);
			
			if (CommonData.playMode == PlayMode.CONSOLE)
			{
				//				this.addModel(ConsoleModel);
				//				this.addController(new ConsoleController());
			}
			else
			{
				this.addModel(TableSocketModel);
				this.addController(new TableSocketController());
			}
			
			this.addView(this.layer);
			this.addView(this.table);
			this.addView(this.role);
			
			this.addController(new RoleController());
			this.addController(new TableController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
