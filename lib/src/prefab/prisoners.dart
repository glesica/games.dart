import 'package:games/src/game/state.dart';

/// A prisoner's dilemma "move".
enum PrisonersMove {
  cooperate,
  defect,
}

class PrisonerState extends State<PrisonersMove> {
  final PrisonersMove _player1Move;

  final PrisonersMove _player2Move;

  PrisonerState([this._player1Move, this._player2Move]);

  @override
  State<PrisonersMove> nextState(PrisonersMove move) {
    if (_player1Move == null) {
      return PrisonerState(move);
    }
    if (_player2Move == null) {
      return PrisonerState(_player1Move, move);
    }
    return this;
  }

  @override
  Iterable<num> scores() {
    if (_player1Move == null || _player2Move == null) {
      return [null, null];
    }

    if (_player1Move == PrisonersMove.cooperate &&
        _player2Move == PrisonersMove.cooperate) {
      return [-1, -1];
    }

    if (_player1Move == PrisonersMove.cooperate &&
        _player2Move == PrisonersMove.defect) {
      return [-3, 0];
    }

    if (_player1Move == PrisonersMove.defect &&
        _player2Move == PrisonersMove.cooperate) {
      return [0, -3];
    }

    return [-2, -2];
  }
}
