package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.events.MenuEvent;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.events.MouseEvent;
	
	[Event(name="return", type="com.ourgame.mahjong.bloodriver.table.events.MenuEvent")]
	
	/**
	 * 菜单条
	 * @author SiaoLeon
	 */
	public class MenuBar extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var btnBack:ButtonClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function MenuBar()
		{
			super();
			
			this.x = 925;
			this.y = 3;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		override protected function onAddedToStage():void
		{
			this.btnBack = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonBack));
			this.addChild(this.btnBack);
			
			this.btnBack.addEventListener(MouseEvent.CLICK, onReturn);
		}
		
		override protected function onRemovedFromStage():void
		{
			this.clear();
			
			this.btnBack.removeEventListener(MouseEvent.CLICK, onReturn);
			this.btnBack = null;
		}
		
		private function onReturn(event:MouseEvent):void
		{
			this.dispatchEvent(new MenuEvent(MenuEvent.RETURN));
		}
	
	}
}
