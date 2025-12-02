class CardModel {
  final String suit;
  final int rank;

  CardModel({required this.suit, required this.rank});

  @override
  String toString() => '$rank of $suit';
}
