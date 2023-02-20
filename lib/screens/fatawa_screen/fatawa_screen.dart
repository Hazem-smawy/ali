import 'package:ali_almatary/models/fatawa/fatawa_item.dart';
import 'package:ali_almatary/screens/error_screen/error.dart';
import 'package:ali_almatary/screens/video_screen/video_sub_shimmer.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:ali_almatary/widgets/fatawa_widgets/fatawas_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

class FatawasScreen extends StatefulWidget {
  final String guide;
  const FatawasScreen({super.key, required this.guide});

  @override
  State<FatawasScreen> createState() => _FatawasScreenState();
}

class _FatawasScreenState extends State<FatawasScreen> {
  // vars
  final List<FatawaData> _items = [];
  final _controller = ScrollController();
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;
  bool hasError = false;
  bool showArrow = false;
  double offset = 0.0;
  double minOffset = 0.0;

  // fetch function
  void _getVideos() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    String urlString = 'sh-alialmatry.com';
    Uri url = Uri.https(urlString, 'API/index4.php');
    try {
      var res = await client.post(
        url,
        body: {
          'action': 'getCategoryData',
          'ID': widget.guide,
          'Page': page.toString(),
          // 'Records_At_Page': '50'
        },
      );
      var allData = jsonDecode(res.body);
      var data = allData['data'] as List;

      var resData = data.map((e) => FatawaData.fromJson(e));

      setState(() {
        page++;
        isLoading = false;

        if (resData.length < 10) {
          hasMore = false;
          showArrow = false;
        }
        _items.addAll(resData);
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
      offset = _controller.offset;
      if (_controller.position.maxScrollExtent == _controller.offset &&
          hasMore) {
        _getVideos();
        minOffset = _controller.offset;
      }

      if (offset > minOffset && minOffset == 0.0) {
        setState(() {
          showArrow = false;
        });
      } else if (offset < 600) {
        setState(() {
          showArrow = false;
        });
      } else {
        setState(() {
          showArrow = true;
        });
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
      showArrow = false;
    });

    _getVideos();
  }

  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? !hasError
              ? const VideoSubShimmer()
              : ErrorScreen(
                  reFreshPage: _getVideos,
                )
          : RefreshIndicator(
              onRefresh: reRefresh,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: _controller,
                    itemCount: _items.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < _items.length) {
                        return FatawaItem(
                          title: _items[index].title!,
                          content: _items[index].content,
                        );
                      } else {
                        return showArrow
                            ? Padding(
                                padding: const EdgeInsets.all(25),
                                child: Center(
                                  child: hasMore
                                      ? const CircularProgressIndicator()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              'لا يوجد بيانات',
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            // Container(
                                            //     child: InkWell(
                                            //   onTap: _scrollUp,
                                            //   child: Container(
                                            //     padding:
                                            //         const EdgeInsets.all(10),
                                            //     decoration: BoxDecoration(
                                            //       borderRadius:
                                            //           BorderRadius.circular(10),
                                            //       color: MyColors.lightGreen
                                            //           .withOpacity(0.7),
                                            //     ),
                                            //     child: const Center(
                                            //       child: FaIcon(
                                            //         FontAwesomeIcons.arrowUp,
                                            //         color: Colors.white,
                                            //         size: 20,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ))
                                          ],
                                        ),
                                ),
                              )
                            : const SizedBox();
                      }
                    },
                  ),
                  if (showArrow)
                    Positioned(
                        right: 30,
                        bottom: 35,
                        child: Container(
                            child: InkWell(
                          onTap: _scrollUp,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.lightGreen.withOpacity(0.7),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.arrowUp,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )))
                ],
              ),
            ),
    );
  }
}
