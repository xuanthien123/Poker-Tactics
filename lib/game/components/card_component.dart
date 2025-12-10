import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'player_slot.dart';

/// A draggable card component implemented with Flame's Drag callbacks.
class CardComponent extends PositionComponent with DragCallbacks, HasGameReference<FlameGame> {
  final int rank;
  final String suit;

  CardComponent({this.rank = 1, this.suit = 'hearts'}) : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2(60, 90);
    anchor = Anchor.topLeft;
  }

  @override
  void render(Canvas canvas) {
    final rect = size.toRect();
    final paint = Paint()..color = Colors.white;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(6)), paint);
    final border = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black26
      ..strokeWidth = 1;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(6)), border);

    // Draw rank and suit using TextPainter
    final tp = TextPainter(
      text: TextSpan(
        text: '$rank\n',
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        children: [TextSpan(text: suit, style: const TextStyle(fontSize: 14))],
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.x);
    tp.paint(canvas, Offset((size.x - tp.width) / 2, (size.y - tp.height) / 2));
  }

  @override
  void onDragStart(DragStartEvent info) {
    // raise priority so the card renders on top while dragging
    priority = 1000;
  }

  @override
  void onDragUpdate(DragUpdateEvent info) {
    // move by the drag delta (game coordinates)
    position.add(info.canvasDelta);
  }

  @override
  void onDragEnd(DragEndEvent info) {
    // On drag end, find a PlayerSlot to snap into (if any)
    final slots = game.children.whereType<PlayerSlot>().toList();
    // compute card center in world coords
    final cardCenter = absolutePosition + size / 2;
    for (final slot in slots) {
      final slotPos = slot.absolutePosition;
      final slotRect = Rect.fromLTWH(slotPos.x, slotPos.y, slot.size.x, slot.size.y);
      if (slotRect.contains(Offset(cardCenter.x, cardCenter.y))) {
        // Snap card to slot (centered)
        position.setValues(
          slot.position.x + (slot.size.x - size.x) / 2,
          slot.position.y + (slot.size.y - size.y) / 2,
        );
        slot.occupied = true;
        priority = 0;
        return;
      }
    }
    // If not dropped on a slot, keep at current position and reset priority
    priority = 0;
  }
}
