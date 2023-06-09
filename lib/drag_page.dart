import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DragPage extends StatefulWidget {
  const DragPage({Key? key}) : super(key: key);

  @override
  State<DragPage> createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  double width = 70.0, height = 70.0;
  double _x = 0;
  double _y = 0;

  AppBar? appBar;

  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Widget circle() {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: Text(
          "Drag",
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }

  Widget draggable() {
    return Positioned(
      left: _x,
      top: _y,
      child:  Draggable(
        child: Container(
          width: 100,
            child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller))),
        feedback: Container(
            width: 100,
            height: 100,
            child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller))),
        childWhenDragging: Container(),
        onDragEnd: (dragDetails) {
          setState(
                () {
              _x = dragDetails.offset.dx;
              // We need to remove offsets like app/status bar from Y
              _y = dragDetails.offset.dy -
                  appBar!.preferredSize.height -
                  MediaQuery.of(context).padding.top;
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
      leading: BackButton(onPressed: () {
        Navigator.pop(context, false);
      }),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          draggable(),
        ],
      ),
    );
  }
}
