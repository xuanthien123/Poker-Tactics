import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PetComponent extends PositionComponent {
  PetComponent();

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 10, paint);
  }
}
