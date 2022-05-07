import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const color = const Color(0xff5E72E4);
    return Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage(bgimagee),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        height: height * 0.228,
                        width: width * 0.85,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 12, 0, 0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Forget Password",
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: "Registered Mobile Number",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder()),
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
                                      onPressed: () {},
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),

    );
  }
}
