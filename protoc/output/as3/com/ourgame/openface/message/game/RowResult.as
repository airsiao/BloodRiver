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
	public dynamic final class RowResult extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.RowResult.position", "position", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var position:uint;

		/**
		 *  @private
		 */
		public static const AWARDUINTS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.RowResult.awardUints", "awardUints", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var awardUints:uint;

		/**
		 *  @private
		 */
		public static const COMPREWIN:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.RowResult.compreWin", "compreWin", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var compreWin:int;

		/**
		 *  @private
		 */
		public static const AWARDWIN:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.RowResult.awardWin", "awardWin", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var awardWin:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.position);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.awardUints);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.compreWin);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.awardWin);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var position$count:uint = 0;
			var awardUints$count:uint = 0;
			var compreWin$count:uint = 0;
			var awardWin$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (position$count != 0) {
						throw new flash.errors.IOError('Bad data format: RowResult.position cannot be set twice.');
					}
					++position$count;
					this.position = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (awardUints$count != 0) {
						throw new flash.errors.IOError('Bad data format: RowResult.awardUints cannot be set twice.');
					}
					++awardUints$count;
					this.awardUints = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (compreWin$count != 0) {
						throw new flash.errors.IOError('Bad data format: RowResult.compreWin cannot be set twice.');
					}
					++compreWin$count;
					this.compreWin = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 4:
					if (awardWin$count != 0) {
						throw new flash.errors.IOError('Bad data format: RowResult.awardWin cannot be set twice.');
					}
					++awardWin$count;
					this.awardWin = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
