// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ali_almatary/models/audio/audio_player.dart';
import 'package:ali_almatary/screens/error_screen/error.dart';
import 'package:ali_almatary/screens/music_screen/audio_shimmer.dart';
import 'package:ali_almatary/widgets/audio_widgets/audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;
import 'package:slider_controller/slider_controller.dart';

class AudioDetailsScreen extends StatefulWidget {
  static const routeName = '/music-detail';

  const AudioDetailsScreen({super.key});

  @override
  State<AudioDetailsScreen> createState() => _AudioDetailsScreenState();
}

class _AudioDetailsScreenState extends State<AudioDetailsScreen> {
  late final Map<String, dynamic> detailsData;
  late Future<List<Audio>>? data;
  List<Audio> _items = [];
  bool _isInit = true;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isAudioReady = true;

  int index = 0;
  String _url = '';
  

  @override
  void didChangeDependencies() {
    if (_isInit) {
      detailsData =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      });
      audioPlayer.onDurationChanged.listen((Duration d) {
        setState(() {
          duration = d;
        });
      });
      audioPlayer.onPositionChanged.listen((Duration p) {
        setState(() {
          position = p;
        });
      });
    }
    data = getMusicDetails();

    _isInit = false;

    super.didChangeDependencies();
  }

  Future<List<Audio>> getMusicDetails() async {
    Uri url = Uri.https('sh-alialmatry.com', 'API/index1.php');

    try {
      var response = await client.post(url,
          body: {'action': 'getCategoryData', 'ID': detailsData['id']});

      var data = jsonDecode(response.body);

      final newData = data['data'] as List;
      _items = newData.map((e) => Audio.fromJson(e)).toList();

      return _items;
    } catch (error) {
      rethrow;
    }
  }

  String formatedTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: data ?? getMusicDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return AudioShimmer();

            case ConnectionState.done:
              return snapshot.hasData
                  ? Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            detailsData['title'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (_url == _items[i].attatches &&
                                        isPlaying) {
                                      await audioPlayer.pause();
                                      setState(() {
                                        isPlaying = false;
                                      });
                                      return;
                                    }
                                    setState(() {
                                      isAudioReady = false;
                                    });
                                    if (isPlaying) {
                                      await audioPlayer.pause();
                                    }

                                    setState(() {
                                      index = i;
                                      isPlaying = false;
                                    });
                                    playMusic(_items[i].attatches ?? '');
                                  },
                                  child: AudioPlayerWidget(
                                      title: snapshot.data[i].title,
                                      audio: snapshot.data[i].attatches,
                                      isPlaying:
                                          index == i ? isPlaying : false),
                                );
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 178, 110)
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    formatedTime(time: position.inSeconds),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: SliderController(
                                    sliderDecoration: SliderDecoration(
                                      activeColor: Colors.black,
                                      inactiveColor: Colors.white,
                                      thumbColor:
                                          Color.fromARGB(255, 149, 161, 10),
                                      borderRadius: 10,
                                      height: 10,
                                      thumbHeight: 7,
                                      thumbWidth: 7,
                                    ),
                                    min: 0,
                                    max: duration == Duration.zero
                                        ? 100.0
                                        : duration.inSeconds.toDouble(),
                                    value: position.inSeconds.toDouble(),
                                    onChanged: (value) async {
                                      Duration dur =
                                          Duration(seconds: value.toInt());
                                      await audioPlayer.seek(dur);

                                      await audioPlayer.resume();
                                      setState(() {
                                        position = dur;
                                      });
                                    },
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    formatedTime(
                                        time: duration.inSeconds -
                                            position.inSeconds),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (index < _items.length - 1) {
                                        setState(() {
                                          index++;
                                          isAudioReady = false;
                                        });
                                      } else {
                                        setState(() {
                                          index = 0;
                                          isAudioReady = false;
                                        });
                                      }
                                      if (isPlaying) {
                                        await audioPlayer.pause();
                                      }

                                      setState(() {
                                        isPlaying = false;
                                      });
                                      playMusic(_items[index].attatches ?? '');
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronLeft,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Duration? newTime;
                                      if (position.inSeconds.toInt() > 11) {
                                        newTime =
                                            position - Duration(seconds: 10);
                                      }
                                      await audioPlayer.seek(
                                          newTime ?? Duration(seconds: 0));
                                      await audioPlayer.resume();
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.anglesLeft,
                                      size: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      playMusic(_items[index].attatches ?? '');
                                    },
                                    child: Container(
                                        width: 45,
                                        height: 45,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: isPlaying ? 10 : 12,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: !isAudioReady
                                            ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                ))
                                            : FaIcon(
                                                isPlaying
                                                    ? FontAwesomeIcons.pause
                                                    : FontAwesomeIcons.play,
                                                size: 25,
                                                color: Colors.black,
                                              )),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Duration? newTime;
                                      if (position.inSeconds.toInt() <
                                          (duration.inSeconds.toInt() - 10)) {
                                        newTime =
                                            position + Duration(seconds: 10);
                                      }
                                      await audioPlayer.seek(newTime ??
                                          Duration(
                                              seconds: duration.inSeconds));
                                      await audioPlayer.resume();
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.anglesRight,
                                      size: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (index > 0) {
                                        setState(() {
                                          index--;
                                          isAudioReady = false;
                                        });
                                      } else {
                                        setState(() {
                                          index = _items.length - 1;
                                          isAudioReady = false;
                                        });
                                      }
                                      if (isPlaying) {
                                        await audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying = false;
                                      });
                                      playMusic(_items[index].attatches ?? '');
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronRight,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : ErrorScreen(reFreshPage: getMusicDetails);
            case ConnectionState.none:
              return ErrorScreen(reFreshPage: getMusicDetails);
            default:
              return AudioShimmer();
          }
        },
      )),
    );
  }

  void playMusic(String url) async {
    _url = url;
    if (url.isEmpty) return;

    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(url));
    }
    setState(() {
      isPlaying = !isPlaying;
      isAudioReady = true;
    });
  }
}
