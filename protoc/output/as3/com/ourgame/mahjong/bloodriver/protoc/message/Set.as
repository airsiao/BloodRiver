package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.Meld;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Set extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.Set.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const WINTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.Set.winType", "winType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winType:uint;

		/**
		 *  @private
		 */
		public static const MELDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.Set.melds", "melds", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.Meld; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.Meld")]
		public var melds:Array = [];

		/**
		 *  @private
		 */
		public static const WINUNITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.Set.winUnits", "winUnits", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winUnits:uint;

		/**
		 *  @private
		 */
		public static const FANTYPES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.Set.fanTypes", "fanTypes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var fanTypes:Array = [];

		/**
		 *  @private
		 */
		public static const PARAMS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.Set.params", "params", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var params$field:uint;

		private var hasField$0:uint = 0;

		public function clearParams():void {
			hasField$0 &= 0xfffffffe;
			params$field = new uint();
		}

		public function get hasParams():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set params(value:uint):void {
			hasField$0 |= 0x1;
			params$field = value;
		}

		public function get params():uint {
			return params$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.winType);
			for (var melds$index:uint = 0; melds$index < this.melds.length; ++melds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.melds[melds$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.winUnits);
			for (var fanTypes$index:uint = 0; fanTypes$index < this.fanTypes.length; ++fanTypes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.fanTypes[fanTypes$index]);
			}
			if (hasParams) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, params$field);
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
			var winType$count:uint = 0;
			var winUnits$count:uint = 0;
			var params$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: Set.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (winType$count != 0) {
						throw new flash.errors.IOError('Bad data format: Set.winType cannot be set twice.');
					}
					++winType$count;
					this.winType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					this.melds.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.Meld()));
					break;
				case 4:
					if (winUnits$count != 0) {
						throw new flash.errors.IOError('Bad data format: Set.winUnits cannot be set twice.');
					}
					++winUnits$count;
					this.winUnits = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.fanTypes);
						break;
					}
					this.fanTypes.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 6:
					if (params$count != 0) {
						throw new flash.errors.IOError('Bad data format: Set.params cannot be set twice.');
					}
					++params$count;
					this.params = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
