package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.View;
	
	/**
	 * 发牌骰子视图
	 * @author SiaoLeon
	 */
	public class DealDiceView extends View
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
		public function DealDiceView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			var dealer:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(GameData.game.dealer);
			var dice:uint = 0;
			
			for each (var point:uint in GameData.game.dealDice)
			{
				dice += point;
			}
			
			((this.context as State).manager.getState(GameState) as GameState).view.scene.wall.init(dealer, dice);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}