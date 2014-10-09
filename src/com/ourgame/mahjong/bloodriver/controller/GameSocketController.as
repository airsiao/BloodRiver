package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.model.MainSocketModel;
	import com.ourgame.mahjong.bloodriver.protoc.message.CReqSwap;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfAct;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfCastDice;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDraw;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfStartGame;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfWin;
	import com.ourgame.mahjong.bloodriver.protoc.message.Player;
	import com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount;
	import com.ourgame.mahjong.bloodriver.protoc.protocol.MJBloodRiverProtocol;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
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
			
			this.register(GameMethod.CONFIRM_SWAP, CHANGE_CARDS_OUT);
			
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			this.socket = this.context.getModel(MainSocketModel) as MainSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		private function CHANGE_CARDS_OUT(notice:INotice):void
		{
			var body:CReqSwap = new CReqSwap();
			
			var cards:Vector.<Card> = notice.params;
			
			for each (var card:Card in cards)
			{
				body.tiles.push(card.id);
			}
			
			Log.debug("发送换牌请求", body);
			Log.debug("换出三张牌", cards);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_SWAP, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function RECIVED(notice:INotice):void
		{
			var data:MJDataPack = notice.params;
			
			switch (data.type)
			{
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_START:
					this.ON_GAME_START(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_DICE:
					this.ON_DICE(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_DEAL:
					this.ON_DEAL(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_SWAP:
					this.ON_SWAP(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_DISCARD:
					this.ON_DISCARD(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_DRAW:
					this.ON_DRAW(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_ACTION:
					this.ON_ACTION(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_PLAYER_WIN:
					this.ON_PLAYER_WIN(data);
					break;
			}
		}
		
		private function ON_GAME_START(data:MJDataPack):void
		{
			var body:NtfStartGame = new NtfStartGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏开始消息", body);
			
			GameData.game = new Game(body.gameId);
			GameData.game.dealer = body.dealer;
			GameData.game.score = body.basicScore;
			
			for each (var info:Player in body.players)
			{
				var user:UserInfo = this.data.table.getUserByID(info.id.low);
				var player:GamePlayer = new GamePlayer(user);
				user.seat = info.seat;
				user.chips = info.score;
				
				GameData.game.playerList.setElement(info.seat, player);
			}
			
			this.notify(GameMethod.GAME_START);
		}
		
		private function ON_DICE(data:MJDataPack):void
		{
			var body:NtfCastDice = new NtfCastDice();
			body.mergeFrom(data.body);
			
			Log.debug("收到骰子消息", body);
			
			switch (body.type)
			{
				case 1:
					GameData.game.dealDice = body.points;
					this.notify(GameMethod.DEAL_DICE);
					break;
				case 2:
					GameData.game.swapDice = body.points;
					this.notify(GameMethod.SWAP_DICE);
					break;
			}
		}
		
		private function ON_DEAL(data:MJDataPack):void
		{
			var body:NtfDeals = new NtfDeals();
			body.mergeFrom(data.body);
			
			Log.debug("收到开门发牌消息", body);
			
			var self:GamePlayer = GameData.game.playerList.element(this.data.user.seat);
			
			for each (var cardID:uint in body.tiles)
			{
				var card:Card = new Card(cardID);
				self.handCards.cards.add(card);
			}
			
			Log.debug("手牌", self.handCards.cards);
			
			for each (var info:TileAmount in body.amouts)
			{
				if (info.seat == self.user.seat)
				{
					continue;
				}
				
				var player:GamePlayer = GameData.game.playerList.element(info.seat);
				
				for (var i:int = 0; i < info.amount; i++)
				{
					player.handCards.cards.add(new Card(0));
				}
			}
			
			this.notify(GameMethod.DEAL_CARDS);
			this.notify(GameMethod.SELECT_SWAP);
		}
		
		private function ON_SWAP(data:MJDataPack):void
		{
			var body:SAckSwap = new SAckSwap();
			body.mergeFrom(data.body);
			
			Log.debug("收到换三张牌消息", body);
			
			var player:GamePlayer = GameData.game.playerList.element(this.data.user.seat);
			var cards:Vector.<Card> = new Vector.<Card>();
			
			for each (var oldCard:uint in body.oldTiles)
			{
				player.handCards.cards.remove(player.handCards.cards.getCardByID(oldCard));
			}
			
			for each (var newCard:uint in body.newTiles)
			{
				var card:Card = new Card(newCard);
				cards.push(card);
				player.handCards.cards.add(card);
			}
			
			Log.debug("换入三张牌", cards);
			Log.debug("手牌", player.handCards.cards);
			
			this.notify(GameMethod.SWAP_CARDS, cards);
		}
		
		private function ON_DISCARD(data:MJDataPack):void
		{
			var body:NtfDiscard = new NtfDiscard();
			body.mergeFrom(data.body);
			
			Log.debug("收到有人打牌消息", body);
			
			var player:GamePlayer = GameData.game.playerList.element(body.seat);
			var card:Card = player.handCards.cards.getCardByID(body.tile);
			card = (card == null) ? new Card(body.tile) : card;
			player.handCards.cards.remove(card);
			
			Log.debug("打牌", card);
			
			var action:Action = new Action(body.seat, card, !body.front);
			
			this.notify(GameMethod.DISCARD, action);
		}
		
		private function ON_DRAW(data:MJDataPack):void
		{
			var body:NtfDraw = new NtfDraw();
			body.mergeFrom(data.body);
			
			Log.debug("收到有人抓牌消息", body);
			
			var player:GamePlayer = GameData.game.playerList.element(body.seat);
			var card:Card = new Card(body.tileId);
			player.handCards.cards.add(card);
			
			Log.debug("抓牌", card);
			
			var action:Action = new Action(body.seat, card, !body.front);
			
			this.notify(GameMethod.DRAW, action);
		}
		
		private function ON_ACTION(data:MJDataPack):void
		{
			var body:NtfAct = new NtfAct();
			body.mergeFrom(data.body);
			
			Log.debug("收到动作消息", body);
		}
		
		private function ON_PLAYER_WIN(data:MJDataPack):void
		{
			var body:NtfWin = new NtfWin();
			body.mergeFrom(data.body);
			
			Log.debug("收到玩家胡牌消息", body);
		}
	
	}
}
