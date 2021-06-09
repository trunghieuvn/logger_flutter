import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

var logger = Logger(
  filter: MyFilter(),
  printer: CustomPrinter(lineLength: 20),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void log() {
  logger.d("Log message");
}

class MyApp extends StatelessWidget {
  void showDialogConsole(context) {
    showDialog(context: context, builder: (context) => LogConsole());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (buildContext) {
          return Scaffold(
            body: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: log,
                    child: Icon(Icons.access_alarm),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () => showDialogConsole(buildContext),
                    child: Icon(Icons.share),
                  ),
                ),
                Expanded(
                  child: LogConsole(isRoot: true),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
