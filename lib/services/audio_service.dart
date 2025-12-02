import 'package:flutter/foundation.dart';

/// Placeholder AudioService. Replace with `just_audio` or `audioplayers` for real audio.
class AudioService {
  AudioService();

  Future<void> init() async {
    // initialize audio, load assets, etc.
  }

  Future<void> playSound(String assetName) async {
    // placeholder
    if (kDebugMode) {
      print('Playing sound: $assetName');
    }
  }

  Future<void> dispose() async {
    // cleanup
  }
}
