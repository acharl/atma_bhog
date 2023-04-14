import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_web/global.dart';

import '../widgets/left_side.dart';
import '../widgets/deity_widget.dart';

class DeityPage extends StatefulWidget {
  const DeityPage({super.key});

  @override
  State<DeityPage> createState() => _DeityPageState();
}

class _DeityPageState extends State<DeityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          DeityWidget(),
        ],
      ),
    );
  }
}
