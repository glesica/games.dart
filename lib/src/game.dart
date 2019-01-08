import 'package:games/src/move.dart';
import 'package:games/src/player.dart';

abstract class Game {
  Game play(Player player, Move move);
}
