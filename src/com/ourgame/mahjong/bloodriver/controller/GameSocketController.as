package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.enum.ActionType;
	import com.ourgame.mahjong.bloodriver.enum.WinType;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.model.MainSocketModel;
	import com.ourgame.mahjong.bloodriver.protoc.message.CReqAct;
	import com.ourgame.mahjong.bloodriver.protoc.message.CReqSwap;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfAct;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfCastDice;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDraw;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfGameResult;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfStartGame;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfWin;
	import com.ourgame.mahjong.bloodriver.protoc.message.Player;
	import com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo;
	import com.ourgame.mahjong.bloodriver.protoc.protocol.MJBloodRiverProtocol;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.vo.Win;
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
			
			this.register(OperateMethod.SWAP, SWAP);
			this.register(OperateMethod.DISCARD, DISCARD);
			this.register(OperateMethod.ACTION, ACTION);
			
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			this.socket = this.context.getModel(MainSocketModel) as MainSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		private function SWAP(notice:INotice):void
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
		
		private function DISCARD(notice:INotice):void
		{
			var card:Card = notice.params;
			
			var body:CReqAct = new CReqAct();
			body.seat = this.data.user.seat;
			body.act = ActionType.DISCARD;
			body.targetTile = card.id;
			
			Log.debug("发送打牌请求", body);
			Log.debug("打出", card);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_ACTION, body);
		}
		
		private function ACTION(notice:INotice):void
		{
			var action:Action = notice.params;
			
			var body:CReqAct = new CReqAct();
			body.seat = this.data.user.seat;
			body.act = action.type;
			body.targetTile = action.card.id;
			body.provider = action.seat;
			body.rootTiles = action.params;
			
			Log.debug("发送动作回复", body);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_ACTION, body);
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
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_SWAP_RESULT:
					this.ON_SWAP_RESULT(data);
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
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_RESULT:
					this.ON_GAME_RESULT(data);
					break;
			}
		}
		
		private function ON_GAME_START(data:MJDataPack):void
		{
			var body:NtfStartGame = new NtfStartGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏开始消息", body);
			
			var game:Game  = new Game(body.gameId);
			game.dealer = body.dealer;
			game.score = body.basicScore;
			
			for each (var info:Player in body.players)
			{
				var user:UserInfo = this.data.table.getUserByID(info.id.low);
				var player:GamePlayer = new GamePlayer(user);
				user.seat = info.seat;
				user.chips = info.score;
				
				game.playerList.setElement(info.seat, player);
			}
			
			this.notify(GameMethod.GAME_START, game, this);
		}
		
		private function ON_DICE(data:MJDataPack):void
		{
			var body:NtfCastDice = new NtfCastDice();
			body.mergeFrom(data.body);
			
			Log.debug("收到骰子消息", body);
			
			switch (body.type)
			{
				case 1:
					this.notify(GameMethod.DEAL_DICE, body.points, this);
					break;
				case 2:
					this.notify(GameMethod.SWAP_DICE, body.points, this);
					break;
			}
		}
		
		private function ON_DEAL(data:MJDataPack):void
		{
			var body:NtfDeals = new NtfDeals();
			body.mergeFrom(data.body);
			
			Log.debug("收到开门发牌消息", body);
			
			var cards:Array = new Array();
			
			for each (var info:TileAmount in body.amouts)
			{
				var list:Vector.<Card> = new Vector.<Card>();
				
				for (var i:int = 0; i < info.amount; i++)
				{
					list.push(new Card(0));
				}
				
				cards[info.seat] = list;
			}
			
			var self:Vector.<Card> = new Vector.<Card>();
			
			for each (var cardID:uint in body.tiles)
			{
				self.push(new Card(cardID));
			}
			
			cards[this.data.user.seat] = self;
			
			this.notify(GameMethod.DEAL_CARDS, cards, this);
		}
		
		private function ON_SWAP_RESULT(data:MJDataPack):void
		{
			var body:SAckSwap = new SAckSwap();
			body.mergeFrom(data.body);
			
			Log.debug("收到换三张牌消息", body);
			
			var outCards:Vector.<Card> = new Vector.<Card>();
			
			for each (var outCard:uint in body.oldTiles)
			{
				outCards.push(new Card(outCard));
			}
			
			this.notify(GameMethod.SWAP_CARDS_OUT, outCards, this);
			
			var inCards:Vector.<Card> = new Vector.<Card>();
			
			for each (var inCard:uint in body.newTiles)
			{
				inCards.push(new Card(inCard));
			}
			
			this.notify(GameMethod.SWAP_CARDS_IN, inCards, this);
		}
		
		private function ON_DISCARD(data:MJDataPack):void
		{
			var body:NtfDiscard = new NtfDiscard();
			body.mergeFrom(data.body);
			
			Log.debug("收到有人打牌消息", body);
			
			var card:Card = new Card(body.tile)
			var discard:Action = new Action(ActionType.DISCARD, body.seat, card);
			this.notify(GameMethod.DISCARD, discard, this);
			
			if (body.action > 0)
			{
				var request:Action = new Action(body.action, body.seat, card);
				this.notify(GameMethod.REQUEST, request, this);
			}
		}
		
		private function ON_DRAW(data:MJDataPack):void
		{
			var body:NtfDraw = new NtfDraw();
			body.mergeFrom(data.body);
			
			Log.debug("收到有人抓牌消息", body);
			
			var card:Card = new Card(body.tileId)
			var draw:Action = new Action(ActionType.GIVEUP, body.seat, card, !body.front);
			this.notify(GameMethod.DRAW, draw, this);
			
			if (body.action > 0)
			{
				var request:Action = new Action(body.action, body.seat, card);
				this.notify(GameMethod.REQUEST, request, this);
			}
		}
		
		private function ON_ACTION(data:MJDataPack):void
		{
			var body:NtfAct = new NtfAct();
			body.mergeFrom(data.body);
			
			Log.debug("收到动作消息", body);
			
			if (body.rootTiles.indexOf(body.targetTile) < 0)
			{
				body.rootTiles.push(body.targetTile);
			}
			
			var cards:Vector.<Card> = new Vector.<Card>();
			
			for each (var id:uint in body.rootTiles)
			{
				if (body.provider != body.seat && id == body.targetTile)
				{
					continue;
				}
				
				cards.push(new Card(id));
			}
			
			var action:Action = new Action(body.act, body.seat, new Card(body.targetTile), cards);
			this.notify(GameMethod.ACTION, action, this);
			
			if (body.action > 0)
			{
				var request:Action = new Action(body.action, body.seat, new Card(body.targetTile));
				this.notify(GameMethod.REQUEST, request, this);
			}
		}
		
		private function ON_PLAYER_WIN(data:MJDataPack):void
		{
			var body:NtfWin = new NtfWin();
			body.mergeFrom(data.body);
			
			Log.debug("收到玩家胡牌消息", body);
			
			var win:Win = new Win(body.winType);
			var seat:uint;
			
			for each (var info:WinInfo in body.winInfos)
			{
				if (body.winType == WinType.SELF)
				{
					//自摸
					win.fan[info.winnerSeat] = win.fan[info.winnerSeat] + info.fan;
					win.fan[info.loserSeat] = info.fan * -1;
					seat = info.winnerSeat;
				}
				else
				{
					win.fan[info.loserSeat] = win.fan[info.loserSeat] - info.fan;
					win.fan[info.winnerSeat] = info.fan;
					seat = info.loserSeat;
				}
			}
			
			var action:Action = new Action(ActionType.WIN, seat, new Card(body.winTile), win);
			this.notify(GameMethod.WIN, action, this);
		}
		
		private function ON_GAME_RESULT(data:MJDataPack):void
		{
			var body:NtfGameResult = new NtfGameResult();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏结算消息", body);
			
			this.notify(GameMethod.RESULT);
		}
	
	}
}
