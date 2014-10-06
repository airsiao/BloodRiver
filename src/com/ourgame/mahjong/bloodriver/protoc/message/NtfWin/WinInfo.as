package com.ourgame.mahjong.bloodriver.protoc.message.NtfWin {
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
	public dynamic final class WinInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WINNERSEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo.winnerSeat", "winnerSeat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winnerSeat:uint;

		/**
		 *  @private
		 */
		public static const LOSERSEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo.loserSeat", "loserSeat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var loserSeat:uint;

		/**
		 *  @private
		 */
		public static const FAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo.fan", "fan", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var fan:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.winnerSeat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.loserSeat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.fan);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var winnerSeat$count:uint = 0;
			var loserSeat$count:uint = 0;
			var fan$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (winnerSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinInfo.winnerSeat cannot be set twice.');
					}
					++winnerSeat$count;
					this.winnerSeat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (loserSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinInfo.loserSeat cannot be set twice.');
					}
					++loserSeat$count;
					this.loserSeat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (fan$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinInfo.fan cannot be set twice.');
					}
					++fan$count;
					this.fan = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
