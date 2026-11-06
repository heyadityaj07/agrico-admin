import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _sidebarindex = 0;
  int get sidebarindex => _sidebarindex;
  set sidebarindex(int value) {
    _sidebarindex = value;
  }

  LocationFromLatlngStruct _farmlocation = LocationFromLatlngStruct();
  LocationFromLatlngStruct get farmlocation => _farmlocation;
  set farmlocation(LocationFromLatlngStruct value) {
    _farmlocation = value;
  }

  void updateFarmlocationStruct(Function(LocationFromLatlngStruct) updateFn) {
    updateFn(_farmlocation);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
  }
}
