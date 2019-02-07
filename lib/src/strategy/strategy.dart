/// An interface that defines a game strategy.
abstract class Strategy<TMove> {
  TMove nextMove();
}
