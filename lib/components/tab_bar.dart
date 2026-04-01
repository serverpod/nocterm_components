import 'package:nocterm/nocterm.dart';

class TabBar extends StatelessComponent {
  TabBar({super.key, required this.labels, required this.selectedTab});

  final List<String> labels;
  final int selectedTab;

  @override
  Component build(BuildContext context) {
    final tabComponents = <Component>[];
    // First spacing.
    tabComponents.add(
      _TabSpacing(width: 1, type: selectedTab == 0 ? .shortRight : .full),
    );
    for (int i = 0; i < labels.length; i += 1) {
      // Tab.
      tabComponents.add(_Tab(label: labels[i], selected: i == selectedTab));

      // Spacing after tab.
      _TabSpacingType spacingType;
      if (i == selectedTab) {
        spacingType = .shortLeft;
      } else if (i == selectedTab - 1) {
        spacingType = .shortRight;
      } else {
        spacingType = .full;
      }
      tabComponents.add(_TabSpacing(width: 2, type: spacingType));
    }

    // Fill remaining space after last tab.
    tabComponents.add(
      Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return _TabSpacing(
              width: constraints.maxWidth.toInt(),
              type: .full,
            );
          },
        ),
      ),
    );

    return Row(crossAxisAlignment: .start, children: tabComponents);
  }
}

class _Tab extends StatelessComponent {
  final String label;
  final bool selected;

  _Tab({required this.label, required this.selected});

  @override
  Component build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: selected ? .normal : .dim)),
        Text(
          ''.padLeft(label.length, '━'),
          style: selected
              ? TextStyle(color: Colors.magenta)
              : TextStyle(fontWeight: .dim),
        ),
      ],
    );
  }
}

enum _TabSpacingType { full, shortLeft, shortRight }

class _TabSpacing extends StatelessComponent {
  final int width;
  final _TabSpacingType type;

  const _TabSpacing({required this.width, required this.type});

  @override
  Component build(BuildContext context) {
    String underline;
    switch (type) {
      case .full:
        underline = ''.padLeft(width, '━');
        break;
      case .shortLeft:
        underline = '╺'.padRight(width, '━');
        break;
      case .shortRight:
        underline = '╸'.padLeft(width, '━');
        break;
    }
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(''.padLeft(width)),
        Text(underline, style: TextStyle(fontWeight: .dim)),
      ],
    );
  }
}
