package com.ourgame.mahjong.bloodriver.lobby.model
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.enum.RoomType;
	import com.ourgame.mahjong.bloodriver.common.vo.IRoomProxy;
	import com.ourgame.mahjong.bloodriver.lobby.method.RoomMethod;
	import com.wecoit.mvc.Model;
	
	/**
	 * 房间数据模型
	 * @author SiaoLeon
	 */
	public class RoomModel extends Model implements IRoomProxy
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
		public function RoomModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			CommonData.roomProxy = this;
		}
		
		override public function onRemove():void
		{
			CommonData.roomProxy = null;
		}
		
		public function ready():void
		{
			this.notify(RoomMethod.STAND_BY);
		}
		
		public function leave():void
		{
			if (CommonData.room.type == RoomType.AUTO)
			{
				this.notify(RoomMethod.LEAVE_ROOM);
			}
			else
			{
				this.notify(RoomMethod.LEAVE_TABLE);
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
