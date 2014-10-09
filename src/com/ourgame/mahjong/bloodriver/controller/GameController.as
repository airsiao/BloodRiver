package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.state.DealCardsState;
	import com.ourgame.mahjong.bloodriver.state.DealDiceState;
	import com.ourgame.mahjong.bloodriver.state.DiscardState;
	import com.ourgame.mahjong.bloodriver.state.DrawState;
	import com.ourgame.mahjong.bloodriver.state.SelectSwapState;
	import com.ourgame.mahjong.bloodriver.state.ShuffleState;
	import com.ourgame.mahjong.bloodriver.state.SwapCardsState;
	import com.ourgame.mahjong.bloodriver.state.SwapDiceState;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 游戏控制器
	 * @author SiaoLeon
	 */
	public class GameController extends Controller
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
		public function GameController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(GameMethod.GAME_START, GAME_START);
			this.register(GameMethod.DEAL_DICE, DEAL_DICE);
			this.register(GameMethod.SWAP_DICE, SWAP_DICE);
			this.register(GameMethod.DEAL_CARDS, DEAL_CARDS);
			this.register(GameMethod.SELECT_SWAP, SELECT_SWAP);
			this.register(GameMethod.SWAP_CARDS, SWAP_CARDS);
			
			this.register(GameMethod.DRAW, DRAW);
			this.register(GameMethod.DISCARD, DISCARD);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function GAME_START(notice:INotice):void
		{
			(this.context as State).manager.switchState(ShuffleState);
		}
		
		private function DEAL_DICE(notice:INotice):void
		{
			(this.context as State).manager.switchState(DealDiceState);
		}
		
		private function SWAP_DICE(notice:INotice):void
		{
			(this.context as State).manager.switchState(SwapDiceState);
		}
		
		private function DEAL_CARDS(notice:INotice):void
		{
			(this.context as State).manager.switchState(DealCardsState);
		}
		
		private function SELECT_SWAP(notice:INotice):void
		{
			(this.context as State).manager.switchState(SelectSwapState);
		}
		
		private function SWAP_CARDS(notice:INotice):void
		{
			(this.context as State).manager.switchState(SwapCardsState);
		}
		
		private function DRAW(notice:INotice):void
		{
			var state:DrawState = (this.context as State).manager.switchState(DrawState) as DrawState;
			state.view.draw(notice.params);
		}
		
		private function DISCARD(notice:INotice):void
		{
			var state:DiscardState = (this.context as State).manager.switchState(DiscardState) as DiscardState;
			state.view.discard(notice.params);
		}
	
	}
}
