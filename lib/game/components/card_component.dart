import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CardComponent extends PositionComponent {
  final int rank;
  final String suit;

  CardComponent({this.rank = 1, this.suit = 'hearts'});

  @override
  void render(Canvas canvas) {
    // Simple placeholder rendering
    final paint = Paint()..color = Colors.white;
    canvas.drawRect(size.toRect(), paint);
    // Draw rank and suit text
    // Real implementation would use sprites or images
  }
}
