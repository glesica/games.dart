import 'package:games/src/strategy/strategy.dart';

/// An implementation of a mixed strategy where each move has a weight
/// that determines its probability of being chosen.
class Mixed<TMove> implements Strategy<TMove> {
  final Set<TMove> _moves = Set<TMove>();

  void addMove(TMove move, int weight) {
    _moves.add(move);
  }

  @override
  TMove nextMove() {
    return null;
  }
}
