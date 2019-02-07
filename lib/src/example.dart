
import 'package:games/src/strategy/mixed.dart';
import 'package:games/src/strategy/pure.dart';

class Prisoners extends Game {}

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
    ..checkpoint()
    ..done();
}
