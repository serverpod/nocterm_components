import 'package:nocterm_components/components/bordered_box.dart';
import 'package:nocterm_components/components/button.dart';
import 'package:nocterm_components/components/log_event.dart';
import 'package:nocterm_components/components/log_message.dart';
import 'package:nocterm_components/components/tab_bar.dart';
import 'package:nocterm/nocterm.dart';

class MainScreen extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .max,
      children: [
        Expanded(
          child: BorderedBox(
            child: Column(
              crossAxisAlignment: .stretch,
              mainAxisSize: .max,
              children: [
                TabBar(labels: ['Log Messages'], selectedTab: 0),
                Expanded(
                  child: ListView(
                    children: [
                      LogMessage(
                        timestamp: DateTime.now(),
                        message:
                            'SERVERPOD version: 3.5.0-beta.1, dart: 3.11.0 '
                            '(stable) (Mon Feb 9 00:38:07 2026 -0800) on '
                            '"macos_arm64", time: 2026-04-01 07:20:19.806701Z',
                        logLevel: .info,
                      ),
                      LogMessage(
                        timestamp: DateTime.now(),
                        message: 'Webserver listening on http://localhost:8082',
                        logLevel: .info,
                      ),
                      LogMessage(
                        timestamp: DateTime.now(),
                        message: 'Some other message',
                        logLevel: .info,
                      ),
                      LogDivider(label: 'Hot reload (x4)'),
                      LogMessage(
                        timestamp: DateTime.now(),
                        message: 'We are back after the hot reload!!',
                        logLevel: .info,
                      ),
                      LogMessage(
                        timestamp: DateTime.now(),
                        message: 'Oops, something went wrong.',
                        logLevel: .warning,
                      ),
                      LogMessage(
                        timestamp: DateTime.now(),
                        message: 'And now we crashed :(',
                        logLevel: .error,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 1),
            Button(
              name: 'Hot Reload',
              activationChar: 'R',
              activationKey: .keyR,
              onActivate: () {},
            ),
            SizedBox(width: 3),
            Button(
              name: 'Create Migration',
              activationChar: 'M',
              activationKey: .keyM,
              onActivate: () {},
            ),
            SizedBox(width: 2),
            Button(
              name: 'Apply Migration',
              activationChar: 'A',
              activationKey: .keyA,
              onActivate: () {},
            ),
            SizedBox(width: 2),
            Button(
              name: 'Quit',
              activationChar: 'Q',
              activationKey: .keyQ,
              onActivate: () {
                shutdownApp(0);
              },
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
