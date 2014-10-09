package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	/**
	 * 洗牌视图
	 * @author SiaoLeon
	 */
	public class ShuffleView extends View
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
		public function ShuffleView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			((this.context as State).manager.getState(GameState) as GameState).view.scene.wall.init();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}