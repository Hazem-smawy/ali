// ignore_for_file: unnecessary_string_interpolations

import 'dart:io' as io;
import 'package:ali_almatary/screens/downloaded_screen/downloaded_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String title;
  final String audio;
  bool isPlaying;

  AudioPlayerWidget(
      {super.key,
      required this.title,
      required this.audio,
      required this.isPlaying});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  //color: Color.fromRGBO(145, 135, 82, 1),

  // color: Color.fromRGBO(16, 19, 28, 1),
  bool isLoading = false;
  bool isFinished = false;
  bool permissionGranted = false;

  List files = [];
  List namesFiles = [];
  String dir = '';

  getFiles() async {
    dir = (await getExternalStorageDirectory())!.path;
    print(dir);
    setState(() {
      files = io.Directory(dir).listSync();
      namesFiles = files.map((e) => e!.path.split('/').last).toList();
      var name = '${widget.title}.mp3';
      if (namesFiles.contains(name)) {
        setState(() {
          isFinished = true;
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    _getStoragePermission();
    // TODO: implement initState
    super.initState();
    getFiles();
  }

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isPlaying
            ? const Color.fromARGB(63, 145, 135, 82)
            : MyColors.bg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!isFinished && !isLoading)
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });

                openFile(url: widget.audio, fileName: widget.title).then(
                  (value) {
                    setState(() {
                      isFinished = true;
                      isLoading = false;
                    });
                    getFiles();
                  },
                );
              },
              child: const FaIcon(
                FontAwesomeIcons.download,
                size: 18,
                color: Colors.pink,
              ),
            ),
          if (isLoading && !isFinished)
            const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          if (isFinished && !isLoading)
            InkWell(
              onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DownloadedScreen()))),
              child: const FaIcon(
                FontAwesomeIcons.bookmark,
                size: 18,
                color: Color.fromARGB(255, 27, 92, 29),
              ),
            ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.isPlaying
                        ? const Color.fromRGBO(16, 19, 28, 1)
                        : Colors.black,
                    fontFamily: "Cairo",
                    fontWeight:
                        widget.isPlaying ? FontWeight.bold : FontWeight.normal,
                    fontSize: 15),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const FaIcon(
            FontAwesomeIcons.microphone,
            size: 30,
            color: Color.fromARGB(255, 94, 95, 17),
          ),
        ],
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    var name = fileName ?? url.split('/').last;
    if (!name.contains('.mp3')) {
      name = '$name.mp3';
    }
    final file = await downloadFile(url: url, name: name);
    print(file);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<io.File?> downloadFile({required String url, String? name}) async {
    if (permissionGranted) {
      final appStorage = await getExternalStorageDirectory();
      final file = io.File('${appStorage!.path}/$name');

      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: io.FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    }
    try {} catch (e) {
      print(e);
    }
    return null;
  }
}
