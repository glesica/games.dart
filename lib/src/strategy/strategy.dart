import 'package:games/src/game.dart';
import 'package:games/src/move.dart';
import 'package:games/src/player.dart';

abstract class Strategy {
  Move nextMove(Game game, Player player);
}
