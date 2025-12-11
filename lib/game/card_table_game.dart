import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/card_component.dart';
import 'components/deck_component.dart';
import 'components/player_slot.dart';

/// A simple Flame game that will manage the card table.
class CardTableGame extends FlameGame {
  CardTableGame();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    // Add a blue background component that covers the entire screen
    final background = RectangleComponent(
      size: size,
      paint: Paint()..color = const Color.fromARGB(255, 88, 132, 5), // Dark green-blue (poker table color)
    );
    addAll([background]);
    // Layout 10 player slots in a 5x2 grid and a single draggable card.
    final cols = 5;
    final rows = 2;
    final slotSize = Vector2(70, 100);
    final spacing = 16.0;

    final totalWidth = cols * slotSize.x + (cols - 1) * spacing;
    final startX = (size.x - totalWidth) / 2;
    final startY = size.y * 0.35;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        final idx = r * cols + c;
        final x = startX + c * (slotSize.x + spacing);
        final y = startY + r * (slotSize.y + spacing);
        final slot = PlayerSlot(playerId: 'slot_$idx', index: idx)
          ..position = Vector2(x, y)
          ..size = slotSize;
        add(slot);
      }
    }

    // Add a deck component (visual only) at the top-left
    final deck = DeckComponent()..position = Vector2(20, 20)..size = Vector2(80, 50);
    add(deck);

    // Add a single draggable card in the deck area
    final card = CardComponent(rank: 'a', suit: 'bich')..position = Vector2(30, 25);
    add(card);
    final card2 = CardComponent(rank: '2', suit: 'bich')..position = Vector2(30, 25);
    add(card2);
  }
}
