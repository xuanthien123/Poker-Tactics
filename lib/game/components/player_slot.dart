import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:poker_tactics/game/components/card_component.dart';
import 'package:poker_tactics/services/assets.dart';

class PlayerSlot extends PositionComponent with TapCallbacks, HasGameReference<FlameGame> {
  final String playerId;
  final int index;
  bool occupied = false;

  PlayerSlot({required this.playerId, this.index = 0}) : super();

  late SpriteComponent bg;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2(62, 86);
    anchor = Anchor.topLeft;
    bg = SpriteComponent(
      sprite: await Sprite.load(Assets.cardHolder),
      size: Vector2(62, 86),
    );
  }

  @override
  void render(Canvas canvas) {
    bg.render(canvas);
  }

  @override
  void onTapDown(TapDownEvent event) { // change position of selected card to this slot
    super.onTapDown(event);
    final cards = game.children.whereType<CardComponent>().toList();
    for (final card in cards) {
      if (card.isSelected) {
        card.changePosition(position.clone());
        card.unselect();
        // occupied = true;
        break;
      }
    }
  }
}
