import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker_tactics/game/card_table_game.dart';
import 'package:poker_tactics/presentation/screens/game_screen.dart';
import 'package:poker_tactics/services/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Allow all orientations (auto-rotate like normal games)
  // await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  // Enable immersive fullscreen (hides system bars)
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // AutoOrientation.landscapeAutoMode();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(
        game: CardTableGame(),
        overlayBuilderMap: {
          GameRoute.lobbyRoute: (context, game) {
            return Container(
              color: const Color(0xFF000000),
              child: Text('A pause menu'),
            );
          },
          GameRoute.gameRoute: (context, game) {
            return const GameScreen();
          },
        },
      ),
    );
  }
}
