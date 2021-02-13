import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final bool visibilityResult;

  Result({this.result, this.visibilityResult});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibilityResult,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.blue,
        ),
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              result.toString(),
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
