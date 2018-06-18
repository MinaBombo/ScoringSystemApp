import 'package:flutter/material.dart';
import 'package:scoring_system/pages/ScoresPage.dart';

void main() => runApp(new ScoringSystemApp());

class ScoringSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Scoring System',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ScoresPage(),
    );
  }
}
