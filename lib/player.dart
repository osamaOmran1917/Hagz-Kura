class Player {
  String name = '';
  int ballControlling = 0,
      passing = 0,
      catching = 0,
      freeShoots = 0,
      shootOnGoal = 0,
      defending = 0,
      fitness = 0,
      planning = 0,
      selfManagement = 0,
      gettingInAbility = 0;

  Player(
      {required this.name,
      required this.ballControlling,
      required this.passing,
      required this.catching,
      required this.freeShoots,
      required this.shootOnGoal,
      required this.defending,
      required this.fitness,
      required this.planning,
      required this.selfManagement,
      required this.gettingInAbility});
}
