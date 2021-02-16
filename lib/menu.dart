import 'package:flutter/material.dart';
import 'package:physics_app/conversion.dart';

import './physics.dart';
import './conversion.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xDDDDDDDDD),
      appBar: AppBar(
        title: Text('App Menu'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.calculate,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Counting Physics',
                  style: TextStyle(fontSize: 18),
                ),
                new Spacer(),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhysicsPage()));
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.countertops,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Conversion',
                  style: TextStyle(fontSize: 18),
                ),
                new Spacer(),
                IconButton(
                    icon: Icon(Icons.keyboard_arrow_right), onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ConversionPage()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
