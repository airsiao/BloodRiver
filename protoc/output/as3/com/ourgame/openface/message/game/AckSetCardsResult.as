package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.CardPosition;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckSetCardsResult extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckSetCardsResult.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const TIMEUSED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckSetCardsResult.timeUsed", "timeUsed", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var timeUsed:uint;

		/**
		 *  @private
		 */
		public static const TOTALTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckSetCardsResult.totalTime", "totalTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var totalTime:uint;

		/**
		 *  @private
		 */
		public static const CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.AckSetCardsResult.cards", "cards", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.CardPosition; });

		[ArrayElementType("com.ourgame.openface.message.game.CardPosition")]
		public var cards:Array = [];

		/**
		 *  @private
		 */
		public static const BROKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.AckSetCardsResult.broken", "broken", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var broken:Boolean = false;

		/**
		 *  @private
		 */
		public static const SACRIFICES:RepeatedFieldDescriptor$TYPE_SINT32 = new RepeatedFieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.AckSetCardsResult.sacrifices", "sacrifices", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var sacrifices:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.timeUsed);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.totalTime);
			for (var cards$index:uint = 0; cards$index < this.cards.length; ++cards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.cards[cards$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.broken);
			for (var sacrifices$index:uint = 0; sacrifices$index < this.sacrifices.length; ++sacrifices$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.sacrifices[sacrifices$index]);
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
			var timeUsed$count:uint = 0;
			var totalTime$count:uint = 0;
			var broken$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSetCardsResult.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (timeUsed$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSetCardsResult.timeUsed cannot be set twice.');
					}
					++timeUsed$count;
					this.timeUsed = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (totalTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSetCardsResult.totalTime cannot be set twice.');
					}
					++totalTime$count;
					this.totalTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					this.cards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.CardPosition()));
					break;
				case 5:
					if (broken$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSetCardsResult.broken cannot be set twice.');
					}
					++broken$count;
					this.broken = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_SINT32, this.sacrifices);
						break;
					}
					this.sacrifices.push(com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
