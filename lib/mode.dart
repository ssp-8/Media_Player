// ignore_for_file: camel_case_types

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:songs/constants.dart';
import 'package:songs/land.dart';
import 'package:songs/no_online.dart';
import 'package:songs/online.dart';
import 'package:songs/password_change.dart';

class Mode extends StatefulWidget {
  const Mode({super.key});

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return [
      Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(112, 96, 17, 1),
        ),
        drawer: NavigationDrawer(
          backgroundColor: const Color.fromRGBO(112, 96, 17, 1),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 220,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: AssetImage("assets/images/profile.png")),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.sizeOf(context).width * 0.15, 5, 0, 10),
              alignment: Alignment.center,
              child: const Divider(
                endIndent: 50,
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              alignment: Alignment.topLeft,
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: 70,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    i = 1;
                  });
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: 70,
              padding: const EdgeInsets.only(top: 20, left: 20),
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => const Password_change(
                              image: "assets/images/auth.png",
                              icon: Icon(
                                Icons.security,
                                size: 30,
                              )))));
                },
                icon: const Icon(
                  Icons.security,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text("Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: 70,
              padding: const EdgeInsets.only(top: 20, left: 20),
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => type_online(
                              image: "assets/images/online.jpg",
                              mode: "More Songs",
                              song_list: fire_base,
                              icon: const Icon(
                                Icons.music_note,
                                size: 30,
                              )))));
                },
                icon: const Icon(
                  Icons.music_note,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text("More Songs",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: const Column(children: [
              mode(
                image: "assets/images/cycling.png",
                type: "Cycling Mode",
              ),
              SizedBox(
                height: 50,
              ),
              mode(image: "assets/images/offline.png", type: "Offline Mode"),
              SizedBox(
                height: 50,
              ),
              mode(image: "assets/images/online.jpg", type: "More Songs")
            ]),
          ),
        ),
      ),
      const Land()
    ][i];
  }
}

class mode extends StatefulWidget {
  const mode({Key? key, required this.image, required this.type})
      : super(key: key);
  final String image;
  final String type;

  @override
  State<mode> createState() => _modeState();
}

class _modeState extends State<mode> {
  List<List<String>> list = [online, offline, fire_base];
  List<Icon> icon = [
    const Icon(
      Icons.wifi,
      size: 30,
    ),
    const Icon(
      Icons.flight,
      size: 30,
    ),
    const Icon(
      Icons.music_note,
      size: 30,
    )
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.type == 'Cycling Mode') {
      setState(() {
        selected = 0;
      });
    } else if (widget.type == 'Offline Mode') {
      setState(() {
        selected = 1;
      });
    } else {
      setState(() {
        selected = 2;
      });
    }
    return OpenContainer(
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      closedBuilder: (context, action) {
        return Stack(
          children: [
            Container(
                alignment: Alignment.center,
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(112, 96, 17, 0.6),
                  border: Border.all(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset((widget.image))),
            Positioned(
              top: 200,
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 0.54),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  widget.type,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        );
      },
      openBuilder: (context, action) {
        if (widget.type == "More Songs") {
          return type_online(
              image: widget.image,
              mode: widget.type,
              song_list: list[selected],
              icon: icon[selected]);
        }
        return type_offline(
            integer: selected,
            image: widget.image,
            mode: widget.type,
            song_list: list[selected],
            icon: icon[selected]);
      },
    );
  }
}
