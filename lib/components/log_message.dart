import 'package:intl/intl.dart';
import 'package:nocterm/nocterm.dart';

enum LogLevel {
  debug('debug', Colors.gray),
  info('info ', Colors.blue),
  warning('warn ', Colors.yellow),
  error('error', Colors.red),
  fatal('fatal', Colors.brightRed);

  const LogLevel(this.label, this.color);
  final String label;
  final Color color;
}

class LogMessage extends StatelessComponent {
  static final _timeFormat = DateFormat('HH:mm:ss');

  final DateTime timestamp;
  final LogLevel logLevel;
  final String message;

  LogMessage({
    required this.timestamp,
    required this.logLevel,
    required this.message,
  });

  @override
  Component build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .start,
      mainAxisSize: .max,
      children: [
        Text(logLevel.label, style: TextStyle(color: logLevel.color)),
        SizedBox(width: 1),
        Text(
          _timeFormat.format(timestamp.toLocal()),
          style: TextStyle(fontWeight: .dim),
        ),
        SizedBox(width: 1),
        Expanded(child: Text(message)),
      ],
    );
  }
}
