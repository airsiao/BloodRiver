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
	public dynamic final class SAckSwap extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OLDTILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap.oldTiles", "oldTiles", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var oldTiles:Array = [];

		/**
		 *  @private
		 */
		public static const NEWTILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap.newTiles", "newTiles", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var newTiles:Array = [];

		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap.action", "action", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var action$field:uint;

		private var hasField$0:uint = 0;

		public function clearAction():void {
			hasField$0 &= 0xfffffffe;
			action$field = new uint();
		}

		public function get hasAction():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set action(value:uint):void {
			hasField$0 |= 0x1;
			action$field = value;
		}

		public function get action():uint {
			return action$field;
		}

		/**
		 *  @private
		 */
		public static const ACTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.SAckSwap.actTime", "actTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var actTime$field:uint;

		public function clearActTime():void {
			hasField$0 &= 0xfffffffd;
			actTime$field = new uint();
		}

		public function get hasActTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set actTime(value:uint):void {
			hasField$0 |= 0x2;
			actTime$field = value;
		}

		public function get actTime():uint {
			return actTime$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var oldTiles$index:uint = 0; oldTiles$index < this.oldTiles.length; ++oldTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.oldTiles[oldTiles$index]);
			}
			for (var newTiles$index:uint = 0; newTiles$index < this.newTiles.length; ++newTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.newTiles[newTiles$index]);
			}
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, action$field);
			}
			if (hasActTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, actTime$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var action$count:uint = 0;
			var actTime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.oldTiles);
						break;
					}
					this.oldTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.newTiles);
						break;
					}
					this.newTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 3:
					if (action$count != 0) {
						throw new flash.errors.IOError('Bad data format: SAckSwap.action cannot be set twice.');
					}
					++action$count;
					this.action = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (actTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: SAckSwap.actTime cannot be set twice.');
					}
					++actTime$count;
					this.actTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
