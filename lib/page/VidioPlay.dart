import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VidioPlay extends StatefulWidget {
  String title;
  String time;
  String cover;
  String mp4url;
  String topicimg;
  String topicname;
  VidioPlay({
   this.cover,
   this.title,
   this.time,
   this.mp4url,
   this.topicimg,
   this.topicname
});
  @override
  _VidioPlayState createState() => _VidioPlayState(
    title: title,
    time: time,
    cover: cover,
    mp4url: mp4url,
    topicimg: topicimg,
    topicname: topicname,
  );
}

class _VidioPlayState extends State<VidioPlay> {
  String title;
  String time;
  String cover;
  String mp4url;
  String topicimg;
  String topicname;
  _VidioPlayState({
    this.cover,
    this.title,
    this.time,
    this.mp4url,
    this.topicimg,
    this.topicname
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: 300,
        child:  Chewie(
          controller: ChewieController(
            videoPlayerController: VideoPlayerController.network(
              "$mp4url"
            ),
            aspectRatio: 3 / 2,
            autoPlay: false,
            looping: false,
          )
        )

      ),
    );
  }


}
