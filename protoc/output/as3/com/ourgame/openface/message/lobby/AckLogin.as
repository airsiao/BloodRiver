package com.ourgame.openface.message.lobby {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.lobby.GameInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckLogin.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var result:uint;

		/**
		 *  @private
		 */
		public static const FAILREASON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckLogin.failReason", "failReason", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var failReason$field:String;

		public function clearFailReason():void {
			failReason$field = null;
		}

		public function get hasFailReason():Boolean {
			return failReason$field != null;
		}

		public function set failReason(value:String):void {
			failReason$field = value;
		}

		public function get failReason():String {
			return failReason$field;
		}

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.lobby.AckLogin.userId", "userId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userId$field:UInt64;

		public function clearUserId():void {
			userId$field = null;
		}

		public function get hasUserId():Boolean {
			return userId$field != null;
		}

		public function set userId(value:UInt64):void {
			userId$field = value;
		}

		public function get userId():UInt64 {
			return userId$field;
		}

		/**
		 *  @private
		 */
		public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckLogin.username", "username", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var username$field:String;

		public function clearUsername():void {
			username$field = null;
		}

		public function get hasUsername():Boolean {
			return username$field != null;
		}

		public function set username(value:String):void {
			username$field = value;
		}

		public function get username():String {
			return username$field;
		}

		/**
		 *  @private
		 */
		public static const NICKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckLogin.nickname", "nickname", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckLogin.rolename", "rolename", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const MONEY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckLogin.money", "money", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:uint;

		private var hasField$0:uint = 0;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffe;
			money$field = new uint();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set money(value:uint):void {
			hasField$0 |= 0x1;
			money$field = value;
		}

		public function get money():uint {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckLogin.experience", "experience", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var experience$field:uint;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffd;
			experience$field = new uint();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set experience(value:uint):void {
			hasField$0 |= 0x2;
			experience$field = value;
		}

		public function get experience():uint {
			return experience$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckLogin.level", "level", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:uint;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			level$field = new uint();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:uint):void {
			hasField$0 |= 0x4;
			level$field = value;
		}

		public function get level():uint {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const MASTERSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckLogin.masterScore", "masterScore", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var masterScore$field:uint;

		public function clearMasterScore():void {
			hasField$0 &= 0xfffffff7;
			masterScore$field = new uint();
		}

		public function get hasMasterScore():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set masterScore(value:uint):void {
			hasField$0 |= 0x8;
			masterScore$field = value;
		}

		public function get masterScore():uint {
			return masterScore$field;
		}

		/**
		 *  @private
		 */
		public static const SESSIONKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckLogin.sessionKey", "sessionKey", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const GAMES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.lobby.AckLogin.games", "games", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.lobby.GameInfo; });

		[ArrayElementType("com.ourgame.openface.message.lobby.GameInfo")]
		public var games:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.result);
			if (hasFailReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, failReason$field);
			}
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, userId$field);
			}
			if (hasUsername) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, username$field);
			}
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, nickname$field);
			}
			if (hasRolename) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rolename$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, money$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, experience$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, level$field);
			}
			if (hasMasterScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, masterScore$field);
			}
			if (hasSessionKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, sessionKey$field);
			}
			for (var games$index:uint = 0; games$index < this.games.length; ++games$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.games[games$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var result$count:uint = 0;
			var failReason$count:uint = 0;
			var userId$count:uint = 0;
			var username$count:uint = 0;
			var nickname$count:uint = 0;
			var rolename$count:uint = 0;
			var money$count:uint = 0;
			var experience$count:uint = 0;
			var level$count:uint = 0;
			var masterScore$count:uint = 0;
			var sessionKey$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (failReason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.failReason cannot be set twice.');
					}
					++failReason$count;
					this.failReason = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (username$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.username cannot be set twice.');
					}
					++username$count;
					this.username = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (rolename$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.rolename cannot be set twice.');
					}
					++rolename$count;
					this.rolename = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 8:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 9:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 10:
					if (masterScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.masterScore cannot be set twice.');
					}
					++masterScore$count;
					this.masterScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 11:
					if (sessionKey$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckLogin.sessionKey cannot be set twice.');
					}
					++sessionKey$count;
					this.sessionKey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					this.games.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.lobby.GameInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
