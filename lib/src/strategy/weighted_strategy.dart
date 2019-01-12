import 'dart:math';

import 'package:games/src/game.dart';
import 'package:games/src/move.dart';
import 'package:games/src/player.dart';
import 'package:games/src/strategy/strategy.dart';

class WeightedStrategy implements Strategy {
  List<int> _cumWeights = <int>[];

  List<Move> _moves = <Move>[];

  int _sumOfWeights = 0;

  void addMove(Move move, int weight) {
    assert(move != null);
    assert(weight != null);
    assert(weight > 0);

    _moves.add(move);
    _sumOfWeights += weight;
    _cumWeights.add(_sumOfWeights);
  }

  @override
  Move nextMove(Game game, Player player) {
    assert(_sumOfWeights > 0);

    final goal = Random().nextInt(_sumOfWeights) + 1;
    final index = _cumWeights.lastIndexWhere((weight) => weight >= goal);
    return _moves[index];
  }
}
