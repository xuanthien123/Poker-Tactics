import 'package:flutter/material.dart';
import 'package:poker_tactics/presentation/screens/game_screen.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lobby')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/game'),
          child: const Text('Enter Table'),
        ),
      ),
    );
  }
}
