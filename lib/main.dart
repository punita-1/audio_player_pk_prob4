import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(SoundPlayerApp());
}

class SoundPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoundPlayerScreen(),
    );
  }
}

class SoundPlayerScreen extends StatelessWidget {
  final List<Map<String, String>> sounds = [
    {'title': 'Sound 1', 'file': 'assets/sounds/sound1.mp3'},
    {'title': 'Sound 2', 'file': 'assets/sounds/sound2.mp3'},
    {'title': 'Sound 3', 'file': 'assets/sounds/sound3.mp3'},
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sound Player')),
      body: ListView.builder(
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          final sound = sounds[index];
          return ListTile(
            title: Text(sound['title']!),
            trailing: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () async {
                try {
                  await audioPlayer.setAsset(sound['file']!);
                  await audioPlayer.play();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error playing sound: $e')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
