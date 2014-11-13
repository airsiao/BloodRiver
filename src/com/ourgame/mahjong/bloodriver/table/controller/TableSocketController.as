package com.ourgame.mahjong.bloodriver.table.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.common.vo.socket.MJDataPack;
	import com.ourgame.mahjong.bloodriver.message.CReqEnterGame;
	import com.ourgame.mahjong.bloodriver.message.SAckEnterGame;
	import com.ourgame.mahjong.bloodriver.protocol.MJBloodRiverProtocol;
	import com.ourgame.mahjong.bloodriver.table.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.table.model.TableSocketModel;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 桌子Socket控制器
	 * @author SiaoLeon
	 */
	public class TableSocketController extends Controller
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var socket:TableSocketModel;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableSocketController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(SocketMethod.RECIVED(TableSocketModel), RECIVED);
			
			this.register(TableMethod.GAME_ENTER, GAME_ENTER);
			
			this.socket = this.context.getModel(TableSocketModel) as TableSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function RECIVED(notice:INotice):void
		{
			var data:MJDataPack = notice.params;
			
			switch (data.type)
			{
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_ENTER:
					this.ON_GAME_ENTER(data);
					break;
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		private function GAME_ENTER(notice:INotice):void
		{
			var body:CReqEnterGame = new CReqEnterGame();
			body.gameId = CommonData.gameID;
			
			Log.debug("发送进入游戏请求", body);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_GAME_ENTER, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function ON_GAME_ENTER(data:MJDataPack):void
		{
			var body:SAckEnterGame = new SAckEnterGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到进入游戏结果", body);
			
			(this.context as State).manager.switchState(GameState);
		}
	
	}
}
