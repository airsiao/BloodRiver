package com.ourgame.openface.message.room.AckRoomList {
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
	public dynamic final class Room extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckRoomList.Room.roomId", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomId:uint;

		/**
		 *  @private
		 */
		public static const ROOMTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckRoomList.Room.roomType", "roomType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomType:uint;

		/**
		 *  @private
		 */
		public static const ROOMNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.room.AckRoomList.Room.roomName", "roomName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomName:String;

		/**
		 *  @private
		 */
		public static const USERAMOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckRoomList.Room.userAmount", "userAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userAmount$field:uint;

		private var hasField$0:uint = 0;

		public function clearUserAmount():void {
			hasField$0 &= 0xfffffffe;
			userAmount$field = new uint();
		}

		public function get hasUserAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set userAmount(value:uint):void {
			hasField$0 |= 0x1;
			userAmount$field = value;
		}

		public function get userAmount():uint {
			return userAmount$field;
		}

		/**
		 *  @private
		 */
		public static const IMAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.room.AckRoomList.Room.image", "image", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var image$field:String;

		public function clearImage():void {
			image$field = null;
		}

		public function get hasImage():Boolean {
			return image$field != null;
		}

		public function set image(value:String):void {
			image$field = value;
		}

		public function get image():String {
			return image$field;
		}

		/**
		 *  @private
		 */
		public static const ENTERBUYIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckRoomList.Room.enterBuyIn", "enterBuyIn", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enterBuyIn$field:uint;

		public function clearEnterBuyIn():void {
			hasField$0 &= 0xfffffffd;
			enterBuyIn$field = new uint();
		}

		public function get hasEnterBuyIn():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set enterBuyIn(value:uint):void {
			hasField$0 |= 0x2;
			enterBuyIn$field = value;
		}

		public function get enterBuyIn():uint {
			return enterBuyIn$field;
		}

		/**
		 *  @private
		 */
		public static const UNITVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.room.AckRoomList.Room.unitValue", "unitValue", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var unitValue$field:uint;

		public function clearUnitValue():void {
			hasField$0 &= 0xfffffffb;
			unitValue$field = new uint();
		}

		public function get hasUnitValue():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set unitValue(value:uint):void {
			hasField$0 |= 0x4;
			unitValue$field = value;
		}

		public function get unitValue():uint {
			return unitValue$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.roomId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.roomType);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomName);
			if (hasUserAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, userAmount$field);
			}
			if (hasImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, image$field);
			}
			if (hasEnterBuyIn) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, enterBuyIn$field);
			}
			if (hasUnitValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, unitValue$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var roomId$count:uint = 0;
			var roomType$count:uint = 0;
			var roomName$count:uint = 0;
			var userAmount$count:uint = 0;
			var image$count:uint = 0;
			var enterBuyIn$count:uint = 0;
			var unitValue$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (roomId$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.roomId cannot be set twice.');
					}
					++roomId$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (roomType$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.roomType cannot be set twice.');
					}
					++roomType$count;
					this.roomType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (roomName$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.roomName cannot be set twice.');
					}
					++roomName$count;
					this.roomName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (userAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.userAmount cannot be set twice.');
					}
					++userAmount$count;
					this.userAmount = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (image$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.image cannot be set twice.');
					}
					++image$count;
					this.image = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (enterBuyIn$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.enterBuyIn cannot be set twice.');
					}
					++enterBuyIn$count;
					this.enterBuyIn = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (unitValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: Room.unitValue cannot be set twice.');
					}
					++unitValue$count;
					this.unitValue = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
