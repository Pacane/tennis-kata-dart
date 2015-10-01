import 'package:test/test.dart';
import 'package:tennis_kata/tennis_kata.dart';

main() {
  group("deuce and under", () {
    TennisGame sut;

    setUp(() {
      sut = new TennisGame();
    });

    final testData = [
      {
        #description: 'love all',
        #numberOfPointsPlayer1: 0,
        #numberOfPointsPlayer2: 0,
        #expected: 'love all'
      },
      {
        #description: '15-0',
        #numberOfPointsPlayer1: 1,
        #numberOfPointsPlayer2: 0,
        #expected: '15 love'
      },
      {
        #description: '30-0',
        #numberOfPointsPlayer1: 2,
        #numberOfPointsPlayer2: 0,
        #expected: '30 love'
      },
      {
        #description: '40-0',
        #numberOfPointsPlayer1: 3,
        #numberOfPointsPlayer2: 0,
        #expected: '40 love'
      },
      {
        #description: '0-15',
        #numberOfPointsPlayer1: 0,
        #numberOfPointsPlayer2: 1,
        #expected: 'love 15'
      },
      {
        #description: '0-30',
        #numberOfPointsPlayer1: 0,
        #numberOfPointsPlayer2: 2,
        #expected: 'love 30'
      },
      {
        #description: '0-40',
        #numberOfPointsPlayer1: 0,
        #numberOfPointsPlayer2: 3,
        #expected: 'love 40'
      },
      {
        #description: 'game player 1, #1',
        #numberOfPointsPlayer1: 4,
        #numberOfPointsPlayer2: 0,
        #expected: 'game player 1'
      },
      {
        #description: 'game player 1, #2',
        #numberOfPointsPlayer1: 4,
        #numberOfPointsPlayer2: 1,
        #expected: 'game player 1'
      },
      {
        #description: 'game player 1, #3',
        #numberOfPointsPlayer1: 4,
        #numberOfPointsPlayer2: 2,
        #expected: 'game player 1'
      },
      {
        #description: 'game player 2, #1',
        #numberOfPointsPlayer1: 0,
        #numberOfPointsPlayer2: 4,
        #expected: 'game player 2'
      },
      {
        #description: 'game player 2, #2',
        #numberOfPointsPlayer1: 1,
        #numberOfPointsPlayer2: 4,
        #expected: 'game player 2'
      },
      {
        #description: 'game player 2, #3',
        #numberOfPointsPlayer1: 2,
        #numberOfPointsPlayer2: 4,
        #expected: 'game player 2'
      },
    ];

    scoreAmountOfPointsForPlayer(Player player, int numberOfPointsForPlayer) {
      for (int i = 0; i < numberOfPointsForPlayer; ++i) {
        sut.addScore(player);
      }
    }

    testData.forEach((d) {
      test(d[#description], () {
        scoreAmountOfPointsForPlayer(Player.ONE, d[#numberOfPointsPlayer1]);
        scoreAmountOfPointsForPlayer(Player.TWO, d[#numberOfPointsPlayer2]);

        expect(sut.score, d[#expected]);
      });
    });
  });

  group("advantage", () {
    TennisGame sut;

    setUp(() {
      sut = new TennisGame();

      for (int i = 0; i < 4; ++i) sut.addScore(Player.ONE);

      for (int i = 0; i < 4; ++i) sut.addScore(Player.TWO);
    });

    test("adv player 1", () {
      sut.addScore(Player.ONE);

      expect(sut.score, 'advantage player 1');
    });

    test("adv player 2", () {
      sut.addScore(Player.TWO);

      expect(sut.score, 'advantage player 2');
    });

    test("going back to deuce", () {
      sut.addScore(Player.ONE);
      sut.addScore(Player.TWO);

      expect(sut.score, 'deuce');
    });

    test("going back to deuce 2", () {
      sut.addScore(Player.TWO);
      sut.addScore(Player.ONE);

      expect(sut.score, 'deuce');
    });

    test("game player 1", () {
      sut.addScore(Player.ONE);
      sut.addScore(Player.ONE);

      expect(sut.score, 'game player 1');
    });

    test("game player 2", () {
      sut.addScore(Player.TWO);
      sut.addScore(Player.TWO);

      expect(sut.score, 'game player 2');
    });
  });
}
