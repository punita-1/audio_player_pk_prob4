import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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

  void playSound(String filePath) async {
    await audioPlayer.play(AssetSource(filePath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Player'),
      ),
      body: ListView.builder(
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          final sound = sounds[index];
          return ListTile(
            leading: Icon(Icons.music_note),
            title: Text(sound['title']!),
            trailing: Icon(Icons.play_arrow),
            onTap: () => playSound(sound['file']!),
          );
        },
      ),
    );
  }
}
