import 'dart:convert';

import 'package:ali_almatary/models/fatawa/fatawa_series_model.dart';
import 'package:ali_almatary/screens/error_screen/error.dart';
import 'package:ali_almatary/screens/video_screen/videos_shimmer.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:ali_almatary/widgets/fatawa_widgets/fatawa_series_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as client;

class FatawasSeresScreen extends StatefulWidget {
  const FatawasSeresScreen({super.key});

  @override
  State<FatawasSeresScreen> createState() => _FatawasSeresScreenState();
}

class _FatawasSeresScreenState extends State<FatawasSeresScreen> {
  final List<FatawaModel> _items = [];
  final _controller = ScrollController();
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;
  bool hasError = false;
  bool hasPage = false;

  void _getFatawaSeries() async {
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
          'action': 'getCategories',
          'Page': page.toString(),
          // 'Records_At_Page': '50'
        },
      );
      var allData = jsonDecode(res.body);
      var data = allData['data'] as List;
      print(data);
      var resData = data.map((e) => FatawaModel.fromJson(e));

      setState(() {
        page++;
        isLoading = false;

        if (resData.length < 10) {
          hasMore = false;
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
    _getFatawaSeries();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset &&
          hasMore) {
        hasPage = true;
        _getFatawaSeries();
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

    _getFatawaSeries();
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
                  reFreshPage: _getFatawaSeries,
                )
          : RefreshIndicator(
              onRefresh: reRefresh,
              child: ListView.builder(
                controller: _controller,
                itemCount: _items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < _items.length) {
                    return FatawaSeriesItem(
                        image: _items[index].img,
                        title: _items[index].title,
                        seriesCount: _items[index].postscount,
                        id: _items[index].guide!);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(
                          child: hasMore
                              ? const CircularProgressIndicator()
                              : hasPage
                                  ? Row(
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
                                    )
                                  : Container()),
                    );
                  }
                },
              ),
            ),
    );
  }
}
