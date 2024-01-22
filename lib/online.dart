// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, unused_local_variable, unused_element

import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:songs/constants.dart';

String order = "List";
bool forward = true;
int f = 0;
Map<int, String> playlist = {};
List<Audio> playlists = [];
late AssetsAudioPlayer player;
late int num;

class type_online extends StatelessWidget {
  final mycontroller = ScrollController();
  type_online(
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
                backgroundColor: Colors.blue,
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
                color: Colors.black,
              )),
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
          Positioned(
              top: 0,
              left: MediaQuery.sizeOf(context).width * 0.3,
              child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: CircleAvatar(
                  backgroundColor: Colors.white10,
                  radius: 70,
                  backgroundImage: AssetImage(image),
                ),
              )),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.3,
            ),
            child: ListView(
                children: Music_online(
                    fire_base, const Color.fromRGBO(112, 96, 17, 0.7))),
          ),
        ],
      ),
    );
  }
}

List<Widget> Music_online(fire, color) {
  List<Widget> songs = [];
  for (int i = 0; i < fire.length; i++) {
    songs.add(Song_online(
      name: offline_list[fire_base[i]]!,
      add: i,
      fire: fire_base,
      color: color,
    ));
  }
  return songs;
}

class Song_online extends StatefulWidget {
  const Song_online({
    Key? key,
    required this.name,
    required this.add,
    required this.fire,
    required this.color,
  }) : super(key: key);
  final String name;
  final int add;
  final Color color;
  final List<String> fire;

  @override
  State<Song_online> createState() => _SongState();
}

class _SongState extends State<Song_online> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => song_player_online(
                      song: widget.add, name: widget.name, list: fire_base)));
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
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            offline_list_images[widget.fire[widget.add]]!),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
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
            ],
          ),
        )
      ]),
    );
  }
}

class song_player_online extends StatefulWidget {
  song_player_online({
    Key? key,
    required this.song,
    required this.name,
    required this.list,
  }) : super(key: key);
  int song;

  String name;
  final List<String> list;
  @override
  State<song_player_online> createState() => _song_playerState();
}

class _song_playerState extends State<song_player_online> {
  List<Audio> playlists = songs(0, fire_base);
  late ImageProvider<Object> image;

  late Audio audiourl;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  int icon = 0;
  bool isPlaying = false;

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

  @override
  initState() {
    super.initState();
    player = AssetsAudioPlayer.newPlayer();
    audiourl = Audio.network(widget.list[widget.song]);

    returner();

    player.currentPosition.listen((event) {
      setState(() {
        position = event;
      });
    });

    player.current.listen((event) {
      setState(() {
        duration = event!.audio.duration;
        if (f != 0 && order == "List") {
          isPlaying = true;

          if (forward) {
            widget.song++;
          } else {
            widget.song--;
          }
        }

        if (f != 0 && order == "Shuffle") {
          widget.song = num;
        }
        f++;
      });
    });
  }

  Future<void> returner() async {
    try {
      await player.open(Playlist(audios: playlists, startIndex: widget.song),
          showNotification: true,
          loopMode: LoopMode.playlist,
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug);
    } catch (e) {
      player.open(Playlist(audios: playlists),
          loopMode: LoopMode.playlist,
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug);
    }
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: ((context) => type_online(
                            image: "assets/images/online.jpg",
                            mode: "More Songs",
                            song_list: widget.list,
                            icon: const Icon(Icons.music_note)))));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                        image: NetworkImage(
                            offline_list_images[playlist[widget.song]]!),
                        fit: BoxFit.cover)),
                height: 300,
                width: 300,
              ),
            ),
            Center(
              child: Text(
                offline_list[playlist[widget.song]]!,
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
                max: duration.inSeconds.toDouble() + 5,
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  setState(() {
                    position = Duration(seconds: value.toInt());
                    player.seek(Duration(seconds: value.toInt()));
                  });
                }),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position.inSeconds),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    formatTime(duration.inSeconds),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
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
                            setState(() {
                              forward = false;
                            });
                          } else {
                            var rn = Random();
                            num = rn.nextInt(widget.list.length);
                            player.playlistPlayAtIndex(num);
                          }
                        });
                        widget.name = offline_list[widget.list[widget.song]]!;
                        audiourl = Audio.network(widget.list[widget.song]);
                        if (order == "List") {
                          player.previous();
                        }
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
                          if (order == "Shuffle") {
                            var rn = Random();
                            num = rn.nextInt(widget.list.length);
                            player.playlistPlayAtIndex(num);
                          }
                          widget.name = offline_list[widget.list[widget.song]]!;
                          audiourl = Audio.network(widget.list[widget.song]);
                        });
                        if (order == "List") {
                          player.next();
                        }
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

List<Audio> songs(i, li) {
  List<Audio> s = [];
  for (int j = i; j < li.length; j++) {
    playlist[j] = (li[j]);
    s.add(Audio.network(li[j]));
  }
  return s;
}
