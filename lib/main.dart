import 'package:flutter/material.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: Login(),
      // home: PhysicsPage(),
      // home: ConversionPage(),
      // home: MenuPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: Image.asset('assets/img/logo.png'),
            ),
            SizedBox(
              height: 200,
            ),
            Text("Welcome to Physics App",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(
              height: 10,
            ),
            Text("Lets do conversion and calculate physics",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Text("on this app",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(
              height: 20,
            ),

            // Sign up button, navigate to sign up page
            MaterialButton(
              minWidth: 210,
              color: Colors.white,
              textColor: Colors.lightBlue,
              child: Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),

            // Login button, navigate to loggin page
            FlatButton(
              child: Text(
                "Log in",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            )
          ],
        ),
      ),
    );
  }
}
