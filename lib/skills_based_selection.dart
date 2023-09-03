import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagz_kura/player.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Parse the input value as an integer
    int value = int.tryParse(newValue.text) ?? 0;

    // Restrict the value to the range of min to max
    if (value < min) {
      value = min;
    } else if (value > max) {
      value = max;
    }

    // Return the formatted value
    return TextEditingValue(
      text: value.toString(),
      selection: TextSelection.fromPosition(
          TextPosition(offset: value.toString().length)),
    );
  }
}

class SkillsBasedSelectionScreen extends StatefulWidget {
  List playersNames;
  SkillsBasedSelectionScreen(this.playersNames);

  @override
  State<SkillsBasedSelectionScreen> createState() =>
      _SkillsBasedSelectionScreenState();
}

class _SkillsBasedSelectionScreenState
    extends State<SkillsBasedSelectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addPlayers(widget.playersNames.length);
    addControllers(widget.playersNames.length);
    print(widget.playersNames);
    print(players[5].name);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFF27986),
                borderRadius: BorderRadius.circular(width)),
            padding: EdgeInsets.symmetric(
                horizontal: width * .05, vertical: height * .005),
            child: Text(
              widget.playersNames[player],
              style: TextStyle(fontFamily: 'myarabicfont'),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * .05, right: width * .05, bottom: height * .01),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: ballControllingControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'التحكم بالكرة',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: passingControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'التمرير',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: catchingControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'الاستلام',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: freeShootsControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'الركلات الحرة',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: shootOnGoalControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'التسديد على المرمى',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: defendingControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'الدفاع',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: fitnessControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'اللياقة البدنية',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: planningControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'التكتيك',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: selfManagementControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'الإدارة الذاتية',
                ),
              ),
              SizedBox(height: height * .03,),
              TextField(
                controller: gettingInAbilityControllers[player],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RangeTextInputFormatter(min: 0, max: 10),
                  // Restrict the input to the range 0-10
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'myarabicfont'),
                decoration: InputDecoration(
                  counterStyle: TextStyle(fontFamily: 'myarabicfont'),
                  errorStyle: TextStyle(fontFamily: 'myarabicfont'),
                  floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  helperStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintStyle: TextStyle(fontFamily: 'myarabicfont'),
                  labelStyle: TextStyle(fontFamily: 'myarabicfont'),
                  prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
                  hintText: 'القدرة على الاندماج في الفريق',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: height * .015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  players[player].totalScore =
                     (ballControllingControllers[player].text.isNotEmpty? int.parse(ballControllingControllers[player].text): 0) +
                     (passingControllers[player].text.isNotEmpty? int.parse(passingControllers[player].text): 0) +
                     (catchingControllers[player].text.isNotEmpty? int.parse(catchingControllers[player].text): 0) +
                     (freeShootsControllers[player].text.isNotEmpty? int.parse(freeShootsControllers[player].text): 0) +
                     (shootOnGoalControllers[player].text.isNotEmpty? int.parse(shootOnGoalControllers[player].text): 0) +
                     (defendingControllers[player].text.isNotEmpty? int.parse(defendingControllers[player].text): 0) +
                     (fitnessControllers[player].text.isNotEmpty? int.parse(fitnessControllers[player].text): 0) +
                     (planningControllers[player].text.isNotEmpty? int.parse(planningControllers[player].text): 0) +
                     (selfManagementControllers[player].text.isNotEmpty? int.parse(selfManagementControllers[player].text): 0) +
                     (gettingInAbilityControllers[player].text.isNotEmpty? int.parse(gettingInAbilityControllers[player].text): 0);
                  log(players[player].totalScore.toString());
                  players[player].name = widget.playersNames[player];
                  log(players[player].name);
                  if(player < (widget.playersNames.length - 1)) {
                    player++;
                  } else {
                    List<int> playersScores = [];
                    for(int i = 0; i < widget.playersNames.length; i++) {
                      playersScores.add(players[i].totalScore);
                    }
                    playersScores.sort();
                    List<int> group1 = [];
                    List<String> groupI = [];
                    List<int> group2 = [];
                    List<String> groupII = [];
                    for (int i = 0; i < playersScores.length; i++) {
                      if (i % 2 == 0) {
                        group1.add(playersScores[i]);
                      } else {
                        group2.add(playersScores[i]);
                      }
                    }
                    showDialog(
                        context: context,
                        builder: (_) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            width: width * .7,
                            height: height * .7,
                            child: Scaffold(
                              body: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Text('الفريق الأول',
                                          style: TextStyle(
                                              fontFamily: 'MyArabicFont',
                                              color: Color(0xFFF27986),
                                              fontSize: width * .07,
                                              fontWeight: FontWeight.bold)),
                                      for (int i = 0; i < playersScores.length / 2; i++)
                                        Text(group1[i].toString(),
                                            style: TextStyle(
                                                fontFamily: 'MyArabicFont',
                                                color: Colors.black,
                                                fontSize: width * .07)),
                                      Text('الفريق الثاني',
                                          style: TextStyle(
                                              fontFamily: 'MyArabicFont',
                                              color: Color(0xFFF27986),
                                              fontSize: width * .07,
                                              fontWeight: FontWeight.bold)),
                                      for (int i = 0; i < playersScores.length / 2; i++)
                                        Text(group2[i].toString(),
                                            style: TextStyle(
                                                fontFamily: 'MyArabicFont',
                                                color: Colors.black,
                                                fontSize: width * .07))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ));
                    print(widget.playersNames);
                  }
                  log(player.toString());
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .007),
                decoration: BoxDecoration(
                  color: Color(0xFFF27986),
                  borderRadius: BorderRadius.circular(width * .061)
                ),
                child: player < (players.length - 1)? Text('التالي', style: TextStyle(fontFamily: 'myarabicfont', color: Colors.white, fontSize: width * .07),): Icon(CupertinoIcons.check_mark, color: Colors.white,),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  player == 0? Navigator.pop(context): player--;
                  log(player.toString());
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .007),
                decoration: BoxDecoration(
                  color: Color(0xFFF27986),
                  borderRadius: BorderRadius.circular(width * .061)
                ),
                child: player > 0? Text('السابق', style: TextStyle(fontFamily: 'myarabicfont', color: Colors.white, fontSize: width * .07),): Icon(CupertinoIcons.arrow_right, color: Colors.white, size: width * .07,),
              ),
            )
          ],
        ),
      ),
    );
  }
  int player = 0;
  List<Player> players = [];
  List<TextEditingController> ballControllingControllers = [];
  List<TextEditingController> passingControllers = [];
  List<TextEditingController> catchingControllers = [];
  List<TextEditingController> freeShootsControllers = [];
  List<TextEditingController> shootOnGoalControllers = [];
  List<TextEditingController> defendingControllers = [];
  List<TextEditingController> fitnessControllers = [];
  List<TextEditingController> planningControllers = [];
  List<TextEditingController> selfManagementControllers = [];
  List<TextEditingController> gettingInAbilityControllers = [];
  void addPlayers(int playersNum) {
    for (int i = 0; i < playersNum; i++) {
      players.add(Player(
          name: 'name',
          ballControlling: 0,
          passing: 0,
          catching: 0,
          freeShoots: 0,
          shootOnGoal: 0,
          defending: 0,
          fitness: 0,
          planning: 0,
          selfManagement: 0,
          gettingInAbility: 0,
          totalScore: 0));
    }
  }
  void addControllers(int playersNum) {
    for(int i = 0; i < playersNum; i++) {
      ballControllingControllers.add(TextEditingController());
      passingControllers.add(TextEditingController());
      catchingControllers.add(TextEditingController());
      freeShootsControllers.add(TextEditingController());
      shootOnGoalControllers.add(TextEditingController());
      defendingControllers.add(TextEditingController());
      fitnessControllers.add(TextEditingController());
      planningControllers.add(TextEditingController());
      selfManagementControllers.add(TextEditingController());
      gettingInAbilityControllers.add(TextEditingController());
    }
  }
}