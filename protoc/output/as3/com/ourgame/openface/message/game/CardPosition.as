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
	public dynamic final class CardPosition extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CARD:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.CardPosition.card", "card", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var card:int;

		/**
		 *  @private
		 */
		public static const POSITION:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.CardPosition.position", "position", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var position:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.card);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.position);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var card$count:uint = 0;
			var position$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (card$count != 0) {
						throw new flash.errors.IOError('Bad data format: CardPosition.card cannot be set twice.');
					}
					++card$count;
					this.card = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (position$count != 0) {
						throw new flash.errors.IOError('Bad data format: CardPosition.position cannot be set twice.');
					}
					++position$count;
					this.position = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
