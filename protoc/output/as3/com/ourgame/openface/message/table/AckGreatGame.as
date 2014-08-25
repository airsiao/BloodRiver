package com.ourgame.openface.message.table {
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
	public dynamic final class AckGreatGame extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckGreatGame.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.AckGreatGame.userId", "userId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckGreatGame.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var level:uint;

		/**
		 *  @private
		 */
		public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckGreatGame.star", "star", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var star:uint;

		/**
		 *  @private
		 */
		public static const WINSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckGreatGame.winScore", "winScore", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var winScore$field:uint;

		private var hasField$0:uint = 0;

		public function clearWinScore():void {
			hasField$0 &= 0xfffffffe;
			winScore$field = new uint();
		}

		public function get hasWinScore():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set winScore(value:uint):void {
			hasField$0 |= 0x1;
			winScore$field = value;
		}

		public function get winScore():uint {
			return winScore$field;
		}

		/**
		 *  @private
		 */
		public static const SERVICEPAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckGreatGame.servicePay", "servicePay", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var servicePay$field:uint;

		public function clearServicePay():void {
			hasField$0 &= 0xfffffffd;
			servicePay$field = new uint();
		}

		public function get hasServicePay():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set servicePay(value:uint):void {
			hasField$0 |= 0x2;
			servicePay$field = value;
		}

		public function get servicePay():uint {
			return servicePay$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.level);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.star);
			if (hasWinScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, winScore$field);
			}
			if (hasServicePay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, servicePay$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat$count:uint = 0;
			var userId$count:uint = 0;
			var level$count:uint = 0;
			var star$count:uint = 0;
			var winScore$count:uint = 0;
			var servicePay$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (star$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.star cannot be set twice.');
					}
					++star$count;
					this.star = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (winScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.winScore cannot be set twice.');
					}
					++winScore$count;
					this.winScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (servicePay$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGreatGame.servicePay cannot be set twice.');
					}
					++servicePay$count;
					this.servicePay = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
