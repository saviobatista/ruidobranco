import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tocando = false;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset('assets/audio.m4a');
    player.setLoopMode(LoopMode.one);
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (!tocando
                  ? IconButton(
                      onPressed: () {
                        player.play();
                        setState(() {
                          tocando = true;
                        });
                      },
                      icon: Icon(Icons.play_arrow),
                      iconSize: 128.0,
                    )
                  : IconButton(
                      onPressed: () {
                        player.pause();
                        setState(() {
                          tocando = false;
                        });
                      },
                      icon: Icon(Icons.stop_sharp),
                      iconSize: 128.0,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
