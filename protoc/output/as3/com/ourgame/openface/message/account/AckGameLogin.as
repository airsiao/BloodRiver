package com.ourgame.openface.message.account {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.account.JssInfo;
	import com.ourgame.openface.message.account.OgRoomInfo;
	import flash.utils.ByteArray;
	import com.ourgame.openface.message.account.OgBulletinInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckGameLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var result:int;

		/**
		 *  @private
		 */
		public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.userName", "userName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var userName$field:String;

		public function clearUserName():void {
			userName$field = null;
		}

		public function get hasUserName():Boolean {
			return userName$field != null;
		}

		public function set userName(value:String):void {
			userName$field = value;
		}

		public function get userName():String {
			return userName$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.roleName", "roleName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var roleName$field:String;

		public function clearRoleName():void {
			roleName$field = null;
		}

		public function get hasRoleName():Boolean {
			return roleName$field != null;
		}

		public function set roleName(value:String):void {
			roleName$field = value;
		}

		public function get roleName():String {
			return roleName$field;
		}

		/**
		 *  @private
		 */
		public static const COIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.coin", "coin", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var coin$field:int;

		private var hasField$0:uint = 0;

		public function clearCoin():void {
			hasField$0 &= 0xfffffffe;
			coin$field = new int();
		}

		public function get hasCoin():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set coin(value:int):void {
			hasField$0 |= 0x1;
			coin$field = value;
		}

		public function get coin():int {
			return coin$field;
		}

		/**
		 *  @private
		 */
		public static const GAMECOIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.gameCoin", "gameCoin", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gameCoin$field:int;

		public function clearGameCoin():void {
			hasField$0 &= 0xfffffffd;
			gameCoin$field = new int();
		}

		public function get hasGameCoin():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set gameCoin(value:int):void {
			hasField$0 |= 0x2;
			gameCoin$field = value;
		}

		public function get gameCoin():int {
			return gameCoin$field;
		}

		/**
		 *  @private
		 */
		public static const CERTHAVEROLE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("com.ourgame.openface.message.account.AckGameLogin.certHaveRole", "certHaveRole", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var certHaveRole$field:flash.utils.ByteArray;

		public function clearCertHaveRole():void {
			certHaveRole$field = null;
		}

		public function get hasCertHaveRole():Boolean {
			return certHaveRole$field != null;
		}

		public function set certHaveRole(value:flash.utils.ByteArray):void {
			certHaveRole$field = value;
		}

		public function get certHaveRole():flash.utils.ByteArray {
			return certHaveRole$field;
		}

		/**
		 *  @private
		 */
		public static const CERTNOROLE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("com.ourgame.openface.message.account.AckGameLogin.certNoRole", "certNoRole", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var certNoRole$field:flash.utils.ByteArray;

		public function clearCertNoRole():void {
			certNoRole$field = null;
		}

		public function get hasCertNoRole():Boolean {
			return certNoRole$field != null;
		}

		public function set certNoRole(value:flash.utils.ByteArray):void {
			certNoRole$field = value;
		}

		public function get certNoRole():flash.utils.ByteArray {
			return certNoRole$field;
		}

		/**
		 *  @private
		 */
		public static const CURVERSION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.curVersion", "curVersion", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var curVersion$field:int;

		public function clearCurVersion():void {
			hasField$0 &= 0xfffffffb;
			curVersion$field = new int();
		}

		public function get hasCurVersion():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set curVersion(value:int):void {
			hasField$0 |= 0x4;
			curVersion$field = value;
		}

		public function get curVersion():int {
			return curVersion$field;
		}

		/**
		 *  @private
		 */
		public static const PLAYENABLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.playEnable", "playEnable", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var playEnable$field:String;

		public function clearPlayEnable():void {
			playEnable$field = null;
		}

		public function get hasPlayEnable():Boolean {
			return playEnable$field != null;
		}

		public function set playEnable(value:String):void {
			playEnable$field = value;
		}

		public function get playEnable():String {
			return playEnable$field;
		}

		/**
		 *  @private
		 */
		public static const DOWNLOADURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.downloadUrl", "downloadUrl", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var downloadUrl$field:String;

		public function clearDownloadUrl():void {
			downloadUrl$field = null;
		}

		public function get hasDownloadUrl():Boolean {
			return downloadUrl$field != null;
		}

		public function set downloadUrl(value:String):void {
			downloadUrl$field = value;
		}

		public function get downloadUrl():String {
			return downloadUrl$field;
		}

		/**
		 *  @private
		 */
		public static const IFSTOPSERVICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.ifStopService", "ifStopService", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ifStopService$field:String;

		public function clearIfStopService():void {
			ifStopService$field = null;
		}

		public function get hasIfStopService():Boolean {
			return ifStopService$field != null;
		}

		public function set ifStopService(value:String):void {
			ifStopService$field = value;
		}

		public function get ifStopService():String {
			return ifStopService$field;
		}

		/**
		 *  @private
		 */
		public static const STOPSERVICEMSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.stopServiceMsg", "stopServiceMsg", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var stopServiceMsg$field:String;

		public function clearStopServiceMsg():void {
			stopServiceMsg$field = null;
		}

		public function get hasStopServiceMsg():Boolean {
			return stopServiceMsg$field != null;
		}

		public function set stopServiceMsg(value:String):void {
			stopServiceMsg$field = value;
		}

		public function get stopServiceMsg():String {
			return stopServiceMsg$field;
		}

		/**
		 *  @private
		 */
		public static const DOWNLOADREASON:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.downloadReason", "downloadReason", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var downloadReason$field:int;

		public function clearDownloadReason():void {
			hasField$0 &= 0xfffffff7;
			downloadReason$field = new int();
		}

		public function get hasDownloadReason():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set downloadReason(value:int):void {
			hasField$0 |= 0x8;
			downloadReason$field = value;
		}

		public function get downloadReason():int {
			return downloadReason$field;
		}

		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.gameId", "gameId", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gameId$field:int;

		public function clearGameId():void {
			hasField$0 &= 0xffffffef;
			gameId$field = new int();
		}

		public function get hasGameId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set gameId(value:int):void {
			hasField$0 |= 0x10;
			gameId$field = value;
		}

		public function get gameId():int {
			return gameId$field;
		}

		/**
		 *  @private
		 */
		public static const MATCHSVRLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.account.AckGameLogin.matchSvrList", "matchSvrList", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.account.OgRoomInfo; });

		[ArrayElementType("com.ourgame.openface.message.account.OgRoomInfo")]
		public var matchSvrList:Array = [];

		/**
		 *  @private
		 */
		public static const PAYJSSLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.account.AckGameLogin.payJssList", "payJssList", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.account.JssInfo; });

		[ArrayElementType("com.ourgame.openface.message.account.JssInfo")]
		public var payJssList:Array = [];

		/**
		 *  @private
		 */
		public static const GAMEJSSLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.account.AckGameLogin.gameJssList", "gameJssList", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.account.JssInfo; });

		[ArrayElementType("com.ourgame.openface.message.account.JssInfo")]
		public var gameJssList:Array = [];

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.AckGameLogin.sex", "sex", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xffffffdf;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x20;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const IFDISPLAYSEARCH:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.ifDisplaySearch", "ifDisplaySearch", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ifDisplaySearch$field:String;

		public function clearIfDisplaySearch():void {
			ifDisplaySearch$field = null;
		}

		public function get hasIfDisplaySearch():Boolean {
			return ifDisplaySearch$field != null;
		}

		public function set ifDisplaySearch(value:String):void {
			ifDisplaySearch$field = value;
		}

		public function get ifDisplaySearch():String {
			return ifDisplaySearch$field;
		}

		/**
		 *  @private
		 */
		public static const BULLETINLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.account.AckGameLogin.bulletinList", "bulletinList", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.account.OgBulletinInfo; });

		[ArrayElementType("com.ourgame.openface.message.account.OgBulletinInfo")]
		public var bulletinList:Array = [];

		/**
		 *  @private
		 */
		public static const VERSIONINFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.versionInfo", "versionInfo", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var versionInfo$field:String;

		public function clearVersionInfo():void {
			versionInfo$field = null;
		}

		public function get hasVersionInfo():Boolean {
			return versionInfo$field != null;
		}

		public function set versionInfo(value:String):void {
			versionInfo$field = value;
		}

		public function get versionInfo():String {
			return versionInfo$field;
		}

		/**
		 *  @private
		 */
		public static const USERMSGURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.AckGameLogin.userMsgUrl", "userMsgUrl", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var userMsgUrl$field:String;

		public function clearUserMsgUrl():void {
			userMsgUrl$field = null;
		}

		public function get hasUserMsgUrl():Boolean {
			return userMsgUrl$field != null;
		}

		public function set userMsgUrl(value:String):void {
			userMsgUrl$field = value;
		}

		public function get userMsgUrl():String {
			return userMsgUrl$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.result);
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, userName$field);
			}
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, roleName$field);
			}
			if (hasCoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, coin$field);
			}
			if (hasGameCoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gameCoin$field);
			}
			if (hasCertHaveRole) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, certHaveRole$field);
			}
			if (hasCertNoRole) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, certNoRole$field);
			}
			if (hasCurVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, curVersion$field);
			}
			if (hasPlayEnable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, playEnable$field);
			}
			if (hasDownloadUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, downloadUrl$field);
			}
			if (hasIfStopService) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ifStopService$field);
			}
			if (hasStopServiceMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, stopServiceMsg$field);
			}
			if (hasDownloadReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, downloadReason$field);
			}
			if (hasGameId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gameId$field);
			}
			for (var matchSvrList$index:uint = 0; matchSvrList$index < this.matchSvrList.length; ++matchSvrList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.matchSvrList[matchSvrList$index]);
			}
			for (var payJssList$index:uint = 0; payJssList$index < this.payJssList.length; ++payJssList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.payJssList[payJssList$index]);
			}
			for (var gameJssList$index:uint = 0; gameJssList$index < this.gameJssList.length; ++gameJssList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.gameJssList[gameJssList$index]);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sex$field);
			}
			if (hasIfDisplaySearch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ifDisplaySearch$field);
			}
			for (var bulletinList$index:uint = 0; bulletinList$index < this.bulletinList.length; ++bulletinList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.bulletinList[bulletinList$index]);
			}
			if (hasVersionInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, versionInfo$field);
			}
			if (hasUserMsgUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, userMsgUrl$field);
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
			var userName$count:uint = 0;
			var roleName$count:uint = 0;
			var coin$count:uint = 0;
			var gameCoin$count:uint = 0;
			var certHaveRole$count:uint = 0;
			var certNoRole$count:uint = 0;
			var curVersion$count:uint = 0;
			var playEnable$count:uint = 0;
			var downloadUrl$count:uint = 0;
			var ifStopService$count:uint = 0;
			var stopServiceMsg$count:uint = 0;
			var downloadReason$count:uint = 0;
			var gameId$count:uint = 0;
			var sex$count:uint = 0;
			var ifDisplaySearch$count:uint = 0;
			var versionInfo$count:uint = 0;
			var userMsgUrl$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (userName$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.userName cannot be set twice.');
					}
					++userName$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (roleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.roleName cannot be set twice.');
					}
					++roleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (coin$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.coin cannot be set twice.');
					}
					++coin$count;
					this.coin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (gameCoin$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.gameCoin cannot be set twice.');
					}
					++gameCoin$count;
					this.gameCoin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (certHaveRole$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.certHaveRole cannot be set twice.');
					}
					++certHaveRole$count;
					this.certHaveRole = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 7:
					if (certNoRole$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.certNoRole cannot be set twice.');
					}
					++certNoRole$count;
					this.certNoRole = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 8:
					if (curVersion$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.curVersion cannot be set twice.');
					}
					++curVersion$count;
					this.curVersion = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (playEnable$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.playEnable cannot be set twice.');
					}
					++playEnable$count;
					this.playEnable = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (downloadUrl$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.downloadUrl cannot be set twice.');
					}
					++downloadUrl$count;
					this.downloadUrl = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 11:
					if (ifStopService$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.ifStopService cannot be set twice.');
					}
					++ifStopService$count;
					this.ifStopService = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (stopServiceMsg$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.stopServiceMsg cannot be set twice.');
					}
					++stopServiceMsg$count;
					this.stopServiceMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 13:
					if (downloadReason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.downloadReason cannot be set twice.');
					}
					++downloadReason$count;
					this.downloadReason = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					this.matchSvrList.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.account.OgRoomInfo()));
					break;
				case 16:
					this.payJssList.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.account.JssInfo()));
					break;
				case 17:
					this.gameJssList.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.account.JssInfo()));
					break;
				case 18:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 19:
					if (ifDisplaySearch$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.ifDisplaySearch cannot be set twice.');
					}
					++ifDisplaySearch$count;
					this.ifDisplaySearch = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 20:
					this.bulletinList.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.account.OgBulletinInfo()));
					break;
				case 21:
					if (versionInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.versionInfo cannot be set twice.');
					}
					++versionInfo$count;
					this.versionInfo = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 22:
					if (userMsgUrl$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameLogin.userMsgUrl cannot be set twice.');
					}
					++userMsgUrl$count;
					this.userMsgUrl = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
