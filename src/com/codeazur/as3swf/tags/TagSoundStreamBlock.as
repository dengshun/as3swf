﻿package com.codeazur.as3swf.tags
{
	import com.codeazur.as3swf.SWFData;
	
	import flash.utils.ByteArray;
	
	public class TagSoundStreamBlock extends Tag implements ITag
	{
		public static const TYPE:uint = 19;
		
		protected var _soundData:ByteArray;
		
		public function TagSoundStreamBlock() {
			_soundData = new ByteArray();
		}
		
		public function get soundData():ByteArray { return _soundData; }
		
		public function parse(data:SWFData, length:uint):void {
			data.readBytes(_soundData, 0, length)
		}
		
		public function publish(data:SWFData):void {
			throw(new Error("TODO: implement publish()"));
		}
		
		override public function get type():uint { return TYPE; }
		override public function get name():String { return "SoundStreamBlock"; }
		
		public function toString(indent:uint = 0):String {
			return toStringMain(indent);
		}
	}
}
