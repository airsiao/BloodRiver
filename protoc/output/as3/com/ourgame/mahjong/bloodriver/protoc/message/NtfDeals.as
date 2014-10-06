package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NtfDeals extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STARTSEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.startSeat", "startSeat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var startSeat:uint;

		/**
		 *  @private
		 */
		public static const STARTFRUSTA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.startFrusta", "startFrusta", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var startFrusta:uint;

		/**
		 *  @private
		 */
		public static const TILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.tiles", "tiles", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var tiles:Array = [];

		/**
		 *  @private
		 */
		public static const AMOUTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.amouts", "amouts", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount")]
		public var amouts:Array = [];

		/**
		 *  @private
		 */
		public static const WAITINGTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.waitingTime", "waitingTime", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var waitingTime:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.startSeat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.startFrusta);
			for (var tiles$index:uint = 0; tiles$index < this.tiles.length; ++tiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tiles[tiles$index]);
			}
			for (var amouts$index:uint = 0; amouts$index < this.amouts.length; ++amouts$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amouts[amouts$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.waitingTime);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var startSeat$count:uint = 0;
			var startFrusta$count:uint = 0;
			var waitingTime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (startSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDeals.startSeat cannot be set twice.');
					}
					++startSeat$count;
					this.startSeat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (startFrusta$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDeals.startFrusta cannot be set twice.');
					}
					++startFrusta$count;
					this.startFrusta = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.tiles);
						break;
					}
					this.tiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 4:
					this.amouts.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.NtfDeals.TileAmount()));
					break;
				case 5:
					if (waitingTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfDeals.waitingTime cannot be set twice.');
					}
					++waitingTime$count;
					this.waitingTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
