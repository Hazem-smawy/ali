import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VidePlayer extends StatefulWidget {
  final String url;

  const VidePlayer({super.key, required this.url});

  @override
  State<VidePlayer> createState() => _VidePlayerState();
}

class _VidePlayerState extends State<VidePlayer> {
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController controller;
  late String id;

  @override
  void initState() {
    super.initState();

    id = YoutubePlayer.convertUrlToId(widget.url)!;
    controller = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    youtubePlayer = YoutubePlayer(
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.pink,
          width: double.infinity,
          child: youtubePlayer,
        )
      ]),
    );
  }
}
// YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: controller,
//         ),
//         builder: ((context, player) {
//           return Scaffold(
//             body: ListView(children: [player]),
//           );
//         }));