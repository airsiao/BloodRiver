package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.wecoit.display.DisplayElement;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 桌子信息条
	 * @author SiaoLeon
	 */
	public class TableInfoBar extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _tableName:String;
		
		public function set tableName(value:String):void
		{
			this._tableName = value;
			
			this.layout();
		}
		
		private var _roomName:String;
		
		public function set roomName(value:String):void
		{
			this._roomName = value;
			
			this.layout();
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var txtInfo:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableInfoBar()
		{
			super();
			
			this.x = this.y = 4;
			
			this.txtInfo = new TextField();
			this.txtInfo.defaultTextFormat = new TextFormat("simsun", 12, 0X94D4BB);
			this.txtInfo.autoSize = TextFieldAutoSize.LEFT;
			this.txtInfo.selectable = false;
			this.addChild(this.txtInfo);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function layout():void
		{
			this.txtInfo.text = "";
			
			if (this._roomName != null && this._roomName != "")
			{
				this.txtInfo.text += "房间：" + this._roomName;
			}
			
			if (this._tableName != null && this._tableName != "")
			{
				this.txtInfo.text += " 桌子：" + this._tableName;
			}
		}
	
	}
}
