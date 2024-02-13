import 'package:flutter/material.dart';

class TopBarContents extends StatelessWidget {
  const TopBarContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text("© Code by Elvis"),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavBarItem("About"),
              SizedBox(
                width: 60,
              ),
              _NavBarItem("Contact")
            ],
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
