import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  List _listUnitOfLength = [
    'Milimeter',
    'Centimeter',
    'Decimeter',
    'Meter',
    'Dekameter',
    'Hectometer',
    'Kilometer',
  ];
  String _dropDownValue = 'Milimeter';

  TextEditingController _unitOflengthController = new TextEditingController();
  TextEditingController _unitOflengthConversionController =
      new TextEditingController();

  FocusNode _textFocus;

  @override
  void initState() {
    super.initState();

    _textFocus = FocusNode();
  }

  @override
  void dispose() {
    _textFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Conversion'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height / 2.15,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.black,
                      value: _dropDownValue,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      iconEnabledColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _dropDownValue = value;
                        });
                      },
                      items: _listUnitOfLength.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      focusNode: _textFocus,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 120,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Tap to change the value',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onTap: () => _textFocus.requestFocus(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xDDDDDDDDD),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        value: _dropDownValue,
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                        icon: Icon(Icons.arrow_drop_down_sharp),
                        iconEnabledColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            _dropDownValue = value;
                          });
                        },
                        items: _listUnitOfLength.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        focusNode: _textFocus,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(border: InputBorder.none),
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 120,
                        ),
                      ),
                    ),
                    // InkWell(
                    //   child: Text(
                    //     'Tap to change the value',
                    //     style: TextStyle(color: Colors.blue, fontSize: 18),
                    //   ),
                      // onTap: () => _textFocus.requestFocus(),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
