import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_app/pages/home.dart';

void main(){
  runApp(App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: Home(),
    );
  }
}
