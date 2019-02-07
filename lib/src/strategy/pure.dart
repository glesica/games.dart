import 'package:games/src/strategy/strategy.dart';

/// An implementation of a pure strategy that plays the same move
/// every time.
class Pure<TMove> extends Strategy<TMove> {
  final TMove _move;

  Pure(this._move);

  @override
  TMove nextMove() {
    return _move;
  }
}
