package com.ourgame.openface.message.account {
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
	public dynamic final class OgRoomInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomId", "roomId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomId:String;

		/**
		 *  @private
		 */
		public static const ROOMRANK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomRank", "roomRank", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomRank:String;

		/**
		 *  @private
		 */
		public static const ROOMIP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomIp", "roomIp", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomIp:String;

		/**
		 *  @private
		 */
		public static const ROOMPORT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomPort", "roomPort", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomPort:String;

		/**
		 *  @private
		 */
		public static const ROOMSTATUS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomStatus", "roomStatus", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomStatus:String;

		/**
		 *  @private
		 */
		public static const ROOMMINGOLD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomMinGold", "roomMinGold", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomMinGold:String;

		/**
		 *  @private
		 */
		public static const ROOMMAXGOLD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomMaxGold", "roomMaxGold", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomMaxGold:String;

		/**
		 *  @private
		 */
		public static const ROOMMINPLAY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomMinPlay", "roomMinPlay", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var roomMinPlay:String;

		/**
		 *  @private
		 */
		public static const ROOMTYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomType", "roomType", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RoomType$field:String;

		public function clearRoomType():void {
			RoomType$field = null;
		}

		public function get hasRoomType():Boolean {
			return RoomType$field != null;
		}

		public function set roomType(value:String):void {
			RoomType$field = value;
		}

		public function get roomType():String {
			return RoomType$field;
		}

		/**
		 *  @private
		 */
		public static const SERVERTYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.ServerType", "serverType", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ServerType$field:String;

		public function clearServerType():void {
			ServerType$field = null;
		}

		public function get hasServerType():Boolean {
			return ServerType$field != null;
		}

		public function set serverType(value:String):void {
			ServerType$field = value;
		}

		public function get serverType():String {
			return ServerType$field;
		}

		/**
		 *  @private
		 */
		public static const DESCRIPTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.Description", "description", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Description$field:String;

		public function clearDescription():void {
			Description$field = null;
		}

		public function get hasDescription():Boolean {
			return Description$field != null;
		}

		public function set description(value:String):void {
			Description$field = value;
		}

		public function get description():String {
			return Description$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.OgRoomInfo.RoomName", "roomName", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RoomName$field:String;

		public function clearRoomName():void {
			RoomName$field = null;
		}

		public function get hasRoomName():Boolean {
			return RoomName$field != null;
		}

		public function set roomName(value:String):void {
			RoomName$field = value;
		}

		public function get roomName():String {
			return RoomName$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomRank);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomIp);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomStatus);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomMinGold);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomMaxGold);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.roomMinPlay);
			if (hasRoomType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoomType$field);
			}
			if (hasServerType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ServerType$field);
			}
			if (hasDescription) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Description$field);
			}
			if (hasRoomName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoomName$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var RoomId$count:uint = 0;
			var RoomRank$count:uint = 0;
			var RoomIp$count:uint = 0;
			var RoomPort$count:uint = 0;
			var RoomStatus$count:uint = 0;
			var RoomMinGold$count:uint = 0;
			var RoomMaxGold$count:uint = 0;
			var RoomMinPlay$count:uint = 0;
			var RoomType$count:uint = 0;
			var ServerType$count:uint = 0;
			var Description$count:uint = 0;
			var RoomName$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (RoomId$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomId cannot be set twice.');
					}
					++RoomId$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (RoomRank$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomRank cannot be set twice.');
					}
					++RoomRank$count;
					this.roomRank = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (RoomIp$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomIp cannot be set twice.');
					}
					++RoomIp$count;
					this.roomIp = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (RoomPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomPort cannot be set twice.');
					}
					++RoomPort$count;
					this.roomPort = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (RoomStatus$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomStatus cannot be set twice.');
					}
					++RoomStatus$count;
					this.roomStatus = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (RoomMinGold$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomMinGold cannot be set twice.');
					}
					++RoomMinGold$count;
					this.roomMinGold = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (RoomMaxGold$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomMaxGold cannot be set twice.');
					}
					++RoomMaxGold$count;
					this.roomMaxGold = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (RoomMinPlay$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomMinPlay cannot be set twice.');
					}
					++RoomMinPlay$count;
					this.roomMinPlay = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (RoomType$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomType cannot be set twice.');
					}
					++RoomType$count;
					this.roomType = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (ServerType$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.serverType cannot be set twice.');
					}
					++ServerType$count;
					this.serverType = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 11:
					if (Description$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.description cannot be set twice.');
					}
					++Description$count;
					this.description = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (RoomName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OgRoomInfo.roomName cannot be set twice.');
					}
					++RoomName$count;
					this.roomName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
