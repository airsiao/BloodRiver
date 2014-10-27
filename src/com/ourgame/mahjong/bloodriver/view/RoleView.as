package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.ui.Char;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
	import com.wecoit.data.ArrayList;
	import com.wecoit.events.ValueEvent;
	import com.wecoit.mvc.View;
	
	/**
	 * 角色视图
	 * @author SiaoLeon
	 */
	public class RoleView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var charCurrent:Char;
		
		public var charNext:Char;
		
		public var charOpposite:Char;
		
		public var charPrev:Char;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function RoleView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.charCurrent = new Char(Position.CURRENT);
			LayerManager.instance.role.addChild(this.charCurrent);
			
			this.charNext = new Char(Position.NEXT);
			LayerManager.instance.role.addChild(this.charNext);
			
			this.charOpposite = new Char(Position.OPPOSITE);
			LayerManager.instance.role.addChild(this.charOpposite);
			
			this.charPrev = new Char(Position.PREV);
			LayerManager.instance.role.addChild(this.charPrev);
			
			(this.module as BloodRiver).info.data.table.userList.addEventListener(ValueEvent.CHANGE, updateUsers);
			
			this.updateUsers();
		}
		
		override public function onRemove():void
		{
			LayerManager.instance.role.removeChild(this.charPrev);
			this.charPrev = null;
			
			LayerManager.instance.role.removeChild(this.charOpposite);
			this.charOpposite = null;
			
			LayerManager.instance.role.removeChild(this.charNext);
			this.charNext = null;
			
			LayerManager.instance.role.removeChild(this.charCurrent);
			this.charCurrent = null;
			
			(this.module as BloodRiver).info.data.table.userList.removeEventListener(ValueEvent.CHANGE, updateUsers);
		}
		
		public function updateUsers(event:ValueEvent=null):void
		{
			this.clearBind();
			
			this.charCurrent.visible = false;
			this.charOpposite.visible = false;
			this.charPrev.visible = false;
			this.charNext.visible = false;
			
			var userlist:ArrayList = (this.module as BloodRiver).info.data.table.userList;
			
			for (var i:int = 0; i < userlist.length; i++)
			{
				var user:UserInfo = userlist.element(i);
				
				if (user.seat < 0)
				{
					continue;
				}
				
				switch ((this.module as BloodRiver).info.data.table.getSeatPosition(user.seat))
				{
					case Position.CURRENT:
						this.charCurrent.visible = true;
						this.bind(user, this.charCurrent, {nickname: "nickname", chips: "chip"});
						break;
					case Position.OPPOSITE:
						this.charOpposite.visible = true;
						this.bind(user, this.charOpposite, {nickname: "nickname", chips: "chip"});
						break;
					case Position.PREV:
						this.charPrev.visible = true;
						this.bind(user, this.charPrev, {nickname: "nickname", chips: "chip"});
						break;
					case Position.NEXT:
						this.charNext.visible = true;
						this.bind(user, this.charNext, {nickname: "nickname", chips: "chip"});
						break;
				}
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
