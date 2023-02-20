import 'package:ali_almatary/screens/fatawa_screen/fatawa_seires_screen.dart';
import 'package:ali_almatary/screens/music_screen/audios_screen.dart';
import 'package:ali_almatary/screens/video_screen/videos_series_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:ali_almatary/widgets/home_widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Color iconColor = MyColors.darkBlue.withOpacity(0.7);
  List iconList = [
    {
      'icon': FontAwesomeIcons.facebook,
    },
    {
      'icon': FontAwesomeIcons.twitter,
    },
    {
      'icon': FontAwesomeIcons.snapchat,
    },
    {
      'icon': FontAwesomeIcons.youtube,
    },
    {
      'icon': FontAwesomeIcons.instagram,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: pageSize.height / 1.8,
              width: pageSize.width - 20,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      width: 50,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.bg.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: iconList
                            .map((e) => SociolIconItem(icon: e['icon']))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(10),
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                    )
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: Wrap(
                textDirection: TextDirection.rtl,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 15,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  LinkWidget(
                    title: 'المرئيات',
                    icon: FontAwesomeIcons.video,
                    goToPage: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideosSeresScreen()));
                    },
                  ),
                  LinkWidget(
                    title: 'الصوتيات',
                    icon: FontAwesomeIcons.headphones,
                    goToPage: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AudioScreen()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  LinkWidget(
                    title: ' الدروس',
                    icon: FontAwesomeIcons.file,
                    goToPage: () {},
                  ),
                  LinkWidget(
                    title: 'الفتاوى',
                    icon: FontAwesomeIcons.book,
                    goToPage: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FatawasSeresScreen()),
                      );
                    },
                  ),
                  LinkWidget(
                    title: ' المقالات',
                    icon: FontAwesomeIcons.noteSticky,
                    goToPage: () {},
                  ),
                  LinkWidget(
                    title: 'الدرر الدينية',
                    icon: FontAwesomeIcons.noteSticky,
                    goToPage: () {},
                  ),
                  LinkWidget(
                    title: ' الكتب و المؤلفات',
                    icon: FontAwesomeIcons.book,
                    goToPage: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SociolIconItem extends StatelessWidget {
  IconData icon;

  SociolIconItem({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      size: 23,
      color: MyColors.darkBlue,
    );
  }
}
