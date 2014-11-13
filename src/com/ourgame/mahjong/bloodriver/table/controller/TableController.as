package com.ourgame.mahjong.bloodriver.table.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.table.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.table.state.TableState;
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
			this.register(TableMethod.RETURN, RETURN);
			this.register(TableMethod.STAND_BY, STAND_BY);
			
			this.notify(TableMethod.STAND_BY);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function RETURN(notice:INotice):void
		{
			if (CommonData.roomProxy != null)
			{
				CommonData.roomProxy.leave();
			}
		}
		
		private function STAND_BY(notice:INotice):void
		{
			CommonData.roomProxy.ready();
			
			(this.context as State).manager.switchState(TableState);
		}
	
	}
}
