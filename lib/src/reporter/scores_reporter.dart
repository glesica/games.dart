import 'package:games/src/game/state.dart';
import 'package:games/src/reporter/reporter.dart';

class ScoresReporter<TMove, TState extends State<TMove>>
    extends Reporter<TMove, TState> {
  @override
  void report(Iterable<String> players, State state) {
    Map.fromIterables(players, state.scores).forEach((name, score) {
      print('$name:\t$score');
    });
  }
}
