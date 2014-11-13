package com.ourgame.mahjong.bloodriver.common.vo.socket
{
	import com.wecoit.net.socket.IBytesData;
	import com.wecoit.net.socket.IDataResolver;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/**
	 * 麻将数据解析器
	 * @author SiaoLeon
	 */
	public class MJDataResolver implements IDataResolver
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		public static const HEADER_SIZE:uint = 8;
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function MJDataResolver()
		{
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function isContains(bytes:ByteArray):Boolean
		{
			if (bytes.bytesAvailable < HEADER_SIZE)
			{
				return false;
			}
			
			bytes.endian = Endian.BIG_ENDIAN;
			
			var position:int = bytes.position;
			var type:int = bytes.readInt();
			var length:int = bytes.readInt();
			var body:int = bytes.bytesAvailable;
			
			bytes.position = position;
			
			return body >= length;
		}
		
		public function parse(bytes:ByteArray):IBytesData
		{
			bytes.endian = Endian.BIG_ENDIAN;
			
			var type:int = bytes.readInt();
			var length:int = bytes.readInt();
			var body:ByteArray = new ByteArray();
			
			if (length > 0)
			{
				bytes.readBytes(body, 0, length);
			}
			
			return new MJDataPack(type, body);
		}
		
		public function pack(data:IBytesData):ByteArray
		{
			var bytes:ByteArray = new ByteArray();
			
			bytes.endian = Endian.BIG_ENDIAN;
			bytes.writeInt((data as MJDataPack).type);
			bytes.writeInt((data as MJDataPack).body.length);
			bytes.writeBytes((data as MJDataPack).body);
			
			return bytes;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
