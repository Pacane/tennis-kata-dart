enum Player { ONE, TWO }

class TennisGame {
  Map<Player, int> scores = {Player.ONE: 0, Player.TWO: 0};
  Map<int, String> scoreText = {0: 'love', 1: '15', 2: '30', 3: '40'};

  String get score {
    int score1 = scores[Player.ONE];
    int score2 = scores[Player.TWO];

    if (score1 == score2) {
      if (score1 == 3) {
        return "deuce";
      }

      if (score1 < 3) {
        return "${scoreText[score1]} all";
      }
    } else if (score1 < 4 && score2 < 4) {
      return score1 != 0 && score2 != 0
          ? "${scoreText[score1]}-${scoreText[score2]}"
          : "${scoreText[score1]} ${scoreText[score2]}";
    } else if (score1 == 4 && score2 < 3) {
      return "game player 1";
    } else if (score2 == 4 && score1 < 3) {
      return "game player 2";
    } else if (score1 == 4 && score2 == 3) {
      return "advantage player 1";
    } else if (score2 == 4 && score1 == 3) {
      return "advantage player 2";
    } else if (score1 == 5) {
      return 'game player 1';
    } else if (score2 == 5) {
      return 'game player 2';
    }
  }

  void addScore(Player player) {
    int score1 = scores[Player.ONE];
    int score2 = scores[Player.TWO];

    if (player == Player.TWO && score1 == 4 && score2 == 3) {
      scores[Player.ONE]--;
    } else if (player == Player.ONE && score2 == 4 && score1 == 3) {
      scores[Player.TWO]--;
    } else {
      scores[player]++;
    }
  }
}
