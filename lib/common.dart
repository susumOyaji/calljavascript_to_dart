@JS()
library common; //jquery;

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';

import 'package:js/js.dart';

//----1---//
@JS('connectDevice')
external void connectDevice();

//----2---//
//4. Dart 関数を JavaScript から名前で呼び出せるようにするには、
//@JS() で注釈が付けられたセッターを使用します。
@JS()
external void receiveDeviceStatus(dynamic text);

//ここでは、Java スクリプトから dart 関数を呼び出せるようにします。

//1. Dart 関数を引数として Java Script API に渡します。
@JS('updateDeviceStatus')
external set pReceiveDeviceStatus(void Function(String value) f);

//2. Javaスクリプト内で呼び出す必要がある関数を定義します。
void pNotifyDeviceStatus(BuildContext context, String value) {
  Provider.of<BluetoothProvider>(context, listen: false).setDeviceStatus(value);
  print('*** Device Connection status $value ***');
}

//4. Dart 関数を JavaScript から名前で呼び出せるようにするには、@JS() で注釈が付けられたセッターを使用します。
//@JS()
//external void receiveDeviceStatus(dynamic text);

void main() {
  pReceiveDeviceStatus =
  allowInterop((text) => pNotifyDeviceStatus(context, text));
}
