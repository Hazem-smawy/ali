import 'package:ali_almatary/screens/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class VideoShimmer extends StatelessWidget {
  const VideoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return const buildVideoShimmer();
        });
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
      height: 350,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ShimmerWidget.circular(
            height: 220,
            width: double.infinity,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 10,
          ),
          ShimmerWidget.circular(
            height: 20,
            width: 100,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(
            height: 10,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShimmerWidget.circular(
                height: 20,
                width: 100,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                width: 10,
              ),
              ShimmerWidget.circular(
                height: 40,
                width: 40,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
