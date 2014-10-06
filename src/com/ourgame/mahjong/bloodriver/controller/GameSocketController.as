package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.model.MainSocketModel;
	import com.ourgame.mahjong.bloodriver.protoc.message.CReqEnterGame;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfStartGame;
	import com.ourgame.mahjong.bloodriver.protoc.message.SAckEnterGame;
	import com.ourgame.mahjong.bloodriver.protoc.protocol.MJBloodRiverProtocol;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.vo.socket.MJDataPack;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 游戏Socket控制器
	 * @author SiaoLeon
	 */
	public class GameSocketController extends Controller
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var data:DataExchange;
		
		private var socket:MainSocketModel;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameSocketController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(SocketMethod.RECIVED(MainSocketModel), RECIVED);
			
			this.register(GameMethod.GAME_ENTER, GAME_ENTER);
			
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			this.socket = this.context.getModel(MainSocketModel) as MainSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		public function GAME_ENTER(notice:INotice):void
		{
			var body:CReqEnterGame = new CReqEnterGame();
			body.gameId = this.data.gameID;
			
			Log.debug("发送进入游戏请求", body);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_GAME_ENTER, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function RECIVED(notice:INotice):void
		{
			var data:MJDataPack = notice.params;
			
			switch (data.type)
			{
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_ENTER:
					this.ON_GAME_ENTER(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_START:
					this.ON_GAME_START(data);
					break;
			}
		}
		
		private function ON_GAME_ENTER(data:MJDataPack):void
		{
			var body:SAckEnterGame = new SAckEnterGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到进入游戏结果", body);
		}
		
		private function ON_GAME_START(data:MJDataPack):void
		{
			var body:NtfStartGame = new NtfStartGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏开始", body);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
