package com.ourgame.mahjong.bloodriver.table.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.common.vo.UserInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.socket.MJDataPack;
	import com.ourgame.mahjong.bloodriver.message.CReqAct;
	import com.ourgame.mahjong.bloodriver.message.CReqSwap;
	import com.ourgame.mahjong.bloodriver.message.CurrentTileInfo;
	import com.ourgame.mahjong.bloodriver.message.Meld;
	import com.ourgame.mahjong.bloodriver.message.NTFSwapPrepared;
	import com.ourgame.mahjong.bloodriver.message.NtfAct;
	import com.ourgame.mahjong.bloodriver.message.NtfCastDice;
	import com.ourgame.mahjong.bloodriver.message.NtfDeals;
	import com.ourgame.mahjong.bloodriver.message.NtfDiscard;
	import com.ourgame.mahjong.bloodriver.message.NtfDraw;
	import com.ourgame.mahjong.bloodriver.message.NtfGameOver;
	import com.ourgame.mahjong.bloodriver.message.NtfGameResult;
	import com.ourgame.mahjong.bloodriver.message.NtfGameStatus;
	import com.ourgame.mahjong.bloodriver.message.NtfStartGame;
	import com.ourgame.mahjong.bloodriver.message.NtfWin;
	import com.ourgame.mahjong.bloodriver.message.Player;
	import com.ourgame.mahjong.bloodriver.message.SAckSwap;
	import com.ourgame.mahjong.bloodriver.message.NtfDeals.TileAmount;
	import com.ourgame.mahjong.bloodriver.message.NtfGameOver.FinalStatus;
	import com.ourgame.mahjong.bloodriver.message.NtfGameOver.FinalWinInfo;
	import com.ourgame.mahjong.bloodriver.message.NtfGameResult.Detail;
	import com.ourgame.mahjong.bloodriver.message.NtfGameResult.Result;
	import com.ourgame.mahjong.bloodriver.message.NtfWin.WinInfo;
	import com.ourgame.mahjong.bloodriver.protocol.MJBloodRiverProtocol;
	import com.ourgame.mahjong.bloodriver.table.enum.ActionType;
	import com.ourgame.mahjong.bloodriver.table.enum.WinType;
	import com.ourgame.mahjong.bloodriver.table.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.table.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.table.model.TableSocketModel;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.table.vo.Game;
	import com.ourgame.mahjong.bloodriver.table.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultInfo;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultRecord;
	import com.ourgame.mahjong.bloodriver.table.vo.Win;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	import com.wecoit.mvc.managers.NoticeManager;
	
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
		
		private var socket:TableSocketModel;
		
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
			this.register(SocketMethod.RECIVED(TableSocketModel), RECIVED);
			
			this.register(OperateMethod.SWAP, SWAP);
			this.register(OperateMethod.DISCARD, DISCARD);
			this.register(OperateMethod.ACTION, ACTION);
			
			this.socket = this.context.getModel(TableSocketModel) as TableSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
			
			NoticeManager.instance.clearQueue();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function RECIVED(notice:INotice):void
		{
			var data:MJDataPack = notice.params;
			
			switch (data.type)
			{
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_STATUS:
					this.ON_GAME_STATUS(data);
					break;
				
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
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_SHOW_CARD:
					this.ON_SHOW_CARD(data);
					break;
				
				case MJBloodRiverProtocol.SERVER + MJBloodRiverProtocol.OGID_GAME_RESULT:
					this.ON_GAME_RESULT(data);
					break;
			}
		}
		
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
			body.seat = CommonData.user.seat;
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
			body.seat = CommonData.user.seat;
			body.act = action.type;
			body.targetTile = action.card.id;
			body.provider = action.seat;
			body.rootTiles = action.params;
			
			Log.debug("发送动作回复", body);
			
			this.socket.send(MJBloodRiverProtocol.CLIENT + MJBloodRiverProtocol.OGID_ACTION, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function ON_GAME_STATUS(data:MJDataPack):void
		{
			var body:NtfGameStatus = new NtfGameStatus();
			body.mergeFrom(data.body);
			
			Log.debug("收到恢复游戏状态消息", body);
			
			var game:Game  = new Game(body.gameId);
			game.dealer = body.dealer;
			game.score = body.basicScore;
			game.remainCards = 108 - body.frontDrewTiles - body.backDrewTiles;
			game.mahjong.shuffle();
			
			for each (var info:Player in body.players)
			{
				var user:UserInfo = CommonData.table.getUserByID(info.id.low);
				user.seat = info.seat;
				user.chips = info.score;
				
				game.playerList.setElement(info.seat, new GamePlayer(user));
			}
			
			for each (var tileInfo:CurrentTileInfo in body.tileInfos)
			{
				var player:GamePlayer = game.playerList.element(tileInfo.seat);
				
				for each (var meld:Meld in tileInfo.showTiles)
				{
					var group:CardGroup = new CardGroup();
					group.type = meld.meldType;
					
					for each (var groupCard:uint in meld.rootTile)
					{
						game.mahjong.remove(new Card(groupCard));
						group.cards.push(new Card(groupCard));
					}
					
					player.handCards.groups.add(group);
				}
				
				for each (var handCard:uint in tileInfo.inhandTiles)
				{
					if (handCard > 0)
					{
						game.mahjong.remove(new Card(handCard));
					}
					player.handCards.cards.add(new Card(handCard));
				}
				
				for each (var poolCard:uint in tileInfo.discardedTiles)
				{
					game.mahjong.remove(new Card(poolCard));
					player.poolCards.add(new Card(poolCard));
				}
			}
			
			this.notify(GameMethod.GAME_RESTORE, game, this);
		}
		
		private function ON_GAME_START(data:MJDataPack):void
		{
			var body:NtfStartGame = new NtfStartGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏开始消息", body);
			
			var game:Game  = new Game(body.gameId);
			game.dealer = body.dealer;
			game.score = body.basicScore;
			game.remainCards = 108;
			game.mahjong.shuffle();
			
			for each (var info:Player in body.players)
			{
				var user:UserInfo = CommonData.table.getUserByID(info.id.low);
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
			
			cards[CommonData.user.seat] = self;
			
			this.notify(GameMethod.DEAL_CARDS, [body.waitingTime, cards], this);
		}
		
		private function ON_SWAP(data:MJDataPack):void
		{
			var body:NTFSwapPrepared = new NTFSwapPrepared();
			body.mergeFrom(data.body);
			
			Log.debug("收到换出三张牌消息", body);
			
			var cards:Vector.<Card> = new Vector.<Card>();
			
			for each (var card:uint in body.tiles)
			{
				cards.push(new Card(card));
			}
			
			this.notify(GameMethod.SWAP_CARDS_OUT, [body.seat, cards], this);
		}
		
		private function ON_SWAP_RESULT(data:MJDataPack):void
		{
			var body:SAckSwap = new SAckSwap();
			body.mergeFrom(data.body);
			
			Log.debug("收到换入三张牌消息", body);
			
			var cards:Vector.<Card> = new Vector.<Card>();
			
			for each (var card:uint in body.newTiles)
			{
				cards.push(new Card(card));
			}
			
			this.notify(GameMethod.SWAP_CARDS_IN, cards, this);
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
			var draw:Action = new Action(ActionType.GIVEUP, body.seat, card, body.actTime, !body.front);
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
			
			var action:Action = new Action(body.act, body.seat, new Card(body.targetTile), body.actTime, cards);
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
			
			var action:Action = new Action(ActionType.WIN, seat, new Card(body.winTile), body.actTime, win);
			this.notify(GameMethod.WIN, action, this);
		}
		
		private function ON_SHOW_CARD(data:MJDataPack):void
		{
			var body:NtfGameOver = new NtfGameOver();
			body.mergeFrom(data.body);
			
			Log.debug("收到亮牌消息", body);
			
			var results:Vector.<ResultInfo> = new Vector.<ResultInfo>();
			
			for each (var status:FinalStatus in body.finalStatus)
			{
				var info:ResultInfo;
				
				for each (var win:FinalWinInfo in body.finalWinInfos)
				{
					if (win.seat == status.seat)
					{
						info = new ResultInfo(status.status, win.points)
						break;
					}
				}
				
				for each (var id:uint in status.tilesInHand)
				{
					info.hands.push(new Card(id));
				}
				
				results[status.seat] = info;
			}
			
			this.notify(GameMethod.SHOW_CARD, results, this);
		}
		
		private function ON_GAME_RESULT(data:MJDataPack):void
		{
			var body:NtfGameResult = new NtfGameResult();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏结算消息", body);
			
			var results:Vector.<int> = new Vector.<int>();
			
			for each (var result:Result in body.results)
			{
				results[result.seat] = result.winPoints;
			}
			
			var records:Vector.<ResultRecord> = new Vector.<ResultRecord>();
			
			for each (var detail:Detail in body.details)
			{
				var record:ResultRecord = new ResultRecord(detail.type, detail.seat, detail.points, new Card(detail.tile));
				records.push(record);
			}
			
			this.notify(GameMethod.RESULT, [results, records], this);
		}
	
	}
}
