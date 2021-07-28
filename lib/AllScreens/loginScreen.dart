import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/AllScreens/registrationScreen.dart';
import 'package:uber_clone/AllWidgets/progressDialog.dart';

import '../main.dart';
import 'mainScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: 560,
                height: 30,
              ),
              Image(
                alignment: Alignment.center,
                width: 150,
                height: 250,
                image: AssetImage('images/logo.png'),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                'Sign in as a rider',
                style: TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),

              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    // email field
                    TextFormField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '  Ente your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.yellow)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // password field
                    TextFormField(
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '  Ente your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.yellow)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // login button
                    Container(
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () => {
                          if (!emailTextEditingController.text.contains("@"))
                            {
                              displayToastMessage(
                                  "Enter valid email address", context)
                            }
                          else if (passwordTextEditingController.text.length <
                              6)
                            {
                              displayToastMessage(
                                  "Password can not be empty", context)
                            }
                          else
                            {
                              loginAndAuthenticateUser(context),
                            }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    // register button
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        onPressed: () => {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RegistrationScreen.idScreen, (route) => false)
                        },
                        child: Text(
                          'Do not have an account? Register here.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  loginAndAuthenticateUser(BuildContext context) async {
    // adding dialog box
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: 'Authenticating, Please wait',
          );
        });
    // login authenticate
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError(
      (errMsg) {
        Navigator.pop(context);
        displayToastMessage("Error: " + errMsg.toString(), context);
      },
    ))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then(
        (DataSnapshot snap) {
          if (snap.value != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.idScreen, (route) => false);
            displayToastMessage("Logged in", context);
          } else {
            Navigator.pop(context);
            _firebaseAuth.signOut();
            displayToastMessage(
                "Account does not exists, Create new account please", context);
          }
        },
      );
    } else {
      print('creating user facing error');
      Navigator.pop(context);
      displayToastMessage("Error occurd, can not be logged in", context);
    }
  }
}
