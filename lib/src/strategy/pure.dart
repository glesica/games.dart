import 'package:games/src/game/state.dart';
import 'package:games/src/strategy/strategy.dart';

/// An implementation of a pure strategy that plays the same move
/// every time.
class Pure<TMove, TState extends State<TMove>> extends Strategy<TMove, TState> {
  final TMove _move;

  Pure(this._move);

  @override
  TMove nextMove(TState state) {
    return _move;
  }
}
