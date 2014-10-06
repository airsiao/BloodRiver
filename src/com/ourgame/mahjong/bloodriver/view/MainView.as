package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.wecoit.mvc.View;
	
	/**
	 * 主视图
	 * @author SiaoLeon
	 */
	public class MainView extends View
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
		public function MainView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.module.addChild(LayerManager.instance.background);
			this.module.addChild(LayerManager.instance.foreground);
		}
		
		override public function onRemove():void
		{
			this.module.removeChild(LayerManager.instance.background);
			this.module.removeChild(LayerManager.instance.foreground);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}