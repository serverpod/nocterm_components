import 'package:nocterm/nocterm.dart';

class LoadingScreen extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AsciiText(
            'Serverpod',
            font: AsciiFont.standard,
            style: TextStyle(color: Colors.blue),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3, bottom: 1),
            child: Center(
              child: SizedBox(
                width: 60,
                child: ProgressBar(indeterminate: true),
              ),
            ),
          ),
          Text('Starting Docker'),
        ],
      ),
    );
  }
}
