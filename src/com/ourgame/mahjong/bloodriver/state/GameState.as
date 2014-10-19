package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.controller.GameController;
	import com.ourgame.mahjong.bloodriver.controller.GameSocketController;
	import com.ourgame.mahjong.bloodriver.view.ActionView;
	import com.ourgame.mahjong.bloodriver.view.DealCardsView;
	import com.ourgame.mahjong.bloodriver.view.DealDiceView;
	import com.ourgame.mahjong.bloodriver.view.DiscardView;
	import com.ourgame.mahjong.bloodriver.view.DrawView;
	import com.ourgame.mahjong.bloodriver.view.RequestView;
	import com.ourgame.mahjong.bloodriver.view.ShuffleView;
	import com.ourgame.mahjong.bloodriver.view.SwapCardsView;
	import com.ourgame.mahjong.bloodriver.view.SwapDiceView;
	import com.ourgame.mahjong.bloodriver.view.TilesView;
	import com.ourgame.mahjong.bloodriver.view.WinView;
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
		
		public var tiles:TilesView;
		
		public var shuffle:ShuffleView;
		
		public var dealDice:DealDiceView;
		
		public var dealCards:DealCardsView;
		
		public var swapDice:SwapDiceView;
		
		public var swapCards:SwapCardsView;
		
		public var draw:DrawView;
		
		public var discard:DiscardView;
		
		public var request:RequestView;
		
		public var action:ActionView;
		
		public var win:WinView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameState(key:Object=null)
		{
			super(key);
			
			this.add(new SelectSwapState());
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.tiles = new TilesView();
			this.shuffle = new ShuffleView();
			this.dealDice = new DealDiceView();
			this.dealCards = new DealCardsView();
			this.swapDice = new SwapDiceView();
			this.swapCards = new SwapCardsView();
			this.draw = new DrawView();
			this.discard = new DiscardView();
			this.request = new RequestView();
			this.action = new ActionView();
			this.win = new WinView();
		}
		
		override public function onEnter():void
		{
			Log.debug("进入", this.key);
			
			this.addView(this.tiles);
			this.addView(this.shuffle);
			this.addView(this.dealDice);
			this.addView(this.dealCards);
			this.addView(this.swapDice);
			this.addView(this.swapCards);
			this.addView(this.draw);
			this.addView(this.discard);
			this.addView(this.request);
			this.addView(this.action);
			this.addView(this.win);
			
			this.addController(new GameSocketController());
			this.addController(new GameController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
