import 'package:nocterm/nocterm.dart';

class Button extends StatelessComponent {
  final bool enabled;
  final String name;
  final String activationChar;
  final LogicalKey activationKey;
  final VoidCallback onActivate;

  const Button({
    required this.name,
    required this.activationChar,
    required this.activationKey,
    required this.onActivate,
    this.enabled = true,
  });

  @override
  Component build(BuildContext context) {
    return Focusable(
      focused: enabled,
      onKeyEvent: (event) {
        if (event.logicalKey == activationKey) {
          onActivate();
          return true;
        }
        return false;
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            activationChar,
            style: TextStyle(color: Colors.magenta, fontWeight: .bold),
          ),
          Text(' '),
          Text(name),
        ],
      ),
    );
  }
}
