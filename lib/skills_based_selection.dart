import 'package:flutter/material.dart';

class SkillsBasedSelectionScreen extends StatefulWidget {
  List<String> players;

  SkillsBasedSelectionScreen(this.players);

  @override
  State<SkillsBasedSelectionScreen> createState() =>
      _SkillsBasedSelectionScreenState();
}

class _SkillsBasedSelectionScreenState
    extends State<SkillsBasedSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
