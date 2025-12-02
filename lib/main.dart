import 'package:flutter/material.dart';
import 'package:poker_tactics/presentation/screens/lobby_screen.dart';
import 'package:poker_tactics/presentation/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Tactics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LobbyScreen(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
