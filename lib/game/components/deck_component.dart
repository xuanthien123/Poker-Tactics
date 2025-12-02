import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DeckComponent extends PositionComponent {
  DeckComponent();

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.brown;
    canvas.drawRect(size.toRect(), paint);
  }
}
