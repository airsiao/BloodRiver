package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.E_Pos_CoinType;
	import flash.utils.ByteArray;
	import com.ourgame.openface.message.chat.OGReqChatLogin.E_ClientType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGReqChatLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VERSION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGReqChatLogin.Version", "version", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Version$field:Int64;

		public function clearVersion():void {
			Version$field = null;
		}

		public function get hasVersion():Boolean {
			return Version$field != null;
		}

		public function set version(value:Int64):void {
			Version$field = value;
		}

		public function get version():Int64 {
			if(!hasVersion) {
				return new Int64(0, 0);
			}
			return Version$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENTTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGReqChatLogin.ClientType", "clientType", (2 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGReqChatLogin.E_ClientType);

		private var ClientType$field:int;

		private var hasField$0:uint = 0;

		public function clearClientType():void {
			hasField$0 &= 0xfffffffe;
			ClientType$field = new int();
		}

		public function get hasClientType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientType(value:int):void {
			hasField$0 |= 0x1;
			ClientType$field = value;
		}

		public function get clientType():int {
			return ClientType$field;
		}

		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatLogin.GameID", "gameID", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GAMENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.GameName", "gameName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var GameName$field:String;

		public function clearGameName():void {
			GameName$field = null;
		}

		public function get hasGameName():Boolean {
			return GameName$field != null;
		}

		public function set gameName(value:String):void {
			GameName$field = value;
		}

		public function get gameName():String {
			return GameName$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGReqChatLogin.RoomID", "roomID", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var RoomID$field:Int64;

		public function clearRoomID():void {
			RoomID$field = null;
		}

		public function get hasRoomID():Boolean {
			return RoomID$field != null;
		}

		public function set roomID(value:Int64):void {
			RoomID$field = value;
		}

		public function get roomID():Int64 {
			if(!hasRoomID) {
				return new Int64(0, 0);
			}
			return RoomID$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.RoomName", "roomName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if(!hasRoomName) {
				return "";
			}
			return RoomName$field;
		}

		/**
		 *  @private
		 */
		public static const TABLEGUID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.TableGUID", "tableGUID", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var TableGUID$field:String;

		public function clearTableGUID():void {
			TableGUID$field = null;
		}

		public function get hasTableGUID():Boolean {
			return TableGUID$field != null;
		}

		public function set tableGUID(value:String):void {
			TableGUID$field = value;
		}

		public function get tableGUID():String {
			if(!hasTableGUID) {
				return "";
			}
			return TableGUID$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.RoleName", "roleName", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			return RoleName$field;
		}

		/**
		 *  @private
		 */
		public static const SHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.ShowName", "showName", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const CERTSTREAM:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("com.ourgame.openface.message.chat.OGReqChatLogin.CertStream", "certStream", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var CertStream$field:flash.utils.ByteArray;

		public function clearCertStream():void {
			CertStream$field = null;
		}

		public function get hasCertStream():Boolean {
			return CertStream$field != null;
		}

		public function set certStream(value:flash.utils.ByteArray):void {
			CertStream$field = value;
		}

		public function get certStream():flash.utils.ByteArray {
			return CertStream$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMSVRIP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.RoomSvrIP", "roomSvrIP", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RoomSvrIP$field:String;

		public function clearRoomSvrIP():void {
			RoomSvrIP$field = null;
		}

		public function get hasRoomSvrIP():Boolean {
			return RoomSvrIP$field != null;
		}

		public function set roomSvrIP(value:String):void {
			RoomSvrIP$field = value;
		}

		public function get roomSvrIP():String {
			if(!hasRoomSvrIP) {
				return "";
			}
			return RoomSvrIP$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMSVRPORT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatLogin.RoomSvrPort", "roomSvrPort", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var RoomSvrPort$field:int;

		public function clearRoomSvrPort():void {
			hasField$0 &= 0xfffffffb;
			RoomSvrPort$field = new int();
		}

		public function get hasRoomSvrPort():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set roomSvrPort(value:int):void {
			hasField$0 |= 0x4;
			RoomSvrPort$field = value;
		}

		public function get roomSvrPort():int {
			if(!hasRoomSvrPort) {
				return -1;
			}
			return RoomSvrPort$field;
		}

		/**
		 *  @private
		 */
		public static const ENTERMSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.EnterMsg", "enterMsg", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var EnterMsg$field:String;

		public function clearEnterMsg():void {
			EnterMsg$field = null;
		}

		public function get hasEnterMsg():Boolean {
			return EnterMsg$field != null;
		}

		public function set enterMsg(value:String):void {
			EnterMsg$field = value;
		}

		public function get enterMsg():String {
			if(!hasEnterMsg) {
				return "";
			}
			return EnterMsg$field;
		}

		/**
		 *  @private
		 */
		public static const LEAVEMSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.LeaveMsg", "leaveMsg", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var LeaveMsg$field:String;

		public function clearLeaveMsg():void {
			LeaveMsg$field = null;
		}

		public function get hasLeaveMsg():Boolean {
			return LeaveMsg$field != null;
		}

		public function set leaveMsg(value:String):void {
			LeaveMsg$field = value;
		}

		public function get leaveMsg():String {
			if(!hasLeaveMsg) {
				return "";
			}
			return LeaveMsg$field;
		}

		/**
		 *  @private
		 */
		public static const GROUPID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatLogin.GroupID", "groupID", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var GroupID$field:int;

		public function clearGroupID():void {
			hasField$0 &= 0xfffffff7;
			GroupID$field = new int();
		}

		public function get hasGroupID():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set groupID(value:int):void {
			hasField$0 |= 0x8;
			GroupID$field = value;
		}

		public function get groupID():int {
			if(!hasGroupID) {
				return 0;
			}
			return GroupID$field;
		}

		/**
		 *  @private
		 */
		public static const GROUPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatLogin.GroupName", "groupName", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var GroupName$field:String;

		public function clearGroupName():void {
			GroupName$field = null;
		}

		public function get hasGroupName():Boolean {
			return GroupName$field != null;
		}

		public function set groupName(value:String):void {
			GroupName$field = value;
		}

		public function get groupName():String {
			if(!hasGroupName) {
				return "";
			}
			return GroupName$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNELID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatLogin.ChannelID", "channelID", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ChannelID$field:int;

		public function clearChannelID():void {
			hasField$0 &= 0xffffffef;
			ChannelID$field = new int();
		}

		public function get hasChannelID():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set channelID(value:int):void {
			hasField$0 |= 0x10;
			ChannelID$field = value;
		}

		public function get channelID():int {
			return ChannelID$field;
		}

		/**
		 *  @private
		 */
		public static const COINTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGReqChatLogin.CoinType", "coinType", (18 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.E_Pos_CoinType);

		private var CoinType$field:int;

		public function clearCoinType():void {
			hasField$0 &= 0xffffffdf;
			CoinType$field = new int();
		}

		public function get hasCoinType():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set coinType(value:int):void {
			hasField$0 |= 0x20;
			CoinType$field = value;
		}

		public function get coinType():int {
			return CoinType$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMCHANNELID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatLogin.RoomChannelID", "roomChannelID", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var RoomChannelID$field:int;

		public function clearRoomChannelID():void {
			hasField$0 &= 0xffffffbf;
			RoomChannelID$field = new int();
		}

		public function get hasRoomChannelID():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set roomChannelID(value:int):void {
			hasField$0 |= 0x40;
			RoomChannelID$field = value;
		}

		public function get roomChannelID():int {
			if(!hasRoomChannelID) {
				return -1;
			}
			return RoomChannelID$field;
		}

		/**
		 *  @private
		 */
		public static const USESHOWNAME:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.chat.OGReqChatLogin.UseShowName", "useShowName", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var UseShowName$field:Boolean;

		public function clearUseShowName():void {
			hasField$0 &= 0xffffff7f;
			UseShowName$field = new Boolean();
		}

		public function get hasUseShowName():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set useShowName(value:Boolean):void {
			hasField$0 |= 0x80;
			UseShowName$field = value;
		}

		public function get useShowName():Boolean {
			if(!hasUseShowName) {
				return false;
			}
			return UseShowName$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, Version$field);
			}
			if (hasClientType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, ClientType$field);
			}
			if (hasGameID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, GameID$field);
			}
			if (hasGameName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, GameName$field);
			}
			if (hasRoomID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, RoomID$field);
			}
			if (hasRoomName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoomName$field);
			}
			if (hasTableGUID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, TableGUID$field);
			}
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoleName$field);
			}
			if (hasShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ShowName$field);
			}
			if (hasCertStream) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, CertStream$field);
			}
			if (hasRoomSvrIP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoomSvrIP$field);
			}
			if (hasRoomSvrPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, RoomSvrPort$field);
			}
			if (hasEnterMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, EnterMsg$field);
			}
			if (hasLeaveMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, LeaveMsg$field);
			}
			if (hasGroupID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, GroupID$field);
			}
			if (hasGroupName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, GroupName$field);
			}
			if (hasChannelID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ChannelID$field);
			}
			if (hasCoinType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, CoinType$field);
			}
			if (hasRoomChannelID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, RoomChannelID$field);
			}
			if (hasUseShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, UseShowName$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Version$count:uint = 0;
			var ClientType$count:uint = 0;
			var GameID$count:uint = 0;
			var GameName$count:uint = 0;
			var RoomID$count:uint = 0;
			var RoomName$count:uint = 0;
			var TableGUID$count:uint = 0;
			var RoleName$count:uint = 0;
			var ShowName$count:uint = 0;
			var CertStream$count:uint = 0;
			var RoomSvrIP$count:uint = 0;
			var RoomSvrPort$count:uint = 0;
			var EnterMsg$count:uint = 0;
			var LeaveMsg$count:uint = 0;
			var GroupID$count:uint = 0;
			var GroupName$count:uint = 0;
			var ChannelID$count:uint = 0;
			var CoinType$count:uint = 0;
			var RoomChannelID$count:uint = 0;
			var UseShowName$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Version$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.version cannot be set twice.');
					}
					++Version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (ClientType$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.clientType cannot be set twice.');
					}
					++ClientType$count;
					this.clientType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (GameID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.gameID cannot be set twice.');
					}
					++GameID$count;
					this.gameID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (GameName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.gameName cannot be set twice.');
					}
					++GameName$count;
					this.gameName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (RoomID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roomID cannot be set twice.');
					}
					++RoomID$count;
					this.roomID = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (RoomName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roomName cannot be set twice.');
					}
					++RoomName$count;
					this.roomName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (TableGUID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.tableGUID cannot be set twice.');
					}
					++TableGUID$count;
					this.tableGUID = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (RoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roleName cannot be set twice.');
					}
					++RoleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (ShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.showName cannot be set twice.');
					}
					++ShowName$count;
					this.showName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (CertStream$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.certStream cannot be set twice.');
					}
					++CertStream$count;
					this.certStream = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 11:
					if (RoomSvrIP$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roomSvrIP cannot be set twice.');
					}
					++RoomSvrIP$count;
					this.roomSvrIP = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (RoomSvrPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roomSvrPort cannot be set twice.');
					}
					++RoomSvrPort$count;
					this.roomSvrPort = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (EnterMsg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.enterMsg cannot be set twice.');
					}
					++EnterMsg$count;
					this.enterMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 14:
					if (LeaveMsg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.leaveMsg cannot be set twice.');
					}
					++LeaveMsg$count;
					this.leaveMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 15:
					if (GroupID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.groupID cannot be set twice.');
					}
					++GroupID$count;
					this.groupID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (GroupName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.groupName cannot be set twice.');
					}
					++GroupName$count;
					this.groupName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 17:
					if (ChannelID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.channelID cannot be set twice.');
					}
					++ChannelID$count;
					this.channelID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 18:
					if (CoinType$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.coinType cannot be set twice.');
					}
					++CoinType$count;
					this.coinType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 19:
					if (RoomChannelID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.roomChannelID cannot be set twice.');
					}
					++RoomChannelID$count;
					this.roomChannelID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 20:
					if (UseShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatLogin.useShowName cannot be set twice.');
					}
					++UseShowName$count;
					this.useShowName = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
