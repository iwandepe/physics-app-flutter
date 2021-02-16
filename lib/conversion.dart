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

  Map _mapValueUnitOfLength = {
    'Milimeter': 1000000,
    'Centimeter': 100000,
    'Decimeter': 10000,
    'Meter': 1000,
    'Dekameter': 100,
    'Hectometer': 10,
    'Kilometer': 1,
  };

  String _dropDownValueTop = 'Milimeter';
  String _dropDownValueBottom = 'Milimeter';
  String _result = '0';

  TextEditingController _unitOflengthControllerTop =
      new TextEditingController(text: '0');
  TextEditingController _unitOflengthConversionBottom =
      new TextEditingController(text: '0');

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

  void update(String value) {
    if (value.isEmpty) {
      value = '0';
      print('value is null -> changed to 0');
    }
    print('value : \'$value\'');
    _result = (double.parse(value) *
            _mapValueUnitOfLength[_dropDownValueBottom] /
            _mapValueUnitOfLength[_dropDownValueTop])
        .toString();
    setState(() {
      _unitOflengthConversionBottom.text = _result;
    });
  }

  void swap() {
    setState(() {
      TextEditingController _unitOflengthControllerTemp =
          _unitOflengthControllerTop;
      _unitOflengthControllerTop = _unitOflengthConversionBottom;
      _unitOflengthConversionBottom = _unitOflengthControllerTemp;

      String _dropDownValueTemp = _dropDownValueTop;
      _dropDownValueTop = _dropDownValueBottom;
      _dropDownValueBottom = _dropDownValueTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Conversion'),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  // Block of top content
                  Container(
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height / 2.15,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Dropdown menu to pick unit of length type
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.black,
                            value: _dropDownValueTop,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            icon: Icon(Icons.arrow_drop_down_sharp),
                            iconEnabledColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _dropDownValueTop = value;
                                update(_unitOflengthControllerTop.text);
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

                        // Form to input number to convert
                        Container(
                          child: TextFormField(
                            controller: _unitOflengthControllerTop,
                            focusNode: _textFocus,
                            textAlign: TextAlign.center,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 120,
                            ),
                            onChanged: (text) {
                              update(text);
                            },
                          ),
                        ),

                        // Object that linked to form field to
                        // trigger focus mode with tapping it
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

                  // Block of bottom content
                  Expanded(
                    child: Container(
                      color: Color(0xDDDDDDDDD),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Bottom Drop down menu
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              value: _dropDownValueBottom,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                              icon: Icon(Icons.arrow_drop_down_sharp),
                              iconEnabledColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  _dropDownValueBottom = value;
                                  update(_unitOflengthControllerTop.text);
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

                          // Bottom form field to show result of conversion
                          // Form field cannot receive input
                          Container(
                            child: TextFormField(
                              controller: _unitOflengthConversionBottom,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              cursorColor: Colors.blue,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      // FLoating button to swap value between top and bottom widget
      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(top: 120),
          width: 120,
          height: 120,
          child: FittedBox(
            child: FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                swap();
              },
              label: Text('Swap'),
            ),
          ),
        ),
      ),
    );
  }
}
