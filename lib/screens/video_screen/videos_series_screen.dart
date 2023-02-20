import 'dart:convert';

import 'package:ali_almatary/models/video/video_series.dart';
import 'package:ali_almatary/screens/error_screen/error.dart';
import 'package:ali_almatary/screens/video_screen/videos_shimmer.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:ali_almatary/widgets/video/video_series_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as client;

class VideosSeresScreen extends StatefulWidget {
  const VideosSeresScreen({super.key});

  @override
  State<VideosSeresScreen> createState() => _VideosSeresScreenState();
}

class _VideosSeresScreenState extends State<VideosSeresScreen> {
  final List<VideoSeriesData> _items = [];
  final _controller = ScrollController();
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;
  bool hasError = false;

  void _getVideos() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    String urlString = 'sh-alialmatry.com';
    Uri url = Uri.https(urlString, 'API/index2.php');
    try {
      var res = await client.post(
        url,
        body: {
          'action': 'getCategories',
          'Page': page.toString(),
          // 'Records_At_Page': '50'
        },
      );
      var allData = jsonDecode(res.body);
      var data = allData['data'] as List;

      var resData = data.map((e) => VideoSeriesData.fromJson(e));

      setState(() {
        page++;
        isLoading = false;

        if (resData.length < 10) {
          hasMore = false;
          print('finish');
        }
        _items.addAll(resData);
        print(_items.length);
      });
    } catch (e) {
      isLoading = false;
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  void initState() {
    _getVideos();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset &&
          hasMore) {
        _getVideos();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Future reRefresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1;
      _items.clear();
    });

    _getVideos();
  }

  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? !hasError
              ? const VideoShimmer()
              : ErrorScreen(
                  reFreshPage: _getVideos,
                )
          : RefreshIndicator(
              onRefresh: reRefresh,
              child: ListView.builder(
                controller: _controller,
                itemCount: _items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < _items.length) {
                    return VideoSeriesItem(
                        title: _items[index].title!,
                        image: _items[index].img!,
                        seriesCount: _items[index].postscount!,
                        guid: _items[index].guide!);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(
                          child: hasMore
                              ? const CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'لا يوجد بيانات',
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _scrollUp,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: MyColors.lightGreen,
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.arrowUp,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                    );
                  }
                },
              ),
            ),
    );
  }
}
