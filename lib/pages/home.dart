import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_web/global.dart';

import '../widgets/left_side.dart';
import '../widgets/right_side.dart';
// import '../widgets/deity_wider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          RightSide(),
        ],
      ),
    );
  }
}
