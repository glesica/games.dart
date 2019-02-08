import 'package:games/src/game/game.dart';
import 'package:games/src/strategy/mixed.dart';
import 'package:games/src/strategy/pure.dart';
import 'package:games/src/strategy/strategy.dart';

class Prisoners extends Game {
  @override
  void addPlayer(String name, Strategy strategy) {}

  @override
  void checkpoint() {}

  @override
  void play({int iterations}) {}
}

void main() {
  Prisoners()
    ..addPlayer(
      'bob',
      Mixed()..addMove('cooperate', 1)..addMove('defect', 1),
    )
    ..addPlayer(
      'sam',
      Pure('cooperate'),
    )
    ..addRecorder(
      OutcomeRecorder(),
    )
    ..play(iterations: 100)
    ..checkpoint();
}
