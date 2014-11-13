package com.ourgame.mahjong.bloodriver.common.vo.socket
{
	import com.wecoit.net.socket.IBytesData;
	import com.wecoit.utils.bytes.Bytes;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/**
	 * 麻将数据包
	 * @author SiaoLeon
	 */
	public class MJDataPack implements IBytesData
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _type:int;
		
		/**
		 * 数据类型
		 */
		public function get type():int
		{
			return _type;
		}
		
		private var _body:ByteArray;
		
		/**
		 * 数据内容
		 */
		public function get body():ByteArray
		{
			return _body;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function MJDataPack(type:int, body:ByteArray)
		{
			this._type = type;
			this._body = body;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return Bytes.encode(this.body);
		}
		
		public function write(bytes:ByteArray):void
		{
			var position:uint = this._body.position;
			this._body.position = this._body.length;
			this._body.writeBytes(bytes);
			this._body.position = position;
		}
		
		public function read():ByteArray
		{
			var bytes:ByteArray = new ByteArray();
			
			bytes.endian = Endian.BIG_ENDIAN;
			bytes.writeInt(this.type);
			bytes.writeInt(this.body.length);
			bytes.writeBytes(this.body);
			
			return bytes;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
