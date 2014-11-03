package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.model.TableModel;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.data.CommonData;
	import com.ourgame.mahjong.libaray.enum.PlayMode;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 连接控制器
	 * @author SiaoLeon
	 */
	public class ConnectController extends Controller
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
		public function ConnectController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(TableMethod.CONNECT, CONNECT);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function CONNECT(notice:INotice):void
		{
			if (CommonData.playMode == PlayMode.CONSOLE)
			{
				(this.context as State).manager.switchState(TableState);
				return;
			}
			
			(this.context.getModel(TableModel) as TableModel).connect();
		}
	
	}
}
