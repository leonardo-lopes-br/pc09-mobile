class GameScoreModel {
  int teamOneScore;
  int teamTwoScore;
  int lastMove;
  int lastPoints;

  GameScoreModel({
    this.teamOneScore = 0,
    this.teamTwoScore = 0,
    this.lastMove = 0,
    this.lastPoints = 0,
  });

  void incrementScore(int team, int points) {
    if (team == 1) {
      teamOneScore += points;
      lastMove = 1;
    } else if (team == 2) {
      teamTwoScore += points;
      lastMove = -1;
    }

    lastPoints = points;
  }

  void revertLastScore() {
    if (lastMove == 1) {
      teamOneScore -= lastPoints;
    } else if (lastMove == -1) {
      teamTwoScore -= lastPoints;
    }

    lastMove = 0;
  }
}
