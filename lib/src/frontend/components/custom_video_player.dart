import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPayer extends StatefulWidget {
  const CustomVideoPayer({super.key});

  @override
  State<CustomVideoPayer> createState() => _CustomVideoPayerState();
}

class _CustomVideoPayerState extends State<CustomVideoPayer> {
  late YoutubePlayerController _controller;

  final bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "Ym5UCsyR3HE",
      flags: YoutubePlayerFlags(
        mute: _muted,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: const <Widget>[
          SizedBox(width: 8.0),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {},
      ),
    );
  }
}
