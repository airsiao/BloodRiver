package com.ourgame.openface.message.lobby {
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
	public dynamic final class ReqLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.username", "username", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var username:String;

		/**
		 *  @private
		 */
		public static const NICKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.nickname", "nickname", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var nickname$field:String;

		public function clearNickname():void {
			nickname$field = null;
		}

		public function get hasNickname():Boolean {
			return nickname$field != null;
		}

		public function set nickname(value:String):void {
			nickname$field = value;
		}

		public function get nickname():String {
			return nickname$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.rolename", "rolename", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rolename$field:String;

		public function clearRolename():void {
			rolename$field = null;
		}

		public function get hasRolename():Boolean {
			return rolename$field != null;
		}

		public function set rolename(value:String):void {
			rolename$field = value;
		}

		public function get rolename():String {
			return rolename$field;
		}

		/**
		 *  @private
		 */
		public static const OURGAMEID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.ourgameId", "ourgameId", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ourgameId$field:String;

		public function clearOurgameId():void {
			ourgameId$field = null;
		}

		public function get hasOurgameId():Boolean {
			return ourgameId$field != null;
		}

		public function set ourgameId(value:String):void {
			ourgameId$field = value;
		}

		public function get ourgameId():String {
			return ourgameId$field;
		}

		/**
		 *  @private
		 */
		public static const LOADERURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.loaderURL", "loaderURL", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var loaderURL$field:String;

		public function clearLoaderURL():void {
			loaderURL$field = null;
		}

		public function get hasLoaderURL():Boolean {
			return loaderURL$field != null;
		}

		public function set loaderURL(value:String):void {
			loaderURL$field = value;
		}

		public function get loaderURL():String {
			return loaderURL$field;
		}

		/**
		 *  @private
		 */
		public static const TICKET:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.ticket", "ticket", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ticket$field:String;

		public function clearTicket():void {
			ticket$field = null;
		}

		public function get hasTicket():Boolean {
			return ticket$field != null;
		}

		public function set ticket(value:String):void {
			ticket$field = value;
		}

		public function get ticket():String {
			return ticket$field;
		}

		/**
		 *  @private
		 */
		public static const FORCE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.lobby.ReqLogin.force", "force", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var force$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearForce():void {
			hasField$0 &= 0xfffffffe;
			force$field = new Boolean();
		}

		public function get hasForce():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set force(value:Boolean):void {
			hasField$0 |= 0x1;
			force$field = value;
		}

		public function get force():Boolean {
			return force$field;
		}

		/**
		 *  @private
		 */
		public static const HEADIMAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.headImage", "headImage", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var headImage$field:String;

		public function clearHeadImage():void {
			headImage$field = null;
		}

		public function get hasHeadImage():Boolean {
			return headImage$field != null;
		}

		public function set headImage(value:String):void {
			headImage$field = value;
		}

		public function get headImage():String {
			return headImage$field;
		}

		/**
		 *  @private
		 */
		public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.ReqLogin.version", "version", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var version$field:uint;

		public function clearVersion():void {
			hasField$0 &= 0xfffffffd;
			version$field = new uint();
		}

		public function get hasVersion():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set version(value:uint):void {
			hasField$0 |= 0x2;
			version$field = value;
		}

		public function get version():uint {
			return version$field;
		}

		/**
		 *  @private
		 */
		public static const GENDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.ReqLogin.gender", "gender", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gender$field:uint;

		public function clearGender():void {
			hasField$0 &= 0xfffffffb;
			gender$field = new uint();
		}

		public function get hasGender():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set gender(value:uint):void {
			hasField$0 |= 0x4;
			gender$field = value;
		}

		public function get gender():uint {
			return gender$field;
		}

		/**
		 *  @private
		 */
		public static const SESSIONKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.ReqLogin.sessionKey", "sessionKey", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sessionKey$field:String;

		public function clearSessionKey():void {
			sessionKey$field = null;
		}

		public function get hasSessionKey():Boolean {
			return sessionKey$field != null;
		}

		public function set sessionKey(value:String):void {
			sessionKey$field = value;
		}

		public function get sessionKey():String {
			return sessionKey$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.ReqLogin.channelId", "channelId", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var channelId$field:uint;

		public function clearChannelId():void {
			hasField$0 &= 0xfffffff7;
			channelId$field = new uint();
		}

		public function get hasChannelId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set channelId(value:uint):void {
			hasField$0 |= 0x8;
			channelId$field = value;
		}

		public function get channelId():uint {
			return channelId$field;
		}

		/**
		 *  @private
		 */
		public static const ANTIADDICT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.lobby.ReqLogin.antiAddict", "antiAddict", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var antiAddict$field:Boolean;

		public function clearAntiAddict():void {
			hasField$0 &= 0xffffffef;
			antiAddict$field = new Boolean();
		}

		public function get hasAntiAddict():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set antiAddict(value:Boolean):void {
			hasField$0 |= 0x10;
			antiAddict$field = value;
		}

		public function get antiAddict():Boolean {
			return antiAddict$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.username);
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, nickname$field);
			}
			if (hasRolename) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rolename$field);
			}
			if (hasOurgameId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ourgameId$field);
			}
			if (hasLoaderURL) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, loaderURL$field);
			}
			if (hasTicket) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ticket$field);
			}
			if (hasForce) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, force$field);
			}
			if (hasHeadImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, headImage$field);
			}
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, version$field);
			}
			if (hasGender) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, gender$field);
			}
			if (hasSessionKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, sessionKey$field);
			}
			if (hasChannelId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, channelId$field);
			}
			if (hasAntiAddict) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, antiAddict$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var username$count:uint = 0;
			var nickname$count:uint = 0;
			var rolename$count:uint = 0;
			var ourgameId$count:uint = 0;
			var loaderURL$count:uint = 0;
			var ticket$count:uint = 0;
			var force$count:uint = 0;
			var headImage$count:uint = 0;
			var version$count:uint = 0;
			var gender$count:uint = 0;
			var sessionKey$count:uint = 0;
			var channelId$count:uint = 0;
			var antiAddict$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (username$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.username cannot be set twice.');
					}
					++username$count;
					this.username = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (rolename$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.rolename cannot be set twice.');
					}
					++rolename$count;
					this.rolename = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (ourgameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.ourgameId cannot be set twice.');
					}
					++ourgameId$count;
					this.ourgameId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (loaderURL$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.loaderURL cannot be set twice.');
					}
					++loaderURL$count;
					this.loaderURL = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (ticket$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.ticket cannot be set twice.');
					}
					++ticket$count;
					this.ticket = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (force$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.force cannot be set twice.');
					}
					++force$count;
					this.force = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					if (headImage$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.headImage cannot be set twice.');
					}
					++headImage$count;
					this.headImage = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (version$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.version cannot be set twice.');
					}
					++version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 10:
					if (gender$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.gender cannot be set twice.');
					}
					++gender$count;
					this.gender = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 11:
					if (sessionKey$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.sessionKey cannot be set twice.');
					}
					++sessionKey$count;
					this.sessionKey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (channelId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.channelId cannot be set twice.');
					}
					++channelId$count;
					this.channelId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 13:
					if (antiAddict$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLogin.antiAddict cannot be set twice.');
					}
					++antiAddict$count;
					this.antiAddict = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
