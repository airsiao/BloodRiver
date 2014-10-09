package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.controller.GameController;
	import com.ourgame.mahjong.bloodriver.controller.GameSocketController;
	import com.ourgame.mahjong.bloodriver.view.GameView;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.State;
	
	/**
	 * 游戏状态
	 * @author SiaoLeon
	 */
	public class GameState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var view:GameView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameState(key:Object=null)
		{
			super(key);
			
			this.add(new ShuffleState()); //洗牌
			this.add(new DealDiceState()); //发牌骰子
			this.add(new DealCardsState()); //发牌
			this.add(new SelectSwapState()); //选择换牌
			this.add(new SwapDiceState()); //选择换牌
			this.add(new SwapCardsState()); //换牌
			this.add(new PlayState()); //行牌
			this.add(new ResultState()); //结算
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.view = new GameView();
		}
		
		override public function onEnter():void
		{
			Log.debug("进入", this.key);
			
			this.addView(this.view);
			
			this.addController(new GameSocketController());
			this.addController(new GameController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
