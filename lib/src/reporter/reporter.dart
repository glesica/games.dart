import 'package:games/src/game/state.dart';

abstract class Reporter<TMove, TState extends State<TMove>> {
  void report(Iterable<String> players, TState state);
}
