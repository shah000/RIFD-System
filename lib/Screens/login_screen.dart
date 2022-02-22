// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyp/Constants/constants.dart';
import 'package:fyp/Screens/welcom_screen.dart';
import 'package:dotted_border/dotted_border.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.cyan),
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: TextSpan(
                      text: 'RIFD Treaffic Violation  Dectection',
                      style: TextStyle(color: Colors.yellow, fontSize: 20),
                    )),
                  ),
                  Text("System",
                      style: TextStyle(color: Colors.yellow, fontSize: 20))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            DottedBorder(
              borderType: BorderType.Circle,
              radius: Radius.circular(60),
              color: Colors.blueAccent,
              dashPattern: [1, 2, 3, 6, 8],
              strokeWidth: 10,
              strokeCap: StrokeCap.butt,
              padding: EdgeInsets.all(1),
              child: CircleAvatar(
                backgroundColor: Colors.cyan[300],
                backgroundImage: ExactAssetImage(
                  'assets/images/logon1.png',
                ),
                radius: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (vaule) {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$");
                        if (vaule!.isEmpty) {
                          return "* Required";
                        } else if (!regex.hasMatch(vaule) || vaule == null) {
                          return 'Enter a valid email address';
                        } else
                          return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          )),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else if (value.length < 6) {
                          return "Password should be atleast 6 characters";
                        } else if (value.length > 15) {
                          return "Password should not be greater than 15 characters";
                        } else
                          return null;
                      },
                      controller: _passwordController,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              _togglePasswordView();
                            },
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      width: 300,
                      height: 80,
                      padding: const EdgeInsets.only(top: 30.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () async {
                          // setState(() {
                          //   isLoading = true;
                          // });
                          if (formkey.currentState!.validate()) {
                            authController.login(_emailController.text.trim(),
                                _passwordController.text.trim());
                            print("Validated");
                          } else {
                            print("Not Validated");
                          }

                          // setState(() {
                          //   isLoading = ;
                          // });
                        },
                        child: isLoading
                            ? SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                  strokeWidth: 1.5,
                                ))
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 17),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
