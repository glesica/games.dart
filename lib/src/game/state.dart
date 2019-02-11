/// An interface that describes a game state that can, given a
/// valid move, produce the state that results from application
/// of that move to itself.
abstract class State<TMove> {
  bool get hasCompleted;

  bool get hasStarted;

  Iterable<num> get scores;

  State<TMove> nextState(TMove move);
}
