import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DraggablePLayer extends StatelessWidget {
  const DraggablePLayer({
    Key? key,
    required this.onDragEnd,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;
  final void Function(DraggableDetails)? onDragEnd;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: SizedBox(
          width: 150,
          child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller))),
      childWhenDragging: Container(),
      onDragEnd: onDragEnd,
      child: SizedBox(
          width: 150,
          child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller))),
    );
    ;
  }
}
