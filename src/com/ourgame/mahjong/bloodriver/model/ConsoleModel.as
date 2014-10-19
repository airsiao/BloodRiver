package com.ourgame.mahjong.bloodriver.model
{
	import com.netease.protobuf.UInt64;
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.vo.Mahjong;
	import com.ourgame.mahjong.bloodriver.vo.Robot;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.vo.TableInfo;
	import com.wecoit.mvc.Model;
	import com.wecoit.mvc.State;
	
	/**
	 * 单机数据模型
	 * @author SiaoLeon
	 */
	public class ConsoleModel extends Model
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var mahjong:Mahjong;
		
		private var game:Game;
		
		private var data:DataExchange;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ConsoleModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.mahjong = new Mahjong();
			
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			this.data.user.seat = 0;
			this.data.table = new TableInfo();
			this.data.table.userList.add(this.data.user);
		}
		
		override public function onRemove():void
		{
			this.mahjong = null;
			this.game = null;
		}
		
		public function start():void
		{
			this.game = new Game(new UInt64());
			this.game.playerList.add(new GamePlayer(null));
			this.game.playerList.add(new Robot());
			this.game.playerList.add(new Robot());
			this.game.playerList.add(new Robot());
			
			this.notify(GameMethod.GAME_START, game, this);
			
			this.dealDice();
			this.deal();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function dealDice():void
		{
			var dice:uint = Math.floor(Math.random() * 6) + 1;
			
			this.notify(GameMethod.DEAL_DICE, dice, this);
		}
		
		private function deal():void
		{
			for (var i:int = 0; i < this.game.playerList.length; i++)
			{
				var player:GamePlayer = this.game.playerList.element(i);
				var count:int = (i == this.game.dealer) ? 14 : 13;
				
				while (player.handCards.cards.list.length < count)
				{
					player.handCards.cards.add(this.mahjong.deal());
				}
			}
			
			this.notify(GameMethod.DEAL_CARDS, null, this);
		}
	
	}
}
