import 'dart:collection';

import 'package:games/src/game/player.dart';
import 'package:games/src/game/state.dart';
import 'package:games/src/reporter/reporter.dart';

class Game<TMove, TState extends State<TMove>> {
  Game(this._state);

  final Set<Player<TMove, TState>> _players = LinkedHashSet();

  List<Reporter<TMove, TState>> _reporters = [];

  State<TMove> _state;

  void addPlayer(Player<TMove, TState> player) {
    _players.add(player);
  }

  void addReporter(Reporter<TMove, TState> reporter) {
    _reporters.add(reporter);
  }

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

  void report() {
    final players = _players.map((p) => p.name);
    for (final reporter in _reporters) {
      reporter.report(players, _state);
    }
  }
}
