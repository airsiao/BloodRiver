package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.ResultPanel;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.vo.ResultInfo;
	import com.ourgame.mahjong.bloodriver.vo.ResultRecord;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.events.Event;
	
	/**
	 * 结算视图
	 * @author SiaoLeon
	 */
	public class ResultView extends View
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
		public function ResultView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function play(notice:INotice):void
		{
			var results:Vector.<ResultInfo> = notice.params[0];
			var records:Vector.<ResultRecord> = notice.params[1];
			var panel:ResultPanel;
			
			for (var i:int = 0; i < results.length; i++)
			{
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				var hand:TilesHand = null;
				
				switch ((this.module as BloodRiver).info.data.table.getSeatPosition(player.user.seat))
				{
					case Position.CURRENT:
						hand = (this.context as GameState).tiles.handCurrent;
						break;
					case Position.NEXT:
						hand = (this.context as GameState).tiles.handNext;
						break;
					case Position.OPPOSITE:
						hand = (this.context as GameState).tiles.handOpposite;
						break;
					case Position.PREV:
						hand = (this.context as GameState).tiles.handPrev;
						break;
				}
				
				hand.init(player.handCards);
				hand.status = CardStatus.SHOW;
				
				if (player == GameData.currentPlayer)
				{
					panel = new ResultPanel(results[i], records);
				}
			}
			
			panel.addEventListener("continue", onContinue, false, 0, true);
			LayerManager.instance.pop.addChild(panel);
			
			notice.complete();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onContinue(event:Event):void
		{
			this.notify(TableMethod.READY);
		}
	
	}
}
