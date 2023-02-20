import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool downloading = false;
  String progressPar = '';
  var imageUrl =
      'https://www.sh-alialmatry.com/uploads/posts/2023010110172144.jpg';

  final ReceivePort _port = ReceivePort();
  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (status == DownloadTaskStatus.complete) {
        print('Download Completed');
      }
      setState(() {});
    });
    // downloadingFile();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  Future download(String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: baseStorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    }
  }
  // Future<void> downloadingFile() async {
  //   Dio dio = Dio();

  //   try {
  //     var dir = await getApplicationDocumentsDirectory();
  //     var dir2 = await getExternalStorageDirectory();
  //     print('dir:$dir2');
  //     await dio.download(
  //       imageUrl,
  //       "$dir2/myImage",
  //       onReceiveProgress: (count, total) {
  //         print("Rec: $count, Total: $total");
  //         setState(() {
  //           downloading = true;
  //           progressPar = ((count / total) * 100).toStringAsFixed(2);
  //         });
  //       },
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  //   setState(() {
  //     downloading = false;
  //     progressPar = 'Completed';
  //   });
  //   print('DownLoading Completed');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () =>
            download('https://download.samplelib.com/mp4/sample-5s.mp4'),
      )),
    );
  }
}
