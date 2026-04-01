import 'package:nocterm/nocterm.dart';

class LogDivider extends StatelessComponent {
  final String label;

  LogDivider({super.key, required this.label});

  @override
  Component build(BuildContext context) {
    // TODO: Implement the diffent types.
    return Stack(
      children: [
        Divider(),
        Center(child: Text(' $label ')),
      ],
    );
  }
}
