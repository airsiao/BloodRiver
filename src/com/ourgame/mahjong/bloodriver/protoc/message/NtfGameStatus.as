package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo;
	import com.ourgame.mahjong.bloodriver.protoc.message.Player;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NtfGameStatus extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:uint;

		/**
		 *  @private
		 */
		public static const GAMETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.gameType", "gameType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameType:uint;

		/**
		 *  @private
		 */
		public static const PLAYERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.players", "players", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.Player; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.Player")]
		public var players:Array = [];

		/**
		 *  @private
		 */
		public static const DEALER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.dealer", "dealer", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var dealer:uint;

		/**
		 *  @private
		 */
		public static const BASICSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.basicScore", "basicScore", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var basicScore:uint;

		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.stage", "stage", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var stage:uint;

		/**
		 *  @private
		 */
		public static const ROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.round", "round", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var round:uint;

		/**
		 *  @private
		 */
		public static const SERIAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.serial", "serial", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var serial:uint;

		/**
		 *  @private
		 */
		public static const STARTSEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.startSeat", "startSeat", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var startSeat:uint;

		/**
		 *  @private
		 */
		public static const STARTFRUSTA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.startFrusta", "startFrusta", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		public var startFrusta:uint;

		/**
		 *  @private
		 */
		public static const FRONTDREWTILES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.frontDrewTiles", "frontDrewTiles", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		public var frontDrewTiles:uint;

		/**
		 *  @private
		 */
		public static const BACKDREWTILES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.backDrewTiles", "backDrewTiles", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		public var backDrewTiles:uint;

		/**
		 *  @private
		 */
		public static const TILEINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameStatus.tileInfos", "tileInfos", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo")]
		public var tileInfos:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.gameType);
			for (var players$index:uint = 0; players$index < this.players.length; ++players$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.players[players$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.dealer);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.basicScore);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.stage);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.round);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.serial);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.startSeat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.startFrusta);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.frontDrewTiles);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.backDrewTiles);
			for (var tileInfos$index:uint = 0; tileInfos$index < this.tileInfos.length; ++tileInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.tileInfos[tileInfos$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gameId$count:uint = 0;
			var gameType$count:uint = 0;
			var dealer$count:uint = 0;
			var basicScore$count:uint = 0;
			var stage$count:uint = 0;
			var round$count:uint = 0;
			var serial$count:uint = 0;
			var startSeat$count:uint = 0;
			var startFrusta$count:uint = 0;
			var frontDrewTiles$count:uint = 0;
			var backDrewTiles$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (gameType$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.gameType cannot be set twice.');
					}
					++gameType$count;
					this.gameType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					this.players.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.Player()));
					break;
				case 4:
					if (dealer$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.dealer cannot be set twice.');
					}
					++dealer$count;
					this.dealer = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (basicScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.basicScore cannot be set twice.');
					}
					++basicScore$count;
					this.basicScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (round$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.round cannot be set twice.');
					}
					++round$count;
					this.round = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 8:
					if (serial$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.serial cannot be set twice.');
					}
					++serial$count;
					this.serial = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 9:
					if (startSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.startSeat cannot be set twice.');
					}
					++startSeat$count;
					this.startSeat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 10:
					if (startFrusta$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.startFrusta cannot be set twice.');
					}
					++startFrusta$count;
					this.startFrusta = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 11:
					if (frontDrewTiles$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.frontDrewTiles cannot be set twice.');
					}
					++frontDrewTiles$count;
					this.frontDrewTiles = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 12:
					if (backDrewTiles$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameStatus.backDrewTiles cannot be set twice.');
					}
					++backDrewTiles$count;
					this.backDrewTiles = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 13:
					this.tileInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
