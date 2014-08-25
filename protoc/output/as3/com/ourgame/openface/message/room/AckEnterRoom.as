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
	public dynamic final class AckEnterRoom extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckEnterRoom.roomId", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomId:uint;

		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.room.AckEnterRoom.result", "result", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var result:int;

		/**
		 *  @private
		 */
		public static const USERAMOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckEnterRoom.userAmount", "userAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userAmount$field:uint;

		private var hasField$0:uint = 0;

		public function clearUserAmount():void {
			hasField$0 &= 0xfffffffe;
			userAmount$field = new uint();
		}

		public function get hasUserAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set userAmount(value:uint):void {
			hasField$0 |= 0x1;
			userAmount$field = value;
		}

		public function get userAmount():uint {
			return userAmount$field;
		}

		/**
		 *  @private
		 */
		public static const FAILREASON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.room.AckEnterRoom.failReason", "failReason", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.room.AckEnterRoom.userId", "userId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userId$field:UInt64;

		public function clearUserId():void {
			userId$field = null;
		}

		public function get hasUserId():Boolean {
			return userId$field != null;
		}

		public function set userId(value:UInt64):void {
			userId$field = value;
		}

		public function get userId():UInt64 {
			return userId$field;
		}

		/**
		 *  @private
		 */
		public static const NICKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.room.AckEnterRoom.nickname", "nickname", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var nickname$field:String;

		public function clearNickname():void {
			nickname$field = null;
		}

		public function get hasNickname():Boolean {
			return nickname$field != null;
		}

		public function set nickname(value:String):void {
			nickname$field = value;
		}

		public function get nickname():String {
			return nickname$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.roomId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.result);
			if (hasUserAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, userAmount$field);
			}
			if (hasFailReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, failReason$field);
			}
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, userId$field);
			}
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, nickname$field);
			}
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
			var userAmount$count:uint = 0;
			var failReason$count:uint = 0;
			var userId$count:uint = 0;
			var nickname$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (roomId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.roomId cannot be set twice.');
					}
					++roomId$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (userAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.userAmount cannot be set twice.');
					}
					++userAmount$count;
					this.userAmount = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (failReason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.failReason cannot be set twice.');
					}
					++failReason$count;
					this.failReason = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 6:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckEnterRoom.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
