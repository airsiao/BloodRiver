package com.ourgame.openface.message.lobby.AckRankList {
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
	public dynamic final class Item extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SERIAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckRankList.Item.serial", "serial", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var serial:uint;

		/**
		 *  @private
		 */
		public static const KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckRankList.Item.key", "key", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var key:String;

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckRankList.Item.value", "value", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var value:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.serial);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.key);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.value);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var serial$count:uint = 0;
			var key$count:uint = 0;
			var value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (serial$count != 0) {
						throw new flash.errors.IOError('Bad data format: Item.serial cannot be set twice.');
					}
					++serial$count;
					this.serial = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (key$count != 0) {
						throw new flash.errors.IOError('Bad data format: Item.key cannot be set twice.');
					}
					++key$count;
					this.key = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: Item.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
