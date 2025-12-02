import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/card_component.dart';
import 'components/deck_component.dart';
import 'components/player_slot.dart';
import 'components/pet_component.dart';

/// A simple Flame game that will manage the card table.
class CardTableGame extends FlameGame {
  CardTableGame();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Add your components here. These are placeholders so the project compiles.
    add(DeckComponent());
    add(PlayerSlot(playerId: 'player1'));
    add(PetComponent());
    add(CardComponent(rank: 1, suit: 'hearts'));
  }
}
