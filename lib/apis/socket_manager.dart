import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketIOManager {
  static final SocketIOManager _instance = SocketIOManager._internal();

  factory SocketIOManager() => _instance;

  SocketIOManager._internal();

  late Socket _socket;
  bool _isConnected = false;

  Future<void> init(String url) async {
    try {
      _socket = await Socket.connect('ec2-54-91-125-125.compute-1.amazonaws.com', 9090);
      _isConnected = true;
      _listenForEvents();
    } catch (e) {
      debugPrint('SocketIOManager Error connecting to socket: $e');
    }
  }

  bool isSocketConnected() {
    return _isConnected;
  }

  String _listenForEvents() {
    String result = '';
    _socket.listen((data) {
      debugPrint(
          'SocketIOManager Received _listenForEvents: ${utf8.decode(data)}');
      // Handle incoming data (decode if necessary)
      result = utf8.decode(data);
      debugPrint('SocketIOManager Received from server: $result');
    }, onDone: () {
      debugPrint('SocketIOManager onDone is called');
    }, onError: (error) {
      debugPrint('SocketIOManager onError is called $error');
    });
    return result;
  }

  void emitEvent(String eventName, [dynamic data]) {
    if (_isConnected) {
      final jsonData = jsonEncode('$eventName,$data');
      debugPrint('SocketIOManager emitEvent eventName $eventName $jsonData');
      _socket.write(jsonData);
    } else {
      debugPrint(
          'SocketIOManager Socket not connected, cannot emit event: $eventName');
    }
  }

  void disconnect() {
    if (_isConnected) {
      _socket.close();
      _isConnected = false;
    }
  }
}
