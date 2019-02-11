import 'package:games/src/game/state.dart';
import 'package:games/src/strategy/strategy.dart';
import 'package:meta/meta.dart';

class Player<TMove, TState extends State<TMove>> {
  final String name;

  final NextMove<TMove, TState> _nextMove;

  Player({
    @required this.name,
    @required NextMove<TMove, TState> nextMove,
  })  : assert(name != null),
        assert(nextMove != null),
        _nextMove = nextMove;

  Player.fromStrategy({
    @required this.name,
    @required Strategy<TMove, TState> strategy,
  })  : assert(name != null),
        assert(strategy != null),
        _nextMove = nextMoveFromStrategy(strategy);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(other) => other is Player<TMove, TState> && name == other.name;

  TMove nextMove(TState state) => _nextMove(state);
}

typedef TMove NextMove<TMove, TState extends State<TMove>>(TState state);

NextMove<TMove, TState> nextMoveFromStrategy<TMove, TState extends State<TMove>>(
    Strategy<TMove, TState> strategy) {
  return (TState state) => strategy.nextMove(state);
}
