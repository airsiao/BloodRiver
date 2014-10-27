package com.ourgame.mahjong.bloodriver.data
{
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.ourgame.mahjong.bloodriver.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.vo.ResultRecord;
	
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
