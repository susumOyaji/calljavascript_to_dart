library test; //呼び出したいjsファイル名

import 'package:js/js.dart';


/// Dart 関数から JavaScript を呼び出せるようにする#
@JS('jsFunction')//呼び出したいfunction名
external void callJsFunction();//dartで呼び出すときの呼び方を定義






/// JavaScript から Dart 関数を呼び出せるようにする#
/// Allows assigning a function to be callable from `window.functionName()`
/// 'window.functionName()' から呼び出し可能な関数を割り当てることができます。
@JS('functionName')
external set _functionName(void Function() f);


/// Allows calling the assigned function from Dart as well.
/// 割り当てられた関数を Dart から呼び出すこともできます。
@JS()
external void functionName();


void _someDartFunction() {
  print('Hello from Dart!');
}











void main() {
  _functionName = allowInterop(_someDartFunction);
  // JavaScript code may now call `functionName()` or `window.functionName()`.
  //JavaScript コードで 'functionName()'
  // または 'window.functionName() を呼び出すことができるようになりました。
}
