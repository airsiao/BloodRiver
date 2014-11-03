package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.ActionType;
	import com.ourgame.mahjong.bloodriver.enum.CardGroupType;
	import com.ourgame.mahjong.bloodriver.enum.WinType;
	import com.ourgame.mahjong.bloodriver.method.GameMethod;
	import com.ourgame.mahjong.bloodriver.method.OperateMethod;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.state.SelectSwapState;
	import com.ourgame.mahjong.bloodriver.utils.compareCardByID;
	import com.ourgame.mahjong.bloodriver.vo.Action;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.CardGroup;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.vo.ResultInfo;
	import com.ourgame.mahjong.bloodriver.vo.ResultRecord;
	import com.ourgame.mahjong.bloodriver.vo.Win;
	import com.ourgame.mahjong.libaray.data.CommonData;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 游戏控制器
	 * @author SiaoLeon
	 */
	public class GameController extends Controller
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
		public function GameController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(OperateMethod.SWAP, SWAP);
			
			this.register(GameMethod.GAME_START, GAME_START);
			this.register(GameMethod.DEAL_DICE, DEAL_DICE);
			this.register(GameMethod.SWAP_DICE, SWAP_DICE);
			this.register(GameMethod.DEAL_CARDS, DEAL_CARDS);
			this.register(GameMethod.SELECT_SWAP, SELECT_SWAP);
			this.register(GameMethod.SWAP_CARDS_OUT, SWAP_CARDS_OUT);
			this.register(GameMethod.SWAP_CARDS_IN, SWAP_CARDS_IN);
			
			this.register(GameMethod.DRAW, DRAW);
			this.register(GameMethod.DISCARD, DISCARD);
			this.register(GameMethod.REQUEST, REQUEST);
			this.register(GameMethod.ACTION, ACTION);
			this.register(GameMethod.WIN, WIN);
			this.register(GameMethod.OVER, OVER);
			this.register(GameMethod.RESULT, RESULT);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function SWAP(notice:INotice):void
		{
			(this.context as GameState).manager.switchState(GameState);
			
			notice.complete();
		}
		
		private function GAME_START(notice:INotice):void
		{
			GameData.currentGame = notice.params;
			GameData.currentPlayer = GameData.currentGame.playerList.element(CommonData.user.seat);
			GameData.records = new Vector.<ResultRecord>();
			
			(this.context as GameState).shuffle.play(notice);
		}
		
		private function DEAL_DICE(notice:INotice):void
		{
			GameData.currentGame.dealDice = notice.params;
			
			(this.context as GameState).dice.deal(notice);
		}
		
		private function SWAP_DICE(notice:INotice):void
		{
			GameData.currentGame.swapDice = notice.params;
			
			(this.context as GameState).dice.swap(notice);
		}
		
		private function DEAL_CARDS(notice:INotice):void
		{
			GameData.currentGame.swapTime = notice.params[0];
			
			var cards:Array = notice.params[1];
			
			for (var i:int = 0; i < cards.length; i++)
			{
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				var list:Vector.<Card> = cards[i];
				
				for each (var card:Card in list)
				{
					player.handCards.cards.add(card);
					GameData.currentGame.mahjong.remove(card);
				}
				
				Log.debug("手牌", player.user.seat, player.user.nickname, player.handCards);
			}
			
			(this.context as GameState).dealCards.play(notice);
		}
		
		private function SELECT_SWAP(notice:INotice):void
		{
			(this.context as GameState).manager.switchState(SelectSwapState);
			
			notice.complete();
		}
		
		private function SWAP_CARDS_OUT(notice:INotice):void
		{
			var seat:uint = notice.params[0];
			var cards:Vector.<Card> = notice.params[1];
			var player:GamePlayer = GameData.currentGame.playerList.element(seat);
			
			for each (var info:Card in cards)
			{
				var card:Card = player.handCards.cards.getCardByID(info.id);
				
				if (card == null)
				{
					card = player.handCards.cards.list.pop();
					card.id = info.id;
				}
				else
				{
					player.handCards.cards.remove(card);
					
					if (player == GameData.currentPlayer)
					{
						GameData.currentGame.swapOut.push(card);
						GameData.currentGame.mahjong.add(card);
					}
				}
			}
			
			if (player == GameData.currentPlayer)
			{
				(this.context as GameState).manager.switchState(GameState);
			}
			
			Log.debug("换出三张牌", player.user.nickname, cards);
			
			(this.context as GameState).swapCards.outCards(notice);
		}
		
		private function SWAP_CARDS_IN(notice:INotice):void
		{
			(this.context as GameState).manager.switchState(GameState);
			
			for (var i:int = 0; i < GameData.currentGame.playerList.length; i++)
			{
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				player.handCards.cards.list.sort(compareCardByID);
				
				for each (var info:Card in notice.params)
				{
					if (player == GameData.currentPlayer)
					{
						GameData.currentPlayer.handCards.cards.add(info);
						GameData.currentGame.swapIn.push(info);
						GameData.currentGame.mahjong.remove(info);
					}
					else
					{
						player.handCards.cards.add(new Card());
					}
				}
			}
			
			Log.debug("换入三张牌", GameData.currentGame.swapIn);
			
			(this.context as GameState).swapCards.inCards(notice);
			(this.context as GameState).dice.hide();
			
			this.notify(GameMethod.FLOWER_PIG, !GameData.currentPlayer.handCards.isLack);
		}
		
		private function DRAW(notice:INotice):void
		{
			var action:Action = notice.params;
			var player:GamePlayer = GameData.currentGame.playerList.element(action.seat);
			player.handCards.cards.add(action.card);
			
			Log.debug("抓牌", player.user.nickname, action.card);
			Log.debug("手牌", player.handCards);
			
			GameData.currentGame.remainCards--;
			GameData.currentGame.mahjong.remove(action.card);
			
			(this.context as GameState).request.hide();
			(this.context as GameState).draw.play(notice);
		}
		
		private function DISCARD(notice:INotice):void
		{
			(this.context as GameState).tiles.handCurrent.enable = false;
			
			var action:Action = notice.params;
			var player:GamePlayer = GameData.currentGame.playerList.element(action.seat);
			var card:Card = player.handCards.cards.getCardByID(action.card.id);
			
			if (card == null)
			{
				card = player.handCards.cards.list.pop();
				card.id = action.card.id;
			}
			else
			{
				player.handCards.cards.remove(card);
			}
			
			GameData.currentGame.mahjong.remove(action.card);
			
			Log.debug("打牌", player.user.nickname, card);
			Log.debug("手牌", player.handCards);
			
			(this.context as GameState).request.hide();
			(this.context as GameState).discard.play(notice);
			
			this.notify(GameMethod.FLOWER_PIG, !GameData.currentPlayer.handCards.isLack);
		}
		
		private function REQUEST(notice:INotice):void
		{
			(this.context as GameState).request.show(notice);
		}
		
		private function ACTION(notice:INotice):void
		{
			(this.context as GameState).tiles.handCurrent.enable = false;
			
			var action:Action = notice.params;
			var player:GamePlayer = GameData.currentGame.playerList.element(action.seat);
			var group:CardGroup = new CardGroup();
			
			if (action.type == ActionType.GANG_BU)
			{
				var groups:Vector.<CardGroup> = player.handCards.groups.getGroupsByColor(action.card.color);
				
				for each (var g:CardGroup in groups)
				{
					if (g.point == action.card.point)
					{
						group = g;
						break;
					}
				}
				
				group.type = CardGroupType.GANG_BU;
				group.cards.push(action.card);
				
				var bu:Card =  player.handCards.cards.getCardByID(action.card.id);
				
				if (bu == null)
				{
					bu = player.handCards.cards.getCardByID(0);
					bu.id = action.card.id;
				}
				
				player.handCards.cards.remove(bu);
			}
			else
			{
				switch (action.type)
				{
					case ActionType.CHI:
						group.type = CardGroupType.SHUN;
						break;
					case ActionType.PENG:
						group.type = CardGroupType.KE;
						break;
					case ActionType.GANG:
						group.type = CardGroupType.GANG_MING;
						break;
					case ActionType.GANG_AN:
						group.type = CardGroupType.GANG_AN;
						break;
				}
				
				group.cards.push(action.card);
				
				for each (var info:Card in action.params)
				{
					var card:Card =  player.handCards.cards.getCardByID(info.id);
					
					if (card == null)
					{
						card = player.handCards.cards.getCardByID(0);
						card.id = info.id;
					}
					
					player.handCards.cards.remove(card);
					
					if (info.id != action.card.id)
					{
						group.cards.push(card);
					}
				}
				
				player.handCards.groups.add(group);
			}
			
			Log.debug("手牌", player.handCards);
			
			(this.context as GameState).request.hide();
			(this.context as GameState).action.play(notice);
		}
		
		private function WIN(notice:INotice):void
		{
			(this.context as GameState).tiles.handCurrent.enable = false;
			
			var action:Action = notice.params;
			var win:Win = action.params;
			
			if (win.type == WinType.SELF)
			{
				var winner:GamePlayer = GameData.currentGame.playerList.element(action.seat);
				var card:Card = winner.handCards.cards.getCardByID(action.card.id);
				
				if (card == null)
				{
					card = winner.handCards.cards.list.pop();
					card.id = action.card.id;
				}
				else
				{
					winner.handCards.cards.remove(card);
				}
				
				GameData.currentGame.mahjong.remove(action.card);
			}
			
			if (win.type == WinType.GANG || win.type == WinType.GANG_MULTI)
			{
				for (var i:int = 0; i < win.fan.length; i++)
				{
					if (win.fan[i] >= 0)
					{
						continue;
					}
					
					var loser:GamePlayer = GameData.currentGame.playerList.element(i);
					
					for each (var group:CardGroup in loser.handCards.groups.list)
					{
						if (group.color != action.card.color || group.point != action.card.point)
						{
							continue;
						}
						
						for each (var qiang:Card in group.cards)
						{
							if (qiang.id == action.card.id)
							{
								group.type == CardGroupType.KE;
								group.cards.splice(group.cards.indexOf(qiang), 1);
								break;
							}
						}
					}
				}
			}
			
			for (var seat:int = 0; seat < win.fan.length; seat++)
			{
				var player:GamePlayer = GameData.currentGame.playerList.element(seat) as GamePlayer;
				Log.debug("胡牌", player.user.nickname, win.fan[seat], player.handCards);
			}
			
			(this.context as GameState).win.play(notice);
		}
		
		private function OVER(notice:INotice):void
		{
			var results:Vector.<ResultInfo> = notice.params;
			
			for (var i:int = 0; i < results.length; i++)
			{
				var result:ResultInfo = results[i];
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				player.handCards.cards.list.splice(0, player.handCards.cards.list.length);
				
				for each (var card:Card in result.hands)
				{
					player.handCards.cards.add(card);
				}
			}
			
			(this.context as GameState).show.play(notice);
		}
		
		private function RESULT(notice:INotice):void
		{
			(this.context as GameState).result.play(notice);
		}
	}
}
