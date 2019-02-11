import 'dart:collection';

import 'package:games/src/game/player.dart';
import 'package:games/src/game/state.dart';

class Game<TMove, TState extends State<TMove>> {
  final Set<Player<TMove, TState>> _players = LinkedHashSet();

  State<TMove> _state;

  Game(this._state);

  TState get state => _state;

  void addPlayer(Player<TMove, TState> player) {
    _players.add(player);
  }

  void addReporter() {}

  void report() {}

  void play({int iterations}) {
    iterations ??= 1;

    for (var i = 0; i < iterations; i++) {
      var updatedState = _state;

      for (final player in _players) {
        final move = player.nextMove(_state);
        if (move == null) {
          continue;
        }

        updatedState = updatedState.nextState(move);
      }

      _state = updatedState;
      report();
    }
  }
}
