package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NtfWin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WINTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.winType", "winType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winType:uint;

		/**
		 *  @private
		 */
		public static const WINTILE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.winTile", "winTile", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winTile:uint;

		/**
		 *  @private
		 */
		public static const WININFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.winInfos", "winInfos", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo")]
		public var winInfos:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.winType);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.winTile);
			for (var winInfos$index:uint = 0; winInfos$index < this.winInfos.length; ++winInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.winInfos[winInfos$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var winType$count:uint = 0;
			var winTile$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (winType$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfWin.winType cannot be set twice.');
					}
					++winType$count;
					this.winType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (winTile$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfWin.winTile cannot be set twice.');
					}
					++winTile$count;
					this.winTile = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					this.winInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.NtfWin.WinInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
