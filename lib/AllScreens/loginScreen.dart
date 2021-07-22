import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: 560,
            height: 60,
          ),
          Image(
            alignment: Alignment.center,
            width: 150,
            height: 300,
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
            height: 70,
          ),

          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: [
                TextFormField(
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
                  height: 35,
                ),
                TextFormField(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
