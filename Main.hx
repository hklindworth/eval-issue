package;

import haxe.macro.Expr;
import lime.utils.BytePointer;


class TestClass {
	macro public static function testMacro() : Expr {
		return macro false;
	}

	public static function testStatic(): Void {
		trace("testStatic");
	}

	public static function test():Void {
		var x = haxe.io.Bytes.alloc(10);
		trace(x.length);
	}
}

class Main {
	public static function main () {

		trace("Hello World");
		
		TestClass.testStatic(); // No problem

		TestClass.testMacro(); // Causes Compiler error: Field index for length not found on prototype haxe.io.Bytes
	}
}