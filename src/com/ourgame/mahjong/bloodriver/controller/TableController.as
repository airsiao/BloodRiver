package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.model.GameModel;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.getTimer;
	
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
		
		private var timer:Number;
		
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
			this.register(TableMethod.READY, READY);
			this.register(TableMethod.GAME_INVITE, GAME_INVITE);
			this.register(TableMethod.BACK, BACK);
			
			this.register(OperateMethod.SHOWTING, SHOWTING);
			
			this.register(GameMethod.GAME_START, GAME_START);
			this.register(GameMethod.DEAL_CARDS, DEAL_CARDS);
			this.register(GameMethod.SWAP_DICE, SWAP_DICE);
			this.register(GameMethod.SELECT_SWAP, SELECT_SWAP);
			this.register(GameMethod.GAME_PLAY, GAME_PLAY);
			this.register(GameMethod.FLOWER_PIG, FLOWER_PIG);
			this.register(GameMethod.DRAW, DRAW);
			this.register(GameMethod.DISCARD, DISCARD);
			this.register(GameMethod.ACTION, ACTION);
			this.register(GameMethod.RESULT, RESULT);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function READY(notice:INotice):void
		{
			((this.context as State).manager as BloodRiver).info.data.tableProxy.ready();
			
			(this.context as TableState).ui.swapBoard.swap = null;
			(this.context as TableState).ui.swapBoard.visible = false;
			(this.context as State).manager.switchState(TableState);
		}
		
		private function GAME_INVITE(notice:INotice):void
		{
			(this.context.getModel(GameModel) as GameModel).start();
		}
		
		private function BACK(notice:INotice):void
		{
			if (((this.context as State).manager as BloodRiver).info.data.tableProxy != null)
			{
				((this.context as State).manager as BloodRiver).info.data.tableProxy.leave();
			}
		}
		
		private function SHOWTING(notice:INotice):void
		{
			(this.context as TableState).ui.showTing(notice.params);
		}
		
		private function GAME_START(notice:INotice):void
		{
			(this.context as TableState).ui.bindGame(notice.params);
			
			notice.complete();
		}
		
		private function DEAL_CARDS(notice:INotice):void
		{
			this.timer = getTimer();
			
			notice.complete();
		}
		
		private function SWAP_DICE(notice:INotice):void
		{
			var number:uint = 0;
			
			for each (var d:uint in notice.params)
			{
				number += d;
			}
			
			(this.context as TableState).ui.swapBoard.dice = number;
			
			notice.complete();
		}
		
		private function SELECT_SWAP(notice:INotice):void
		{
			var used:uint = Math.round((getTimer() - this.timer) / 1000);
			(this.context as TableState).ui.countdown.timeout = Math.max(0, GameData.currentGame.swapTime - used);
			
			notice.complete();
		}
		
		private function GAME_PLAY(notice:INotice):void
		{
			(this.context as TableState).ui.swapBoard.swap = GameData.currentGame.swapOut;
			(this.context as TableState).ui.swapBoard.visible = true;
			
			(this.context as TableState).ui.countdown.show();
			(this.context as TableState).ui.countdown.timeout = 0;
			
			notice.complete();
		}
		
		private function DRAW(notice:INotice):void
		{
			var action:Action = notice.params;
			
			(this.context as TableState).ui.countdown.timeout = action.time;
			(this.context as TableState).ui.countdown.position = ((this.context as State).manager as BloodRiver).info.data.table.getSeatPosition(action.seat);
			
			notice.complete();
		}
		
		private function DISCARD(notice:INotice):void
		{
			(this.context as TableState).ui.countdown.timeout = 0;
			(this.context as TableState).ui.countdown.position = Position.UNKOWN;
			
			notice.complete();
		}
		
		private function ACTION(notice:INotice):void
		{
			var action:Action = notice.params;
			
			(this.context as TableState).ui.countdown.timeout = action.time;
			(this.context as TableState).ui.countdown.position = ((this.context as State).manager as BloodRiver).info.data.table.getSeatPosition(action.seat);
			
			notice.complete();
		}
		
		private function RESULT(notice:INotice):void
		{
			(this.context as TableState).ui.countdown.timeout = 0;
			(this.context as TableState).ui.countdown.position = Position.UNKOWN;
			
			notice.complete();
		}
		
		private function FLOWER_PIG(notice:INotice):void
		{
			(this.context as TableState).ui.updateFlowerPig(notice.params);
			
			notice.complete();
		}
	
	}
}
