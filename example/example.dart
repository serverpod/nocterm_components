import 'screens/loading_screen.dart';
import 'screens/main_screen.dart';
import 'package:nocterm/nocterm.dart';

enum Screen { loading, main }

void main() {
  runApp(const Counter());
}

class Counter extends StatefulComponent {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with TickerProviderStateMixin {
  Screen _screen = .loading;

  @override
  Component build(BuildContext context) {
    Component screenComponent;
    switch (_screen) {
      case Screen.loading:
        screenComponent = LoadingScreen();
      case Screen.main:
        screenComponent = MainScreen();
    }

    return Focusable(
      focused: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKey.space) {
          setState(() {
            final nextIndex = (_screen.index + 1) % Screen.values.length;
            _screen = Screen.values[nextIndex];
          });
          return true;
        }
        return false;
      },
      child: screenComponent,
    );
  }
}
