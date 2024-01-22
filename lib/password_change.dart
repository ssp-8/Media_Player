// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:songs/constants.dart';

class Password_change extends StatefulWidget {
  const Password_change({Key? key, required this.image, required this.icon})
      : super(key: key);
  final String image;
  final Icon icon;

  @override
  State<Password_change> createState() => _Password_changeState();
}

class _Password_changeState extends State<Password_change> {
  int i = 0;
  bool obscure = false;
  String pass = "Username";
  String hint = "Enter your Username";
  final mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(112, 96, 17, 1),
                actions: [
                  widget.icon,
                  Container(
                    width: 20,
                  ),
                ],
              ),
              body: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/background.jpg"),
                          fit: BoxFit.cover)))),
          Positioned(
            top: 0,
            left: MediaQuery.sizeOf(context).width * 0.3,
            child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(112, 96, 17, 1)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60,
                  child: Image.asset(
                    (widget.image),
                  ),
                )),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: const Text(
              "Password Reset",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.35,
              left: MediaQuery.sizeOf(context).width * 0.2,
              child: Text(
                hint,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.45,
              left: MediaQuery.sizeOf(context).width * 0.2,
              child: SizedBox(
                width: 200,
                height: 60,
                child: TextField(
                  obscureText: obscure,
                  controller: mycontroller,
                  decoration: InputDecoration(
                      label: Text(pass),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 1.5))),
                ),
              )),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.55,
              left: MediaQuery.sizeOf(context).width * 0.3,
              child: GestureDetector(
                onTap: () {
                  if (i % 3 == 0) {
                    if (mycontroller.text == username) {
                      mycontroller.clear();
                      setState(() {
                        i++;
                        pass = "Old Password";
                        hint = "Enter Old Password";
                        obscure = true;
                      });
                    } else {
                      setState(() {
                        pass = "Wrong Input. Try Again";
                      });
                    }
                  } else if (i % 3 == 1) {
                    if (mycontroller.text == Password) {
                      mycontroller.clear();
                      setState(() {
                        i++;
                        pass = "New Password";
                        hint = "Enter New Password";
                        obscure = true;
                      });
                    } else {
                      setState(() {
                        pass = "Wrong Password. Enter Again";
                      });
                    }
                  } else if (i % 3 == 2) {
                    setState(() {
                      Password = mycontroller.text;
                      obscure = false;
                      Fluttertoast.showToast(
                          msg: "Password reset Successfully",
                          toastLength: Toast.LENGTH_LONG);
                      pass = "Username";
                      hint = "Enter your Username";
                    });
                    mycontroller.clear();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1.5),
                      color: const Color.fromRGBO(112, 96, 17, 1)),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
