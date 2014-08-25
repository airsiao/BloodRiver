package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.OGAckChatChannelMsg.ErrorType;
	import com.ourgame.openface.message.chat.OGReqChatMsg;
	import com.ourgame.openface.message.chat.ChatResult;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGAckChatChannelMsg extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGAckChatChannelMsg.Result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.ChatResult);

		public var result:int;

		/**
		 *  @private
		 */
		public static const REASON:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGAckChatChannelMsg.Reason", "reason", (2 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGAckChatChannelMsg.ErrorType);

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
				return com.ourgame.openface.message.chat.OGAckChatChannelMsg.ErrorType.ET_UNKNOWN;
			}
			return Reason$field;
		}

		/**
		 *  @private
		 */
		public static const FAILEDCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGAckChatChannelMsg.FailedCount", "failedCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var FailedCount$field:int;

		public function clearFailedCount():void {
			hasField$0 &= 0xfffffffd;
			FailedCount$field = new int();
		}

		public function get hasFailedCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set failedCount(value:int):void {
			hasField$0 |= 0x2;
			FailedCount$field = value;
		}

		public function get failedCount():int {
			if(!hasFailedCount) {
				return 1;
			}
			return FailedCount$field;
		}

		/**
		 *  @private
		 */
		public static const REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.chat.OGAckChatChannelMsg.Req", "req", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.chat.OGReqChatMsg; });

		private var Req$field:com.ourgame.openface.message.chat.OGReqChatMsg;

		public function clearReq():void {
			Req$field = null;
		}

		public function get hasReq():Boolean {
			return Req$field != null;
		}

		public function set req(value:com.ourgame.openface.message.chat.OGReqChatMsg):void {
			Req$field = value;
		}

		public function get req():com.ourgame.openface.message.chat.OGReqChatMsg {
			return Req$field;
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
			if (hasFailedCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, FailedCount$field);
			}
			if (hasReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, Req$field);
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
			var FailedCount$count:uint = 0;
			var Req$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Result$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatChannelMsg.result cannot be set twice.');
					}
					++Result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (Reason$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatChannelMsg.reason cannot be set twice.');
					}
					++Reason$count;
					this.reason = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (FailedCount$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatChannelMsg.failedCount cannot be set twice.');
					}
					++FailedCount$count;
					this.failedCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (Req$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGAckChatChannelMsg.req cannot be set twice.');
					}
					++Req$count;
					this.req = new com.ourgame.openface.message.chat.OGReqChatMsg();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.req);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
