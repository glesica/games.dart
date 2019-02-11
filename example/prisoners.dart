import 'package:games/games.dart';

void main() {
  final game = Game(PrisonerState())
    ..addPlayer(
      Player.fromStrategy(
        name: 'susan',
        strategy: Pure(PrisonersMove.cooperate),
      ),
    )
    ..addPlayer(
      Player.fromStrategy(
        name: 'frank',
        strategy: Pure(PrisonersMove.defect),
      ),
    )
    ..addReporter(
      ScoresReporter(),
    );
  game.playToCompletion();
}
