import 'package:flutter/material.dart';


import './menu.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _username = "", _password = "";

  Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEEEEEEEE),
      body: Builder(
        builder: (context) => Stack(
          children: [
            // Background with blue colored
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Colors.blue,
              ),
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
            ),

            // The Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Title in the top of page
                  Text(
                    'PHYSICS APP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Square background for Form Input
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,

                    // Form
                    child: Form(
                      key: _formKey,

                      // Widget to prevent bottom overflow
                      // with applying scrollable page
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Text login
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // Form email
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  color: Colors.white,
                                  child: TextFormField(
                                    controller: _usernameController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      hintText: "username",
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'This field cannot empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // Form password
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  color: Colors.white,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Password cannot be empty';
                                      } else if (value.length < 6) {
                                        return 'Password cannot be less than 6 character';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // Login button
                                FlatButton(
                                  padding: EdgeInsets.only(
                                    left: 120,
                                    right: 120,
                                    top: 30,
                                    bottom: 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  color: Colors.blue,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      // save the input
                                      _username = _usernameController.text;
                                      _password = _passwordController.text;

                                      // autentication
                                      if (_username == 'udacodingid' &&
                                          _password == 'udacodingJaya2021') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuPage()));
                                      } else {
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'email or password is wrong')),
                                        );
                                      }
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
                  ),

                  // Button to navigate to sign up page
                  InkWell(
                    child: Text(
                      "Not a member? Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
