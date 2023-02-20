import 'package:ali_almatary/screens/about_screen/about_screen.dart';
import 'package:ali_almatary/screens/contact_screen/cantact.dart';
import 'package:ali_almatary/screens/downloaded_screen/downloaded_screen.dart';
import 'package:ali_almatary/screens/home_screen/home_screen.dart';
import 'package:ali_almatary/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int index = 4;

  final List<Widget> currentPage = [
    const DownloadedScreen(),
    const SearchScreen(),
    const ContactScreen(),
    const AboutAliScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
        currentIndex: index,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.download),
            label: 'ملفاتي',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.phone),
            label: 'اتصل بنا',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'عن الشيخ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'الرئيسيه',
          ),
        ],
        onTap: (value) => setState(() {
          index = value;
        }),
      ),
    );
  }
}
