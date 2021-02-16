import 'package:flutter/material.dart';

class InputVolume extends StatelessWidget {
  final volumeFormKey = GlobalKey<FormState>();

  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final Function result;

  InputVolume({this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.blue,
      ),
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.35,

      // Area Form
      child: Form(
        key: volumeFormKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text login
                  Text(
                    'Input',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Row for input length
                  Row(
                    children: [
                      // Label form length
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'Length',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      // Input Form length
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          margin: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            controller: lengthController,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText: "Input length",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Length cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row for input width
                  Row(
                    children: [
                      // Label input width
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'Width',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      // Form input width
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: TextFormField(
                            controller: widthController,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText: "Input width",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Width cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row for input height
                  // Row for input width
                  Row(
                    children: [
                      // Label input width
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'Height',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      // Form input width
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          margin: EdgeInsets.only(
                            right: 20,
                          ),
                          child: TextFormField(
                            controller: heightController,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText: "Input height",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Height cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Login button to calculate the result
                  FlatButton(
                    padding: EdgeInsets.only(
                      left: 60,
                      right: 60,
                      top: 20,
                      bottom: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    color: Colors.white,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      if (volumeFormKey.currentState.validate()) {
                        int res = int.parse(lengthController.text) *
                            int.parse(widthController.text) *
                            int.parse(heightController.text);
                        result(res);
                      }
                      print('Pressed');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
