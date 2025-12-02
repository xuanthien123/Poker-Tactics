import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerSlot extends PositionComponent {
  final String playerId;

  PlayerSlot({required this.playerId});

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.blueAccent;
    canvas.drawRect(size.toRect(), paint);
  }
}
