/// An interface that describes a game state that can, given a
/// valid move, produce the state that results from application
/// of that move to itself.
abstract class State<TMove> {
  State<TMove> nextState(TMove move);

  Iterable<num> scores();
}
