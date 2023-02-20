import 'dart:io' as io;

import 'package:ali_almatary/screens/downloaded_screen/downloaded_shimmer_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DownloadedScreen extends StatefulWidget {
  const DownloadedScreen({super.key});

  @override
  State<DownloadedScreen> createState() => _DownloadedScreenState();
}

class _DownloadedScreenState extends State<DownloadedScreen> {
  List files = [];
  List namesFiles = [];
  String dir = '';

  getFiles() async {
    dir = (await getExternalStorageDirectory())!.path;
    setState(() {
      files = io.Directory(dir).listSync();
      namesFiles = files.map((e) => e!.path.split('/').last).toList();
    });
  }

  @override
  void initState() {
    getFiles();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: files.isEmpty
          ? const DwonloadedEmpty()
          : ListView.builder(
              padding: const EdgeInsets.all(25),
              itemCount: files.length,
              itemBuilder: (BuildContext context, int index) {
                return ShowFileWidget(
                  title: namesFiles[index],
                  path: files[index],
                );
              },
            ),
    );
  }
}

class ShowFileWidget extends StatelessWidget {
  final title;
  final path;
  const ShowFileWidget({Key? key, required this.title, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (path != null) {
          OpenFile.open(path!.path);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
            color: MyColors.bg, borderRadius: BorderRadius.circular(25)),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: MyColors.darkBlue,
              ),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.lightGreen.withOpacity(0.1),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.headphones,
                color: MyColors.darkBlue,
                size: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
        ]),
      ),
    );
  }
}
