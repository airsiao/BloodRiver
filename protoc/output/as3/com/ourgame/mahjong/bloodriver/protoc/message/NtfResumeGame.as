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
	public dynamic final class NtfResumeGame extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DEALER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfResumeGame.dealer", "dealer", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var dealer:uint;

		/**
		 *  @private
		 */
		public static const BASICSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfResumeGame.basicScore", "basicScore", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var basicScore:uint;

		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfResumeGame.stage", "stage", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var stage:uint;

		/**
		 *  @private
		 */
		public static const ROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfResumeGame.round", "round", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var round:uint;

		/**
		 *  @private
		 */
		public static const SERIAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfResumeGame.serial", "serial", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var serial:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.dealer);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.basicScore);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.stage);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.round);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.serial);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var dealer$count:uint = 0;
			var basicScore$count:uint = 0;
			var stage$count:uint = 0;
			var round$count:uint = 0;
			var serial$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (dealer$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfResumeGame.dealer cannot be set twice.');
					}
					++dealer$count;
					this.dealer = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (basicScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfResumeGame.basicScore cannot be set twice.');
					}
					++basicScore$count;
					this.basicScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfResumeGame.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (round$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfResumeGame.round cannot be set twice.');
					}
					++round$count;
					this.round = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (serial$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfResumeGame.serial cannot be set twice.');
					}
					++serial$count;
					this.serial = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
