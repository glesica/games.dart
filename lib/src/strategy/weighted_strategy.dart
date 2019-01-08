import 'dart:math';

import 'package:games/src/game.dart';
import 'package:games/src/move.dart';
import 'package:games/src/player.dart';
import 'package:games/src/strategy/strategy.dart';

class WeightedStrategy implements Strategy {
  WeightedStrategy(Move move, int weight) {
    add(move, weight);
  }

  List<Move> _moves = <Move>[];

  int _sumOfWeights = 0;

  List<int> _weights = <int>[];

  void add(Move move, int weight) {
    assert(move != null);
    assert(weight != null);
    assert(weight > 0);

    _moves.add(move);
    _weights.add(weight);

    _sumOfWeights += weight;
  }

  int indexForGoal(int goal) {
    var current = goal;
    var index = 0;
    while (current > 0) {
      current -= _weights[index];
      index += 1;
    }
    return index - 1;
  }

  @override
  Move nextMove(Game game, Player player) {
    final goal = randomGoal();
    final index = indexForGoal(goal);
    return _moves[index];
  }

  /// Goal weight sum, which represents the outcome of our random dice
  /// roll, essentially, given that the dice are weighted.
  int randomGoal() => Random().nextInt(_sumOfWeights) + 1;
}
