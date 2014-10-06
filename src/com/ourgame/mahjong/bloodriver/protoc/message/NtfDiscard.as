package com.ourgame.mahjong.bloodriver.protoc.message {
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
	public dynamic final class NtfDiscard extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TILE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard.tile", "tile", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var tile:uint;

		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard.seat", "seat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard.action", "action", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var action$field:uint;

		private var hasField$0:uint = 0;

		public function clearAction():void {
			hasField$0 &= 0xfffffffe;
			action$field = new uint();
		}

		public function get hasAction():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set action(value:uint):void {
			hasField$0 |= 0x1;
			action$field = value;
		}

		public function get action():uint {
			return action$field;
		}

		/**
		 *  @private
		 */
		public static const ACTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDiscard.actTime", "actTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var actTime$field:uint;

		public function clearActTime():void {
			hasField$0 &= 0xfffffffd;
			actTime$field = new uint();
		}

		public function get hasActTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set actTime(value:uint):void {
			hasField$0 |= 0x2;
			actTime$field = value;
		}

		public function get actTime():uint {
			return actTime$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tile);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, action$field);
			}
			if (hasActTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, actTime$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tile$count:uint = 0;
			var seat$count:uint = 0;
			var action$count:uint = 0;
			var actTime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tile$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDiscard.tile cannot be set twice.');
					}
					++tile$count;
					this.tile = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDiscard.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (action$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDiscard.action cannot be set twice.');
					}
					++action$count;
					this.action = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (actTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDiscard.actTime cannot be set twice.');
					}
					++actTime$count;
					this.actTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
