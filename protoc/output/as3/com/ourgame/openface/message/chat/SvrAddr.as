package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SvrAddr extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.SvrAddr.ip", "ip", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ip$field:String;

		public function clearIp():void {
			ip$field = null;
		}

		public function get hasIp():Boolean {
			return ip$field != null;
		}

		public function set ip(value:String):void {
			ip$field = value;
		}

		public function get ip():String {
			return ip$field;
		}

		/**
		 *  @private
		 */
		public static const PORT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.SvrAddr.port", "port", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var port$field:int;

		private var hasField$0:uint = 0;

		public function clearPort():void {
			hasField$0 &= 0xfffffffe;
			port$field = new int();
		}

		public function get hasPort():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set port(value:int):void {
			hasField$0 |= 0x1;
			port$field = value;
		}

		public function get port():int {
			return port$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ip$field);
			}
			if (hasPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, port$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ip$count:uint = 0;
			var port$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: SvrAddr.ip cannot be set twice.');
					}
					++ip$count;
					this.ip = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (port$count != 0) {
						throw new flash.errors.IOError('Bad data format: SvrAddr.port cannot be set twice.');
					}
					++port$count;
					this.port = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
