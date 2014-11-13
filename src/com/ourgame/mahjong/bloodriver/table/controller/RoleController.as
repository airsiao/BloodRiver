package com.ourgame.mahjong.bloodriver.table.controller
{
	import com.ourgame.mahjong.bloodriver.table.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.table.state.TableState;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 角色控制器
	 * @author SiaoLeon
	 */
	public class RoleController extends Controller
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
		public function RoleController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(GameMethod.GAME_START, GAME_START);
			this.register(GameMethod.DRAW, DRAW);
			this.register(GameMethod.DISCARD, DISCARD);
			this.register(GameMethod.ACTION, ACTION);
			this.register(GameMethod.WIN, WIN);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function GAME_START(notice:INotice):void
		{
			(this.context as TableState).role.dealer(notice);
		}
		
		private function DRAW(notice:INotice):void
		{
			var action:Action = notice.params;
			
			(this.context as TableState).role.draw(action.seat);
			
			notice.complete();
		}
		
		private function DISCARD(notice:INotice):void
		{
			var action:Action = notice.params;
			
			(this.context as TableState).role.discard(action.seat);
			
			notice.complete();
		}
		
		private function ACTION(notice:INotice):void
		{
			var action:Action = notice.params;
			
			(this.context as TableState).role.action(action.seat);
			
			notice.complete();
		}
		
		private function WIN(notice:INotice):void
		{
			(this.context as TableState).role.win(notice);
		}
	
	}
}
