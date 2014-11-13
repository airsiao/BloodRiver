package com.ourgame.mahjong.bloodriver.common.data
{
	import com.netease.protobuf.UInt64;
	import com.ourgame.mahjong.bloodriver.common.vo.IRoomProxy;
	import com.ourgame.mahjong.bloodriver.common.vo.ISocketProxy;
	import com.ourgame.mahjong.bloodriver.common.vo.ITableProxy;
	import com.ourgame.mahjong.bloodriver.common.vo.RoomInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.TableInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.UserInfo;
	import com.wecoit.data.ArrayList;
	
	import flash.system.ApplicationDomain;
	
	/**
	 * 公共数据
	 * @author SiaoLeon
	 */
	public class CommonData
	{
		
		/**
		 * 基础路径
		 * @default
		 */
		public static function get basePath():String
		{
			return (dataPorxy == null) ? "" : dataPorxy["currentGamePath"];
		}
		
		/**
		 * 基础域
		 * @default
		 */
		public static var baseDomain:ApplicationDomain;
		
		/**
		 * 联众ID
		 * @default
		 */
		public static var ourgameID:String;
		
		/**
		 * 用户名
		 * @default
		 */
		public static var username:String;
		
		/**
		 * 角色名
		 * @default
		 */
		public static var rolename:String;
		
		/**
		 * 昵称
		 * @default
		 */
		public static var nickname:String;
		
		/**
		 * 证书（长）
		 * @default
		 */
		public static var ticket:String;
		
		/**
		 * 渠道号
		 * @default
		 */
		public static var channelID:uint;
		
		/**
		 * 游戏模式，参见PlayMode定义
		 * @default
		 */
		public static var playMode:uint;
		
		/**
		 * 房间列表
		 * @default
		 */
		public static var roomList:ArrayList;
		
		/**
		 * 当前房间
		 * @default
		 */
		public static var room:RoomInfo;
		
		/**
		 * 当前桌子
		 * @default
		 */
		public static var table:TableInfo;
		
		/**
		 * 游戏ID
		 * @default
		 */
		public static var gameID:UInt64;
		
		/**
		 * 游戏服务ID
		 * @default
		 */
		public static var serverID:UInt64;
		
		/**
		 * 当前用户信息
		 * @default
		 */
		public static var user:UserInfo;
		
		/**
		 * 数据代理器
		 * @default
		 */
		public static var dataPorxy:Object;
		
		/**
		 * Socket代理器
		 * @default
		 */
		public static var socketProxy:ISocketProxy;
		
		/**
		 * 房间代理器
		 * @default
		 */
		public static var roomProxy:IRoomProxy;
		
		/**
		 * 桌子代理器
		 * @default
		 */
		public static var tableProxy:ITableProxy;
		
		/**
		 * 根据ID获取房间
		 * @param id
		 * @return
		 */
		public static function getRoomByID(id:uint):RoomInfo
		{
			for (var i:int = 0; i < roomList.length; i++)
			{
				var room:RoomInfo = roomList.element(i);
				
				if (room.id == id)
				{
					return room;
				}
			}
			
			return null;
		}
	
	}
}
