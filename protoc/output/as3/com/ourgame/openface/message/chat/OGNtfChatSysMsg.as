package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.OGNtfChatSysMsg.MsgType;
	import com.ourgame.openface.message.chat.Pos_Position;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGNtfChatSysMsg extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGNtfChatSysMsg.Type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGNtfChatSysMsg.MsgType);

		private var Type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			Type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			Type$field = value;
		}

		public function get type():int {
			return Type$field;
		}

		/**
		 *  @private
		 */
		public static const POS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.chat.OGNtfChatSysMsg.Pos", "pos", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.chat.Pos_Position; });

		[ArrayElementType("com.ourgame.openface.message.chat.Pos_Position")]
		public var pos:Array = [];

		/**
		 *  @private
		 */
		public static const MSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfChatSysMsg.Msg", "msg", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Msg$field:String;

		public function clearMsg():void {
			Msg$field = null;
		}

		public function get hasMsg():Boolean {
			return Msg$field != null;
		}

		public function set msg(value:String):void {
			Msg$field = value;
		}

		public function get msg():String {
			return Msg$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGNtfChatSysMsg.Time", "time", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Time$field:Int64;

		public function clearTime():void {
			Time$field = null;
		}

		public function get hasTime():Boolean {
			return Time$field != null;
		}

		public function set time(value:Int64):void {
			Time$field = value;
		}

		public function get time():Int64 {
			return Time$field;
		}

		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGNtfChatSysMsg.GameID", "gameID", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var GameID$field:int;

		public function clearGameID():void {
			hasField$0 &= 0xfffffffd;
			GameID$field = new int();
		}

		public function get hasGameID():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set gameID(value:int):void {
			hasField$0 |= 0x2;
			GameID$field = value;
		}

		public function get gameID():int {
			return GameID$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfChatSysMsg.RoleName", "roleName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RoleName$field:String;

		public function clearRoleName():void {
			RoleName$field = null;
		}

		public function get hasRoleName():Boolean {
			return RoleName$field != null;
		}

		public function set roleName(value:String):void {
			RoleName$field = value;
		}

		public function get roleName():String {
			if(!hasRoleName) {
				return "";
			}
			return RoleName$field;
		}

		/**
		 *  @private
		 */
		public static const SHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfChatSysMsg.ShowName", "showName", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ShowName$field:String;

		public function clearShowName():void {
			ShowName$field = null;
		}

		public function get hasShowName():Boolean {
			return ShowName$field != null;
		}

		public function set showName(value:String):void {
			ShowName$field = value;
		}

		public function get showName():String {
			if(!hasShowName) {
				return "";
			}
			return ShowName$field;
		}

		/**
		 *  @private
		 */
		public static const RECVROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfChatSysMsg.RecvRoleName", "recvRoleName", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RecvRoleName$field:String;

		public function clearRecvRoleName():void {
			RecvRoleName$field = null;
		}

		public function get hasRecvRoleName():Boolean {
			return RecvRoleName$field != null;
		}

		public function set recvRoleName(value:String):void {
			RecvRoleName$field = value;
		}

		public function get recvRoleName():String {
			if(!hasRecvRoleName) {
				return "";
			}
			return RecvRoleName$field;
		}

		/**
		 *  @private
		 */
		public static const RECVSHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfChatSysMsg.RecvShowName", "recvShowName", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RecvShowName$field:String;

		public function clearRecvShowName():void {
			RecvShowName$field = null;
		}

		public function get hasRecvShowName():Boolean {
			return RecvShowName$field != null;
		}

		public function set recvShowName(value:String):void {
			RecvShowName$field = value;
		}

		public function get recvShowName():String {
			if(!hasRecvShowName) {
				return "";
			}
			return RecvShowName$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNELID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGNtfChatSysMsg.ChannelID", "channelID", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ChannelID$field:int;

		public function clearChannelID():void {
			hasField$0 &= 0xfffffffb;
			ChannelID$field = new int();
		}

		public function get hasChannelID():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set channelID(value:int):void {
			hasField$0 |= 0x4;
			ChannelID$field = value;
		}

		public function get channelID():int {
			return ChannelID$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGNtfChatSysMsg.Level", "level", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffff7;
			Level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x8;
			Level$field = value;
		}

		public function get level():int {
			return Level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, Type$field);
			}
			for (var pos$index:uint = 0; pos$index < this.pos.length; ++pos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.pos[pos$index]);
			}
			if (hasMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Msg$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, Time$field);
			}
			if (hasGameID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, GameID$field);
			}
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoleName$field);
			}
			if (hasShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ShowName$field);
			}
			if (hasRecvRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RecvRoleName$field);
			}
			if (hasRecvShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RecvShowName$field);
			}
			if (hasChannelID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ChannelID$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Type$count:uint = 0;
			var Msg$count:uint = 0;
			var Time$count:uint = 0;
			var GameID$count:uint = 0;
			var RoleName$count:uint = 0;
			var ShowName$count:uint = 0;
			var RecvRoleName$count:uint = 0;
			var RecvShowName$count:uint = 0;
			var ChannelID$count:uint = 0;
			var Level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Type$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.type cannot be set twice.');
					}
					++Type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					this.pos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.chat.Pos_Position()));
					break;
				case 3:
					if (Msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.msg cannot be set twice.');
					}
					++Msg$count;
					this.msg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (Time$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.time cannot be set twice.');
					}
					++Time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (GameID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.gameID cannot be set twice.');
					}
					++GameID$count;
					this.gameID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (RoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.roleName cannot be set twice.');
					}
					++RoleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (ShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.showName cannot be set twice.');
					}
					++ShowName$count;
					this.showName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (RecvRoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.recvRoleName cannot be set twice.');
					}
					++RecvRoleName$count;
					this.recvRoleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (RecvShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.recvShowName cannot be set twice.');
					}
					++RecvShowName$count;
					this.recvShowName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (ChannelID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.channelID cannot be set twice.');
					}
					++ChannelID$count;
					this.channelID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (Level$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfChatSysMsg.level cannot be set twice.');
					}
					++Level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
