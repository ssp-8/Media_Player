// ignore_for_file: use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names

import 'package:animations/animations.dart';

import 'package:flutter/material.dart';

import 'package:songs/constants.dart';
import 'package:songs/list.dart';

import 'package:songs/mode.dart';

class login_page extends StatelessWidget {
  final mycontroller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover))),
      RoundedAppBar(
        color: const Color.fromRGBO(112, 96, 17, 1),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).width * 0.204,
          left: MediaQuery.sizeOf(context).width * 0.015,
          child: SizedBox(
            height: 200,
            width: 400,
            child: Image.asset(
              "assets/images/singers.png",
              fit: BoxFit.cover,
            ),
          )),
      const Positioned(
        top: 20,
        left: 15,
        child: Text(
          "Welcome to\nLand of Music",
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
        ),
      ),
      Positioned(
        top: MediaQuery.sizeOf(context).height * 0.38,
        left: MediaQuery.sizeOf(context).width * 0.05,
        child: Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20))),
      ),
      Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.sizeOf(context).height * 0.39, 0, 0),
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        height: 450,
        width: 350,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width * 0.1,
            MediaQuery.sizeOf(context).height * 0.46, 0, 0),
        child: TextField(
          controller: mycontroller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(173, 162, 105, 1), width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(112, 96, 17, 1), width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.black, fontSize: 20)),
        ),
      ),
      Container(
        height: 550,
        width: 350,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width * 0.1,
            MediaQuery.sizeOf(context).height * 0.56, 0, 0),
        child: TextField(
          controller: password_controller,
          obscureText: true,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(173, 162, 105, 1), width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(112, 96, 17, 1), width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.black, fontSize: 20)),
        ),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).height * 0.66,
          left: MediaQuery.sizeOf(context).width * 0.3,
          child: OpenContainer(
            onClosed: (data) {
              mycontroller.clear();
              password_controller.clear();
            },
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            openBuilder: (context, action) {
              if (mycontroller.text == username &&
                  password_controller.text == Password) {
                return const Mode();
              } else {
                return Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: const Text(
                    "Incorrect UserName or Password, Please get back and try again",
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                );
              }
            },
            closedBuilder: (context, action) {
              return Container(
                alignment: Alignment.center,
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                  color: const Color.fromRGBO(112, 96, 17, 1),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              );
            },
          )),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.58),
        child: const Text(
          "OR",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      Positioned(
          top: MediaQuery.sizeOf(context).height * 0.85,
          left: MediaQuery.sizeOf(context).width * 0.1,
          child: OpenContainer(
            closedColor: const Color.fromRGBO(217, 217, 217, 0.5),
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            closedBuilder: (context, action) {
              return Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                    color: const Color.fromRGBO(217, 217, 217, 0.5),
                  ),
                  child: Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    /*async {
                      final isAuthenticated = await LocalAuthApi.authenticate();
                      if (isAuthenticated) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Mode())));
                      }
                    },*/
                    Icon(
                      Icons.lock,
                      color: Colors.purple[700],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Access only a few Songs",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ]));
            },
            openBuilder: (context, action) {
              return type(
                  image: "assets/images/no_wifi.png",
                  mode: "Limited Access Mode",
                  song_list: logout,
                  icon: const Icon(
                    Icons.lock,
                    size: 30,
                  ));
            },
          )),
    ]));
  }
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  RoundedAppBar({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 6;
        return ClipRect(
          child: OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: SizedBox(
              width: width,
              height: width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: width / 2 - preferredSize.height / 2),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(color: Colors.black54, blurRadius: 10.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(280.0);
}

/*class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = hasBiometrics();
    if (isAvailable == false) return false;
    try {
      return await _auth.authenticate(
          localizedReason: "Scan Fingerprint to Login",
          options:
              AuthenticationOptions(biometricOnly: true, stickyAuth: true));
    } on PlatformException catch (e) {
      return false;
    }
  }
}*/
