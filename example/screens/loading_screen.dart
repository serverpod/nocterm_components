import 'dart:async';

import 'package:nocterm/nocterm.dart';

class LoadingScreen extends StatefulComponent {
  @override
  State<StatefulComponent> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

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
