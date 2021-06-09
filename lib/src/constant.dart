import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
export 'package:event_bus/event_bus.dart';
import '../logger_flutter.dart';

final eventBus = EventBus();

class LogMessage {
  String message;

  LogMessage(this.message);
}

final GlobalKey<LogConsoleState> rootKey =
    GlobalKey<LogConsoleState>();