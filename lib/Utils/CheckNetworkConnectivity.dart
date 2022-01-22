import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    _connectivity.onConnectivityChanged.listen((result) {
      _controller.sink.add(result);
    });
  }

  void disposeStream() => _controller.close();
}
