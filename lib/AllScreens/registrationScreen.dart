import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/AllScreens/loginScreen.dart';
import 'package:uber_clone/AllScreens/mainscreen.dart';
import 'package:uber_clone/AllWidgets/progressDialog.dart';
import 'package:uber_clone/main.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
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
                'Register in as a rider',
                style: TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    // name field
                    TextFormField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '  Name',
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
                      height: 10,
                    ),
                    // email field
                    TextFormField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '  email',
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
                      height: 10,
                    ),
                    // phone field
                    TextFormField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '  Phone',
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
                      height: 10,
                    ),
                    // password field
                    TextFormField(
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '  password',
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
                      height: 30,
                    ),
                    // login button
                    Container(
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () => {
                          if (nameTextEditingController.text.length < 4)
                            {
                              displayToastMessage(
                                  "Name must be atleast 4 characters", context)
                            }
                          else if (!emailTextEditingController.text
                              .contains("@"))
                            {
                              displayToastMessage(
                                  "Enter valid email address", context)
                            }
                          else if (phoneTextEditingController.text.isEmpty)
                            {
                              displayToastMessage(
                                  "phone number is required", context)
                            }
                          else if (passwordTextEditingController.text.length <
                              6)
                            {
                              displayToastMessage(
                                  "Password must be atleast 6 characters",
                                  context)
                            }
                          else
                            {
                              registerNewUser(context),
                            },
                        },
                        child: Text(
                          'Sign up',
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
                          primary: Colors.amber[500],
                        ),
                        onPressed: () => {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.idScreen, (route) => false)
                        },
                        child: Text(
                          'All ready have an account? Log in.',
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
  registerNewUser(BuildContext context) async {
    // adding dialogbox
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: 'Registering, Please wait',
          );
        });
    // adding user for registration
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
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
      print('save user info into database');
      // save user data to databse
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim()
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulations! Account has been created", context);
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      Navigator.pop(context);
      print('creating user facing error');
      displayToastMessage("new use account has not been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
