import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'driver_main.dart';

class LoginPage extends StatelessWidget {
  TextEditingController pnoController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signIn(BuildContext context) async {
    print("Sign in Called");
    String p_no = pnoController.text;
    String password = passwordController.text;

    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('drivers')
        .where('P_no', isEqualTo: p_no)
        .get();

    final List<DocumentSnapshot> docs = result.docs;
    if (docs.length == 0) {
      // handle error - no user found
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid credentials'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      if (docs[0].get('password') == password) {
        print("Login Successful");

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => drivermain(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid credentials'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.car_repair,
                size: 100,
              ),
              SizedBox(height: 30.0),
              Container(
                width: 300.0,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        _signIn(context);
                      },
                      style: ButtonStyle(),
                      child: Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
