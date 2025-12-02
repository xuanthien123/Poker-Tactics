import 'card_model.dart';
import 'player_model.dart';

class GameState {
  final List<PlayerModel> players;
  final List<CardModel> deck;
  String currentTurnPlayerId;

  GameState({required this.players, required this.deck, required this.currentTurnPlayerId});
}
