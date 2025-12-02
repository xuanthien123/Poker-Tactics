import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:poker_tactics/game/card_table_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = CardTableGame();
    return Scaffold(
      appBar: AppBar(title: const Text('Game')),
      body: GameWidget(game: game),
    );
  }
}
