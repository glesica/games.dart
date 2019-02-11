import 'package:games/src/game/state.dart';

/// An interface that defines a game strategy.
abstract class Strategy<TMove, TState extends State<TMove>> {
  TMove nextMove(TState state);
}
