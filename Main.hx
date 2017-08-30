package;

import haxe.macro.Expr;

import haxe.io.Bytes in HaxeBytes;
import haxe.io.BytesData;

@:access(haxe.io.Bytes)

abstract Bytes(HaxeBytes) from HaxeBytes to HaxeBytes {
	public function new (length:Int, bytesData:BytesData) {
		
		#if js
		this = new HaxeBytes (bytesData);
		#else
		this = new HaxeBytes (length, bytesData);
		#end
		
	}
}

class TestClass {
	macro public static function testMacro() : Expr {
		return macro false;
	}
}

class Main {
	public static function main () {

		trace("Hello World");
		
		TestClass.testMacro(); // Triggers Regression: haxe.io.Bytes does not have a constructor
	}
}