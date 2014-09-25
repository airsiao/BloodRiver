package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.state.ChangeCardsState;
	import com.ourgame.mahjong.bloodriver.state.ChangeDiceState;
	import com.ourgame.mahjong.bloodriver.state.DealCardsState;
	import com.ourgame.mahjong.bloodriver.state.DealDiceState;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.state.PlayState;
	import com.ourgame.mahjong.bloodriver.state.ResultState;
	import com.ourgame.mahjong.bloodriver.state.ShuffleState;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 桌子控制器
	 * @author SiaoLeon
	 */
	public class TableController extends Controller
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
		public function TableController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(GameMethod.GAME_START, GAME_START);
			this.register(GameMethod.GAME_END, GAME_END);
			this.register(GameMethod.SHUFFLE, SHUFFLE);
			this.register(GameMethod.DEAL_DICE, DEAL_DICE);
			this.register(GameMethod.DEAL_CARDS, DEAL_CARDS);
			this.register(GameMethod.CHANGE_DICE, CHANGE_DICE);
			this.register(GameMethod.CHANGE_CARDS, CHANGE_CARDS);
			this.register(GameMethod.PLAY, PLAY);
			this.register(GameMethod.RESULT, RESULT);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function GAME_START(notice:INotice):void
		{
			GameData.game = notice.params as Game;
			
			(this.context as State).manager.switchState(GameState);
			
			notice.complete();
		}
		
		private function GAME_END(notice:INotice):void
		{
			GameData.game = null;
			
			(this.context as State).manager.switchState(TableState);
			
			notice.complete();
		}
		
		private function SHUFFLE(notice:INotice):void
		{
			(this.context as State).manager.switchState(ShuffleState);
			
			notice.complete();
		}
		
		private function DEAL_DICE(notice:INotice):void
		{
			(this.context as State).manager.switchState(DealDiceState);
			
			notice.complete();
		}
		
		private function DEAL_CARDS(notice:INotice):void
		{
			(this.context as State).manager.switchState(DealCardsState);
			
			notice.complete();
		}
		
		private function CHANGE_DICE(notice:INotice):void
		{
			(this.context as State).manager.switchState(ChangeDiceState);
			
			notice.complete();
		}
		
		private function CHANGE_CARDS(notice:INotice):void
		{
			(this.context as State).manager.switchState(ChangeCardsState);
			
			notice.complete();
		}
		
		private function PLAY(notice:INotice):void
		{
			(this.context as State).manager.switchState(PlayState);
			
			notice.complete();
		}
		
		private function RESULT(notice:INotice):void
		{
			(this.context as State).manager.switchState(ResultState);
			
			notice.complete();
		}
	
	}
}
