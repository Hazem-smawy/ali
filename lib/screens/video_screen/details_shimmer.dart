import 'package:ali_almatary/screens/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class VideoDetailsShimmer extends StatelessWidget {
  const VideoDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: buildVideoShimmer(),
    );
  }
}

class buildVideoShimmer extends StatelessWidget {
  const buildVideoShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ShimmerWidget.circular(
            height: 200,
            width: double.infinity,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 20,
          ),
          ShimmerWidget.circular(
            height: 20,
            width: double.infinity,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 20,
            width: 200,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 30,
          ),
          ShimmerWidget.circular(
            height: 4,
            width: double.infinity,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 30,
          ),
          ShimmerWidget.circular(
            height: 15,
            width: 50,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 10,
            width: 350,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 10,
            width: 200,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 10,
            width: 350,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 15,
            width: 350,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 10,
            width: 350,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 15,
            width: 50,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 10,
            width: 150,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 15,
            width: 350,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
