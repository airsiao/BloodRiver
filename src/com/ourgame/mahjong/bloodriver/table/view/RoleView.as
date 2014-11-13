package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.vo.UserInfo;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.WinType;
	import com.ourgame.mahjong.bloodriver.table.state.TableState;
	import com.ourgame.mahjong.bloodriver.table.ui.Role;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.vo.Action;
	import com.ourgame.mahjong.bloodriver.table.vo.Game;
	import com.ourgame.mahjong.bloodriver.table.vo.Win;
	import com.wecoit.data.ArrayList;
	import com.wecoit.events.ValueEvent;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.setTimeout;
	
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
		
		public var current:Role;
		
		public var next:Role;
		
		public var opposite:Role;
		
		public var prev:Role;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
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
			this.current = new Role(Position.CURRENT);
			TableLayer.instance.role.addChild(this.current);
			
			this.next = new Role(Position.NEXT);
			TableLayer.instance.role.addChild(this.next);
			
			this.opposite = new Role(Position.OPPOSITE);
			TableLayer.instance.role.addChild(this.opposite);
			
			this.prev = new Role(Position.PREV);
			TableLayer.instance.role.addChild(this.prev);
			
			CommonData.table.userList.addEventListener(ValueEvent.CHANGE, updateUsers);
			
			this.updateUsers();
		}
		
		override public function onRemove():void
		{
			this.clearBind();
			
			CommonData.table.userList.removeEventListener(ValueEvent.CHANGE, updateUsers);
			
			TableLayer.instance.role.removeChild(this.prev);
			this.prev = null;
			
			TableLayer.instance.role.removeChild(this.opposite);
			this.opposite = null;
			
			TableLayer.instance.role.removeChild(this.next);
			this.next = null;
			
			TableLayer.instance.role.removeChild(this.current);
			this.current = null;
		}
		
		public function updateUsers(event:ValueEvent=null):void
		{
			this.clearBind();
			
			var userlist:ArrayList = new ArrayList();
			
			for each (var user:UserInfo in CommonData.table.userList.elements)
			{
				if (user.seat < 0)
				{
					continue;
				}
				
				userlist.setElement(user.seat, user);
			}
			
			for (var i:int = 0; i < 4; i++)
			{
				var info:UserInfo = (i >= userlist.length) ? null : userlist.element(i);
				var role:Role;
				
				switch (CommonData.table.getSeatPosition(i))
				{
					case Position.CURRENT:
						role = this.current;
						break;
					case Position.OPPOSITE:
						role = this.opposite;
						break;
					case Position.PREV:
						role = this.prev;
						break;
					case Position.NEXT:
						role = this.next;
						break;
				}
				
				if (info == null)
				{
					role.visible = false;
				}
				else
				{
					this.bind(info, role, {nickname: "nickname", chips: "chip", avatar: "avatar"});
					
					if (role.visible == false)
					{
						role.visible = true;
						role.sitdown();
					}
				}
			}
		}
		
		public function dealer(notice:INotice):void
		{
			var game:Game = notice.params;
			
			switch (CommonData.table.getSeatPosition(game.dealer))
			{
				case Position.CURRENT:
					(this.context as TableState).role.current.showDealer(notice);
					break;
				case Position.OPPOSITE:
					(this.context as TableState).role.opposite.showDealer(notice);
					break;
				case Position.NEXT:
					(this.context as TableState).role.next.showDealer(notice);
					break;
				case Position.PREV:
					(this.context as TableState).role.prev.showDealer(notice);
					break;
			}
		}
		
		public function draw(seat:uint):void
		{
			switch (CommonData.table.getSeatPosition(seat))
			{
				case Position.CURRENT:
					(this.context as TableState).role.current.play();
					break;
				case Position.OPPOSITE:
					(this.context as TableState).role.opposite.play();
					break;
				case Position.NEXT:
					(this.context as TableState).role.next.play();
					break;
				case Position.PREV:
					(this.context as TableState).role.prev.play();
					break;
			}
		}
		
		public function discard(seat:uint):void
		{
			switch (CommonData.table.getSeatPosition(seat))
			{
				case Position.CURRENT:
					(this.context as TableState).role.current.normal();
					break;
				case Position.OPPOSITE:
					(this.context as TableState).role.opposite.normal();
					break;
				case Position.NEXT:
					(this.context as TableState).role.next.normal();
					break;
				case Position.PREV:
					(this.context as TableState).role.prev.normal();
					break;
			}
		}
		
		public function action(seat:uint):void
		{
			switch (CommonData.table.getSeatPosition(seat))
			{
				case Position.CURRENT:
					(this.context as TableState).role.current.play();
					break;
				case Position.OPPOSITE:
					(this.context as TableState).role.opposite.play();
					break;
				case Position.NEXT:
					(this.context as TableState).role.next.play();
					break;
				case Position.PREV:
					(this.context as TableState).role.prev.play();
					break;
			}
		}
		
		public function win(notice:INotice):void
		{
			this.notice = notice;
			
			var action:Action = this.notice.params;
			var win:Win = action.params;
			
			if (win.type == WinType.SELF)
			{
				var position:uint = CommonData.table.getSeatPosition(action.seat);
				
				switch (position)
				{
					case Position.CURRENT:
						(this.context as TableState).role.current.normal();
						break;
					case Position.OPPOSITE:
						(this.context as TableState).role.opposite.normal();
						break;
					case Position.NEXT:
						(this.context as TableState).role.next.normal();
						break;
					case Position.PREV:
						(this.context as TableState).role.prev.normal();
						break;
				}
			}
			
			setTimeout(this.showLose, 1200);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function showLose():void
		{
			var action:Action = this.notice.params;
			var win:Win = action.params;
			
			for (var i:int = 0; i < win.fan.length; i++)
			{
				if (win.fan[i] >= 0)
				{
					continue;
				}
				
				var position:uint = CommonData.table.getSeatPosition(i);
				
				switch (position)
				{
					case Position.CURRENT:
						(win.type == WinType.SELF) ? this.current.light() : this.current.kill();
						break;
					case Position.NEXT:
						(win.type == WinType.SELF) ? this.next.light() : this.next.kill();
						break;
					case Position.OPPOSITE:
						(win.type == WinType.SELF) ? this.opposite.light() : this.opposite.kill();
						break;
					case Position.PREV:
						(win.type == WinType.SELF) ? this.prev.light() : this.prev.kill();
						break;
				}
			}
			
			this.notice.complete();
		}
	
	}
}
