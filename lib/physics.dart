import 'package:flutter/material.dart';
import 'package:physics_app/inputvolume.dart';

import './result.dart';
import './inputarea.dart';

class PhysicsPage extends StatefulWidget {
  @override
  _PhysicsPageState createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  double _resultArea;
  bool _visibilityResultArea = false;

  set resultArea(double value) {
    setState(() {
      _resultArea = value;
      _visibilityResultArea = true;
    });
  }

  double _resultVolume;
  bool _visibilityResultVolume = false;

  set resultVolume(double value) {
    setState(() {
      _resultVolume = value;
      _visibilityResultVolume = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Calculate Physics'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Area'),
              Tab(text: 'Volume'),
            ],
          ),
        ),

        // Body that content depends on tab
        body: TabBarView(
          children: [
            // Column contain Input and Result
            Container(
              child: Column(
                children: [
                  // Input
                  InputArea(
                    result: (val) => setState(() {
                      _resultArea = val;
                      _visibilityResultArea = true;
                    }),
                  ),

                  // Result
                  Result(
                      result: _resultArea,
                      visibilityResult: _visibilityResultArea),
                ],
              ),
            ),
            Column(
              children: [
                // Input
                InputVolume(
                  result: (val) => setState(() {
                    _resultVolume = val;
                    _visibilityResultVolume = true;
                  }),
                ),

                // Result
                Result(
                  result: _resultVolume,
                  visibilityResult: _visibilityResultVolume,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
