package com.ourgame.mahjong.bloodriver.table.data
{
	import com.ourgame.mahjong.bloodriver.table.vo.Game;
	import com.ourgame.mahjong.bloodriver.table.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultRecord;
	
	/**
	 * 游戏数据
	 * @author SiaoLeon
	 */
	public class GameData
	{
		public static var currentPlayer:GamePlayer;
		
		public static var currentGame:Game;
		
		public static var records:Vector.<ResultRecord>;
	
	}
}
