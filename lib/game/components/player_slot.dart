import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerSlot extends PositionComponent {
  final String playerId;
  final int index;
  bool occupied = false;

  PlayerSlot({required this.playerId, this.index = 0}) : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2(70, 100);
    anchor = Anchor.topLeft;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = occupied ? Colors.green.shade400 : Colors.blueAccent;
    final rect = size.toRect();
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)), paint);
    final tp = TextPainter(
      text: TextSpan(text: 'Slot ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 12)),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.x - 8);
    tp.paint(canvas, Offset(6, (size.y - tp.height) / 2));
  }
}
