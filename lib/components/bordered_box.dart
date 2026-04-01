import 'package:nocterm/nocterm.dart';

class BorderedBox extends StatelessComponent {
  BorderedBox({super.key, required this.child});

  final Component child;

  @override
  Component build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: BoxBorder.all(style: .rounded)),
      child: child,
    );
  }
}
