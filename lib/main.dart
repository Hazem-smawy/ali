import 'package:ali_almatary/screens/music_screen/audios_details_screen.dart';
import 'package:ali_almatary/screens/video_screen/video_details_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:ali_almatary/widgets/home_widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.containerBg,
        fontFamily: "Cairo",
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: MyColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            titleMedium: TextStyle(
              color: MyColors.textSecondry,
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            )
            // ignore: unnecessary_const
            ),
      ),
      home: const SafeArea(child: BottomBarWidget()),
      routes: {
        VideoDetailsScreen.routeName: ((context) => const VideoDetailsScreen()),
        AudioDetailsScreen.routeName: ((context) => const AudioDetailsScreen())
      },
    );
  }
}
