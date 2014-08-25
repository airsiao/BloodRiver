package com.ourgame.openface.message.game {
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
	public dynamic final class Player extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.game.Player.userId", "userId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.game.Player.seat", "seat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:int;

		/**
		 *  @private
		 */
		public static const FANTASY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.Player.fantasy", "fantasy", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fantasy$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearFantasy():void {
			hasField$0 &= 0xfffffffe;
			fantasy$field = new Boolean();
		}

		public function get hasFantasy():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set fantasy(value:Boolean):void {
			hasField$0 |= 0x1;
			fantasy$field = value;
		}

		public function get fantasy():Boolean {
			return fantasy$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.seat);
			if (hasFantasy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, fantasy$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var userId$count:uint = 0;
			var seat$count:uint = 0;
			var fantasy$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: Player.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: Player.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (fantasy$count != 0) {
						throw new flash.errors.IOError('Bad data format: Player.fantasy cannot be set twice.');
					}
					++fantasy$count;
					this.fantasy = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
