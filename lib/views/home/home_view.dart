import 'package:flutter/material.dart';
import 'package:portfolio/views/home/sections/top.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Top(),
              ],
            )),
      ),
    );
  }
}
