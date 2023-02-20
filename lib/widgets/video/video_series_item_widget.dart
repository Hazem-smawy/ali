import 'package:ali_almatary/screens/video_screen/videos_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoSeriesItem extends StatefulWidget {
  final String image;
  final String title;
  final String seriesCount;
  final String guid;
  const VideoSeriesItem({
    required this.title,
    required this.image,
    required this.seriesCount,
    required this.guid,
    Key? key,
  }) : super(key: key);

  @override
  State<VideoSeriesItem> createState() => _VideoSeriesItemState();
}

class _VideoSeriesItemState extends State<VideoSeriesItem> {
  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(seconds: 10), maxNrOfCacheObjects: 10));

  void clearCached() {
    imageCache.clear();
    imageCache.clearLiveImages();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideosScreen(
                      guide: widget.guid,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: MyColors.bg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Stack(fit: StackFit.expand, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              //cacheManager: customCacheManager,
                              imageUrl: widget.image,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          // CachedNetworkImage(
                          //   imageUrl: image,
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: imageProvider,
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          //   placeholder: (context, url) =>
                          //       const CircularProgressIndicator(),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          // ),
                          // const CircleAvatar(
                          //   backgroundColor: Color.fromARGB(123, 222, 221, 221),
                          //   radius: 40,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(left: 8.0),
                          //     child: FaIcon(
                          //       FontAwesomeIcons.play,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                        ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //

                          const Text(
                            "سلسله",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              color: MyColors.textPrimary,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.title,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontFamily: "Cairo"),
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "محتوى",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 14,
                                    color: MyColors.textSmall,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: MyColors.darkBrown,
                                  ),
                                  child: Text(
                                    widget.seriesCount,
                                    style: const TextStyle(
                                        color: MyColors.bg,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),

                                //
                              ])
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
