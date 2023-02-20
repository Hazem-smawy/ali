import 'package:ali_almatary/screens/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class AudioShimmer extends StatelessWidget {
  const AudioShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ShimmerWidget.circular(
                height: 40,
                width: double.infinity,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 20,
              ),
              ShimmerWidget.circular(
                height: 2,
                width: double.infinity,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 10,
              ),
              const buildVideoShimmer(),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Container()),
              ShimmerWidget.circular(
                height: 3,
                width: double.infinity,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ShimmerWidget.circular(
                    height: 30,
                    width: 30,
                  ),
                  ShimmerWidget.circular(
                    height: 30,
                    width: 30,
                  ),
                  ShimmerWidget.circular(
                    height: 45,
                    width: 45,
                  ),
                  ShimmerWidget.circular(
                    height: 30,
                    width: 30,
                  ),
                  ShimmerWidget.circular(
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}

class buildVideoShimmer extends StatelessWidget {
  const buildVideoShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              ShimmerWidget.circular(
                height: 40,
                width: 40,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ShimmerWidget.circular(
                  height: 40,
                  width: double.infinity,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
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
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
