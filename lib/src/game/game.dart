import 'package:games/src/game/state.dart';
import 'package:games/src/strategy/strategy.dart';

class Game<TMove, TState extends State<TMove>> {
  final Map<String, Strategy<TState>> _players = {};

  State<TMove> _state;

  Game(this._state);

  TState get state => _state;

  void addPlayer(String name, Strategy<TState> strategy) {
    _players[name] = strategy;
  }

  void checkpoint() {}

  void play({int iterations}) {
    iterations ??= 1;

    final nextState = _state.nextState(move)
  }
}
