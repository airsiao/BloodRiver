package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.ActionType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NtfAct extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const ACT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.act", "act", (2 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.mahjong.bloodriver.protoc.message.ActionType);

		public var act:int;

		/**
		 *  @private
		 */
		public static const PROVIDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.provider", "provider", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var provider$field:uint;

		private var hasField$0:uint = 0;

		public function clearProvider():void {
			hasField$0 &= 0xfffffffe;
			provider$field = new uint();
		}

		public function get hasProvider():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set provider(value:uint):void {
			hasField$0 |= 0x1;
			provider$field = value;
		}

		public function get provider():uint {
			return provider$field;
		}

		/**
		 *  @private
		 */
		public static const TARGETTILE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.targetTile", "targetTile", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var targetTile$field:uint;

		public function clearTargetTile():void {
			hasField$0 &= 0xfffffffd;
			targetTile$field = new uint();
		}

		public function get hasTargetTile():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set targetTile(value:uint):void {
			hasField$0 |= 0x2;
			targetTile$field = value;
		}

		public function get targetTile():uint {
			return targetTile$field;
		}

		/**
		 *  @private
		 */
		public static const ROOTTILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.rootTiles", "rootTiles", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var rootTiles:Array = [];

		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.action", "action", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var action$field:uint;

		public function clearAction():void {
			hasField$0 &= 0xfffffffb;
			action$field = new uint();
		}

		public function get hasAction():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set action(value:uint):void {
			hasField$0 |= 0x4;
			action$field = value;
		}

		public function get action():uint {
			return action$field;
		}

		/**
		 *  @private
		 */
		public static const ACTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfAct.actTime", "actTime", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var actTime$field:uint;

		public function clearActTime():void {
			hasField$0 &= 0xfffffff7;
			actTime$field = new uint();
		}

		public function get hasActTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set actTime(value:uint):void {
			hasField$0 |= 0x8;
			actTime$field = value;
		}

		public function get actTime():uint {
			return actTime$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.act);
			if (hasProvider) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, provider$field);
			}
			if (hasTargetTile) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, targetTile$field);
			}
			for (var rootTiles$index:uint = 0; rootTiles$index < this.rootTiles.length; ++rootTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.rootTiles[rootTiles$index]);
			}
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, action$field);
			}
			if (hasActTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
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
			var seat$count:uint = 0;
			var act$count:uint = 0;
			var provider$count:uint = 0;
			var targetTile$count:uint = 0;
			var action$count:uint = 0;
			var actTime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (act$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.act cannot be set twice.');
					}
					++act$count;
					this.act = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (provider$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.provider cannot be set twice.');
					}
					++provider$count;
					this.provider = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (targetTile$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.targetTile cannot be set twice.');
					}
					++targetTile$count;
					this.targetTile = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.rootTiles);
						break;
					}
					this.rootTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 6:
					if (action$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.action cannot be set twice.');
					}
					++action$count;
					this.action = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (actTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfAct.actTime cannot be set twice.');
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
