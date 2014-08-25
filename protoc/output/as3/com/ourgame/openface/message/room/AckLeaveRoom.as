package com.ourgame.openface.message.room {
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
	public dynamic final class AckLeaveRoom extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckLeaveRoom.roomId", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomId:uint;

		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.room.AckLeaveRoom.result", "result", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var result:int;

		/**
		 *  @private
		 */
		public static const FAILREASON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.room.AckLeaveRoom.failReason", "failReason", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var failReason$field:String;

		public function clearFailReason():void {
			failReason$field = null;
		}

		public function get hasFailReason():Boolean {
			return failReason$field != null;
		}

		public function set failReason(value:String):void {
			failReason$field = value;
		}

		public function get failReason():String {
			return failReason$field;
		}

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.room.AckLeaveRoom.userId", "userId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.roomId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.result);
			if (hasFailReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, failReason$field);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var roomId$count:uint = 0;
			var result$count:uint = 0;
			var failReason$count:uint = 0;
			var userId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (roomId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLeaveRoom.roomId cannot be set twice.');
					}
					++roomId$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLeaveRoom.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (failReason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLeaveRoom.failReason cannot be set twice.');
					}
					++failReason$count;
					this.failReason = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLeaveRoom.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
