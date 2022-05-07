import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woocampus/Forget%20password.dart';

import 'package:http/http.dart' as http;

import 'ApiConstants.dart';
import 'Constants.dart';
import 'api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();


  final scaffoldKey = GlobalKey<ScaffoldState>();


  var usernamecontroller = TextEditingController();

  var passcontroller = TextEditingController();
  @override



  Widget build(BuildContext context) {
    const color = const Color(0xff5E72E4);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Form(
      key: globalFormKey,
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage(bgimage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              //BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),

              color: Colors.white,
              elevation: 21,
              child: Container(
                height: height * 0.72,
                width: width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(MaskGroup1),
                          height: height * 0.11,
                          width: width * 0.85,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              "Parent Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 31),
                            ),
                            Text("Know Your Child",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: TextField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.people,
                              color: Colors.black,
                            ),
                            labelText: "Username",

                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: TextFormField(

                        obscureText: true,
                        controller: passcontroller,

                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            labelText: "Password",

                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FlatButton(
                              color: color,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              onPressed: () {

                                Future<void> login() async {
                                  if (usernamecontroller.text.isNotEmpty && passcontroller.text.isNotEmpty) {
                                    var url = Uri.parse(ApiConstants.baseurlf + ApiConstants.usersEndpoint);

                                    final response = await http.post(url, body: ({
                                      'username': usernamecontroller.text,
                                      'password': passcontroller.text
                                    }));

                                    if(response.statusCode==200){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sucess")));



                                    }
                                    else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Invalid Details")));
                                    }
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Field")));

                                  }


                                }
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    Center(
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              "Forget password ?",
                              style: TextStyle(color: Colors.grey,
                                  fontSize: 15),
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Center(child: Image(image: AssetImage(logox)))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  }

