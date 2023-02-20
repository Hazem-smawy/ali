import 'package:ali_almatary/screens/error_screen/error.dart';
import 'package:ali_almatary/screens/video_screen/details_shimmer.dart';
import 'package:ali_almatary/widgets/video/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({super.key});
  static const routeName = '/video-detail';

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  late final id;
  bool _isTest = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isTest) {
      id = ModalRoute.of(context)?.settings.arguments as String;
    }
    _isTest = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Uri url = Uri.https('sh-alialmatry.com', 'API/index2.php');

  Future getVideos() async {
    try {
      var response =
          await client.post(url, body: {'action': 'getPostData', 'ID': id});

      var data = jsonDecode(response.body);
      return data['data'];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder(
          future: getVideos(),
          builder: ((context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const VideoDetailsShimmer()
                  : snapshot.hasData
                      ? Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(
                                      colors: [Colors.pink, Colors.purple],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: VidePlayer(
                                        url: snapshot.data['attatches'])),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data['title'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Html(
                                      data: snapshot.data['content'],
                                      style: {
                                        'p': Style(
                                            direction: TextDirection.rtl,
                                            textAlign: TextAlign.right)
                                      },
                                    )),
                                //   Text(
                                //     snapshot.data['content'],
                                //     style: const TextStyle(
                                //         color: Colors.grey,
                                //         fontFamily: "Cairo",
                                //         fontWeight: FontWeight.normal,
                                //         fontSize: 13),
                                //     overflow: TextOverflow.clip,
                                //     textAlign: TextAlign.right,
                                //   ),
                                // ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      : ErrorScreen(reFreshPage: getVideos)),
        )),
      ),
    );
  }
}
