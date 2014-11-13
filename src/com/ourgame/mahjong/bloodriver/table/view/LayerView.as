package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.wecoit.mvc.View;
	
	/**
	 * 图层视图
	 * @author SiaoLeon
	 */
	public class LayerView extends View
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
		public function LayerView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.module.addChild(TableLayer.instance.background);
			this.module.addChild(TableLayer.instance.role);
			this.module.addChild(TableLayer.instance.tile);
			this.module.addChild(TableLayer.instance.foreground);
			this.module.addChild(TableLayer.instance.pop);
			this.module.addChild(TableLayer.instance.tip);
		}
		
		override public function onRemove():void
		{
			this.module.removeChild(TableLayer.instance.background);
			this.module.removeChild(TableLayer.instance.role);
			this.module.removeChild(TableLayer.instance.tile);
			this.module.removeChild(TableLayer.instance.foreground);
			this.module.removeChild(TableLayer.instance.pop);
			this.module.removeChild(TableLayer.instance.tip);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
