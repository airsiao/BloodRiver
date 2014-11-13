package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.netease.protobuf.UInt64;
	
	/**
	 * 聊天信息
	 * @author SiaoLeon
	 */
	public class ChatInfo
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		/**
		 * ChatType，消息类型
		 * @default
		 */
		private var _type:uint;
		
		public function get type():uint
		{
			return this._type;
		}
		
		/**
		 * 消息内容
		 * @default
		 */
		private var _content:String;
		
		public function get content():String
		{
			return this._content;
		}
		
		/**
		 * 发送者ID
		 * @default
		 */
		private var _sender:UInt64;
		
		public function get sender():UInt64
		{
			return this._sender;
		}
		
		/**
		 * 接收者ID（私聊）
		 * @default
		 */
		private var _receiver:UInt64;
		
		public function get receiver():UInt64
		{
			return this._receiver;
		}
		
		/**
		 * 发送者昵称
		 * @default
		 */
		private var _senderName:String;
		
		public function get senderName():String
		{
			return this._senderName;
		}
		
		public function set senderName(value:String):void
		{
			this._senderName = value;
		}
		
		/**
		 * 接收者昵称（私聊）
		 * @default
		 */
		private var _receiverName:String;
		
		public function get receiverName():String
		{
			return this._receiverName;
		}
		
		public function set receiverName(value:String):void
		{
			this._receiverName = value;
		}
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ChatInfo(type:uint, content:String, receiver:UInt64=null, sender:UInt64=null)
		{
			this._type = type;
			this._content = content;
			this._sender = sender;
			this._receiver = receiver;
			this._senderName = null;
			this._receiverName = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return "[Chat(type=" + this.type + ",content=" + this.content + ",sender=" + this.sender + ":" + this.senderName + ",receiver=" + this.receiver + ":" + this.receiverName + ")]";
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}

