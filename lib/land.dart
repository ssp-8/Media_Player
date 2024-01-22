import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/constants.dart';
import 'package:songs/login.dart';
import 'package:songs/mode.dart';
import 'package:songs/no_online.dart';

class Land extends StatefulWidget {
  const Land({super.key});

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return [
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue[400]),
          backgroundColor: Colors.black,
        ),
        drawer: NavigationDrawer(
          indicatorColor: Colors.white,
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[400],
              child: Image.asset(
                "assets/images/free_trial.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const Divider(
              color: Colors.black,
              endIndent: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      i = 1;
                    });
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.blue[400],
                    size: 40,
                  ),
                  label: Text(
                    "Login",
                    style: TextStyle(color: Colors.blue[400], fontSize: 30),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        ' Music is Life Itself',
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Music is an art form to live, love and lead life in the best way. Starting your day with music just makes it special. Ending a day with music makes you feel the day was special. Enjoy your day with the best songs that you wish to listen!",
                        style: GoogleFonts.sansita(
                            fontSize: 17, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: Music_offline(2, logout, Colors.blue[400]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      i = 2;
                    });
                  },
                  child: SizedBox(
                    height: 200,
                    child: Image.asset("assets/images/undraw.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      i = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Login to Listen more",
                      style: GoogleFonts.sansita(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      login_page(),
      const Mode()
    ][i];
  }
}
