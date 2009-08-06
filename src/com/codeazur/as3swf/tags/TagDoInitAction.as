﻿package com.codeazur.as3swf.tags
{
	import com.codeazur.as3swf.SWFData;
	import com.codeazur.as3swf.data.actions.IAction;
	import com.codeazur.utils.StringUtils;
	
	public class TagDoInitAction extends TagDoAction implements ITag
	{
		public static const TYPE:uint = 59;
		
		public var spriteId:uint;
		
		public function TagDoInitAction() {}
		
		override public function parse(data:SWFData, length:uint):void {
			spriteId = data.readUI16();
			var action:IAction;
			while ((action = data.readACTIONRECORD()) != null) {
				_records.push(action);
			}
		}

		override public function publish(data:SWFData):void {
			throw(new Error("TODO: implement publish()"));
		}
		
		override public function get type():uint { return TYPE; }
		override public function get name():String { return "DoInitAction"; }
		
		override public function toString(indent:uint = 0):String {
			var str:String = toStringMain(indent) +
				"SpriteID: " +spriteId + ", ";
				"Records: " + _records.length;
			for (var i:uint = 0; i < _records.length; i++) {
				str += "\n" + StringUtils.repeat(indent + 2) + "[" + i + "] " + _records[i].toString(indent + 2);
			}
			return str;
		}
	}
}
