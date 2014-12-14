class TestJs {
	//@:js('var x = 10;"" + x;var x1 = 10;"" + x1;var x2 = 10.0;"" + x2;var x3 = "10";x3;var x4 = true;"" + x4;')
	//static function testStdString() {
	//var x = 10;
	//Std.string(x);
	//var x:UInt = 10;
	//Std.string(x);
	//var x = 10.0;
	//Std.string(x);
	//var x = "10";
	//Std.string(x);
	//var x = true;
	//Std.string(x);
	//}

	@:js("var a = new List();var _g_head = a.h;var _g_val = null;while(_g_head != null) {var tmp;_g_val = _g_head[0];_g_head = _g_head[1];tmp = _g_val;tmp;}")
	static function testListIteratorInline() {
		var a = new List();
		for (v in a) { }
	}

	@:js("var a = 1;var tmp;var v2 = a;tmp = a + v2;if(tmp > 0) {}")
	@:analyzer(no_const_propagation)
	static function testInline() {
		var a = 1;
		if (f(a) > 0) { }
	}

    inline static function f(v) {
        var v2 = v;
        return v + v2;
    }
}