const gameLevels = <GameLevel>[
  (
    number: 1,
    winScore: 5,
    canSpawnTall: false,
  ),
  (
    number: 2,
    winScore: 10,
    canSpawnTall: true,
  ),
];

typedef GameLevel = ({
  int number,
  int winScore,
  bool canSpawnTall,
});
