package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.OGAckChatLogin.ErrorType;
	import com.ourgame.openface.message.chat.ChatResult;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGAckChatLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGAckChatLogin.Result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.ChatResult);

		public var result:int;

		/**
		 *  @private
		 */
		public static const REASON:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGAckChatLogin.Reason", "reason", (2 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGAckChatLogin.ErrorType);

		private var Reason$field:int;

		private var hasField$0:uint = 0;

		public function clearReason():void {
			hasField$0 &= 0xfffffffe;
			Reason$field = new int();
		}

		public function get hasReason():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set reason(value:int):void {
			hasField$0 |= 0x1;
			Reason$field = value;
		}

		public function get reason():int {
			if(!hasReason) {
				return com.ourgame.openface.message.chat.OGAckChatLogin.ErrorType.ET_UNKNOWN;
			}
			return Reason$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.result);
			if (hasReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, Reason$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Result$count:uint = 0;
			var Reason$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Result$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatLogin.result cannot be set twice.');
					}
					++Result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (Reason$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatLogin.reason cannot be set twice.');
					}
					++Reason$count;
					this.reason = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
