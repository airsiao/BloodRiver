package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[Event(name="back", type="flash.events.Event")]
	
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
			
			this.btnBack = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonBack));
			this.addChild(this.btnBack);
			
			this.btnBack.addEventListener(MouseEvent.CLICK, onBack, false, 0, true);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onBack(event:MouseEvent):void
		{
			this.dispatchEvent(new Event("back"));
		}
	
	}
}
