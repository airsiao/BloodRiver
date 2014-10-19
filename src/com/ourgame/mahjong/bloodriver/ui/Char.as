package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 角色
	 * @author SiaoLeon
	 */
	public class Char extends Sprite
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _user:UserInfo;
		
		public function set user(value:UserInfo):void
		{
			if (this._user == value)
			{
				return;
			}
			
			this._user = value;
			
			this.txtName.text = value.nickname;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var txtName:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Char(position:uint)
		{
			super();
			
			this.txtName = new TextField();
			this.txtName.defaultTextFormat = new TextFormat("simsun", 12, 0XFFFFFF);
			this.txtName.autoSize = TextFieldAutoSize.LEFT;
			this.txtName.selectable = false;
			this.addChild(this.txtName);
			
			switch (position)
			{
				case Position.CURRENT:
					this.x = 0;
					this.y = 410;
					this.txtName.x = 10;
					this.txtName.y = 0;
					break;
				case Position.NEXT:
					this.x = 820;
					this.y = 250;
					this.txtName.x = 10;
					this.txtName.y = 0;
					break;
				case Position.OPPOSITE:
					this.x = 680;
					this.y = 0;
					this.txtName.x = 110;
					this.txtName.y = 6;
					break;
				case Position.PREV:
					this.x = 0;
					this.y = 250;
					this.txtName.x = 10;
					this.txtName.y = 0;
					break;
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
