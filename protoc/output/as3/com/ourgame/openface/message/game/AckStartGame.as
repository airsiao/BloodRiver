package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.Player;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckStartGame extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.game.AckStartGame.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:UInt64;

		/**
		 *  @private
		 */
		public static const DEALERSEAT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.game.AckStartGame.dealerSeat", "dealerSeat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var dealerSeat:int;

		/**
		 *  @private
		 */
		public static const PLAYERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.AckStartGame.players", "players", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.Player; });

		[ArrayElementType("com.ourgame.openface.message.game.Player")]
		public var players:Array = [];

		/**
		 *  @private
		 */
		public static const CONFIG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.game.AckStartGame.config", "config", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var config$field:String;

		public function clearConfig():void {
			config$field = null;
		}

		public function get hasConfig():Boolean {
			return config$field != null;
		}

		public function set config(value:String):void {
			config$field = value;
		}

		public function get config():String {
			return config$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.dealerSeat);
			for (var players$index:uint = 0; players$index < this.players.length; ++players$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.players[players$index]);
			}
			if (hasConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, config$field);
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
			var dealerSeat$count:uint = 0;
			var config$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStartGame.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (dealerSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStartGame.dealerSeat cannot be set twice.');
					}
					++dealerSeat$count;
					this.dealerSeat = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					this.players.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.Player()));
					break;
				case 4:
					if (config$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStartGame.config cannot be set twice.');
					}
					++config$count;
					this.config = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
