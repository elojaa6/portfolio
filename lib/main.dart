import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')),
      home: const HomeView(),
    );
  }
}
