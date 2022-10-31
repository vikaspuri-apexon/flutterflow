import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Post = prefs.getStringList('ff_Post')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _Post;
  }

  late SharedPreferences prefs;

  List<dynamic> _Post = [];
  List<dynamic> get Post => _Post;
  set Post(List<dynamic> _value) {
    _Post = _value;
    prefs.setStringList('ff_Post', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToPost(dynamic _value) {
    _Post.add(_value);
    prefs.setStringList('ff_Post', _Post.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPost(dynamic _value) {
    _Post.remove(_value);
    prefs.setStringList('ff_Post', _Post.map((x) => jsonEncode(x)).toList());
  }

  int expandedpost = -1;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
