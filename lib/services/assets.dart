/// Static asset paths for the Poker Tactics game.
class Assets {
  // Base path for card assets
  static const String _cardsBasePath = 'cards_assets/';

  // Card back
  static const String cardBack = '${_cardsBasePath}back_face.png';

  // Spades (Bích)
  static const String ace_bich = '${_cardsBasePath}a_bich.png';
  static const String two_bich = '${_cardsBasePath}2_bich.png';
  static const String three_bich = '${_cardsBasePath}3_bich.png';
  static const String four_bich = '${_cardsBasePath}4_bich.png';
  static const String five_bich = '${_cardsBasePath}5_bich.png';
  static const String six_bich = '${_cardsBasePath}6_bich.png';
  static const String seven_bich = '${_cardsBasePath}7_bich.png';
  static const String eight_bich = '${_cardsBasePath}8_bich.png';
  static const String nine_bich = '${_cardsBasePath}9_bich.png';
  static const String ten_bich = '${_cardsBasePath}10_bich.png';
  static const String jack_bich = '${_cardsBasePath}j_bich.png';
  static const String queen_bich = '${_cardsBasePath}q_bich.png';
  static const String king_bich = '${_cardsBasePath}k_bich.png';

  // Clubs (Chuỗng)
  static const String ace_chuong = '${_cardsBasePath}a_chuong.png';
  static const String two_chuong = '${_cardsBasePath}2_chuong.png';
  static const String three_chuong = '${_cardsBasePath}3_chuong.png';
  static const String four_chuong = '${_cardsBasePath}4_chuong.png';
  static const String five_chuong = '${_cardsBasePath}5_chuong.png';
  static const String six_chuong = '${_cardsBasePath}6_chuong.png';
  static const String seven_chuong = '${_cardsBasePath}7_chuong.png';
  static const String eight_chuong = '${_cardsBasePath}8_chuong.png';
  static const String nine_chuong = '${_cardsBasePath}9_chuong.png';
  static const String ten_chuong = '${_cardsBasePath}10_chuong.png';
  static const String jack_chuong = '${_cardsBasePath}j_chuong.png';
  static const String queen_chuong = '${_cardsBasePath}q_chuong.png';
  static const String king_chuong = '${_cardsBasePath}k_chuong.png';

  // Diamonds (Cơ)
  static const String ace_co = '${_cardsBasePath}a_co.png';
  static const String two_co = '${_cardsBasePath}2_co.png';
  static const String three_co = '${_cardsBasePath}3_co.png';
  static const String four_co = '${_cardsBasePath}4_co.png';
  static const String five_co = '${_cardsBasePath}5_co.png';
  static const String six_co = '${_cardsBasePath}6_co.png';
  static const String seven_co = '${_cardsBasePath}7_co.png';
  static const String eight_co = '${_cardsBasePath}8_co.png';
  static const String nine_co = '${_cardsBasePath}9_co.png';
  static const String ten_co = '${_cardsBasePath}10_co.png';
  static const String jack_co = '${_cardsBasePath}j_co.png';
  static const String queen_co = '${_cardsBasePath}q_co.png';
  static const String king_co = '${_cardsBasePath}k_co.png';

  // Hearts (Rô)
  static const String ace_ro = '${_cardsBasePath}a_ro.png';
  static const String two_ro = '${_cardsBasePath}2_ro.png';
  static const String three_ro = '${_cardsBasePath}3_ro.png';
  static const String four_ro = '${_cardsBasePath}4_ro.png';
  static const String five_ro = '${_cardsBasePath}5_ro.png';
  static const String six_ro = '${_cardsBasePath}6_ro.png';
  static const String seven_ro = '${_cardsBasePath}7_ro.png';
  static const String eight_ro = '${_cardsBasePath}8_ro.png';
  static const String nine_ro = '${_cardsBasePath}9_ro.png';
  static const String ten_ro = '${_cardsBasePath}10_ro.png';
  static const String jack_ro = '${_cardsBasePath}j_ro.png';
  static const String queen_ro = '${_cardsBasePath}q_ro.png';
  static const String king_ro = '${_cardsBasePath}k_ro.png';

  /// Get card asset by rank and suit.
  /// Rank: 'a', '2'-'10', 'j', 'q', 'k'
  /// Suit: 'bich' (spades), 'chuong' (clubs), 'co' (diamonds), 'ro' (hearts)
  static String getCardAsset(String rank, String suit) {
    return '${_cardsBasePath}${rank}_${suit}.png';
  }
}
