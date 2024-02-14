import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class TopBarContents extends StatelessWidget {
  const TopBarContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
      child: ResponsiveGridRow(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ResponsiveGridCol(
            md: 6,
            child: const Text("© Code by Elvis"),
          ),
          ResponsiveGridCol(
            md: 6,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavBarItem("About"),
                SizedBox(
                  width: 60,
                ),
                _NavBarItem("Contact")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
