// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, unused_local_variable, unused_element

import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:songs/constants.dart';

String order = "List";

class type extends StatelessWidget {
  final mycontroller = ScrollController();
  type(
      {Key? key,
      required this.image,
      required this.mode,
      required this.song_list,
      required this.icon})
      : super(key: key);
  final String image;
  final String mode;
  final List<String> song_list;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(112, 96, 17, 1),
                actions: [
                  IconButton(onPressed: () {}, icon: icon),
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
                  backgroundColor: Colors.white10,
                  radius: 70,
                  child: Image.asset(
                    (image),
                  ),
                )),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Text(
              "You are in $mode",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.3,
            ),
            child: ListView(
                children:
                    Music(song_list, const Color.fromRGBO(112, 96, 17, 0.7))),
          ),
        ],
      ),
    );
  }
}

List<Widget> Music(list, color) {
  List<Widget> songs = [];
  for (int i = 0; i < list.length; i++) {
    if (list.length == 5) {
      songs.add(Song(
        name: offline_list[list[i]]!,
        add: i,
        list: list,
        color: color,
      ));
    } else if (list.length > 10) {
      songs.add(Song(
        name: offline_list[list[i]]!,
        add: i,
        list: list,
        color: color,
      ));
    } else {
      songs.add(Song(
        name: offline_list[list[i]]!,
        add: i,
        list: list,
        color: color,
      ));
    }
  }
  return songs;
}

class Song extends StatefulWidget {
  const Song({
    Key? key,
    required this.name,
    required this.add,
    required this.list,
    required this.color,
  }) : super(key: key);
  final String name;
  final int add;
  final Color color;
  final List<String> list;

  @override
  State<Song> createState() => _SongState();
}

class _SongState extends State<Song> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => song_player(
                      song: widget.add, name: widget.name, list: widget.list)));
        });
      },
      child: Column(children: [
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 70,
          padding: const EdgeInsets.only(left: 10),
          width: MediaQuery.sizeOf(context).width * 0.9,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: widget.color,
          ),
          child: Row(children: [
            SizedBox(
              width: 5,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          offline_list_images[widget.list[widget.add]]!),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text(
                widget.name,
                maxLines: 3,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}

class song_player extends StatefulWidget {
  song_player({
    Key? key,
    required this.song,
    required this.name,
    required this.list,
  }) : super(key: key);
  int song;
  String name;
  final List<String> list;
  @override
  State<song_player> createState() => _song_playerState();
}

class _song_playerState extends State<song_player> {
  late AssetsAudioPlayer player;
  late ImageProvider<Object> image;

  late Audio audio;
  double position = 0;
  Duration duration = Duration.zero;
  int icon = 0;
  List<Icon> icons = [
    const Icon(
      Icons.pause,
      size: 40,
      color: Colors.black,
    ),
    const Icon(
      Icons.play_arrow,
      size: 40,
      color: Colors.black,
    )
  ];

  List<int> already_played = [];
  @override
  void initState() {
    super.initState();
    audio = Audio(widget.list[widget.song]);
    player = AssetsAudioPlayer.newPlayer();
    player.open(audio);

    player.current.listen((event) {
      setState(() {
        duration = event!.audio.duration;
      });
    });
    /*player.currentPosition.listen((positionValue) {
      position = positionValue;
      print(position);
    });*/
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                  image: DecorationImage(
                      image: NetworkImage(
                          offline_list_images[widget.list[widget.song]]!),
                      fit: BoxFit.cover)),
              height: 300,
              width: 300,
            ),
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.6),
              child: const DropdownButtonExample(),
            ),
            const SizedBox(
              height: 100,
            ),
            Slider(
                min: 0,
                max: 100,
                value: position,
                onChanged: (value) async {
                  setState(() {
                    position = value;
                  });
                }),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(112, 96, 17, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 37,
                  ),
                  IconButton(
                      onPressed: () async {
                        player.pause();
                        setState(() {
                          icon = 0;
                          if (order == "List") {
                            if (widget.song != 0) {
                              widget.song--;
                            } else {
                              widget.song = widget.list.length - 1;
                            }
                          } else {
                            var rng = Random();
                            int flag = 1;
                            int num = 0;
                            already_played.add(widget.song);

                            if (already_played.length == widget.list.length) {
                              already_played = [];
                              already_played.add(widget.song);
                            }
                            while (flag == 1) {
                              num = rng.nextInt(widget.list.length);
                              for (int j = 0; j < already_played.length; j++) {
                                if (num == already_played[j]) {
                                  flag = 1;

                                  break;
                                } else {
                                  flag = 0;
                                }
                              }
                            }

                            setState(() {
                              icon = 0;
                              widget.song = num;
                            });
                          }
                        });
                        widget.name = offline_list[widget.list[widget.song]]!;
                        audio = Audio(widget.list[widget.song]);
                        player.open(Audio(widget.list[widget.song]));
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        player.playOrPause();
                        if (icon == 0) {
                          setState(() {
                            icon = 1;
                          });
                        } else {
                          setState(() {
                            icon = 0;
                          });
                        }
                      },
                      icon: icons[icon]),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () async {
                        player.pause();
                        setState(() {
                          icon = 0;
                          if (order == "List") {
                            if (widget.song != widget.list.length - 1) {
                              widget.song++;
                            } else {
                              widget.song = 0;
                            }
                          } else {
                            var rng = Random();
                            int flag = 1;
                            int num = 0;
                            already_played.add(widget.song);
                            if (already_played.length == widget.list.length) {
                              already_played = [];
                              already_played.add(widget.song);
                            }
                            while (flag == 1) {
                              num = rng.nextInt(widget.list.length - 1);
                              for (int j = 0; j < already_played.length; j++) {
                                if (num == already_played[j]) {
                                  flag = 1;

                                  break;
                                } else {
                                  flag = 0;
                                }
                              }
                            }
                            setState(() {
                              icon = 0;
                              widget.song = num;
                            });
                          }
                          widget.name = offline_list[widget.list[widget.song]]!;
                          audio = Audio(widget.list[widget.song]);
                        });
                        player.open(Audio(widget.list[widget.song]));
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: Colors.black,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['List', 'Shuffle'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_double_arrow_down_sharp),
      elevation: 30,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: const Color.fromRGBO(112, 96, 17, 1),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          order = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff556b2f),
                fontWeight: FontWeight.w700),
          ),
        );
      }).toList(),
    );
  }
}
