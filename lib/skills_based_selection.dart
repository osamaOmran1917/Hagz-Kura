import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagz_kura/player.dart';

class SkillsBasedSelectionScreen extends StatefulWidget {
  List<String> playersNames;

  SkillsBasedSelectionScreen(this.playersNames);

  @override
  State<SkillsBasedSelectionScreen> createState() =>
      _SkillsBasedSelectionScreenState();
}

class _SkillsBasedSelectionScreenState
    extends State<SkillsBasedSelectionScreen> {
  int selectedIndex = 0;
  var formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
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
    List<List<int>> playersScorse = [];
    List<int> sums = [];
    for (int i = 0; i < widget.playersNames.length; i++) {
      players.add(Player(
          name: widget.playersNames[i],
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
      if (formKye.currentState?.validate() != false) {
        List<int> total = [
          int.parse(ballControllingControllers[i].text),
          int.parse(passingControllers[i].text),
          int.parse(catchingControllers[i].text),
          int.parse(freeShootsControllers[i].text),
          int.parse(shootOnGoalControllers[i].text),
          int.parse(defendingControllers[i].text),
          int.parse(fitnessControllers[i].text),
          int.parse(planningControllers[i].text),
          int.parse(selfManagementControllers[i].text),
          int.parse(gettingInAbilityControllers[i].text)
        ];
        playersScorse.add(total);
        int sum = 0;
        for (int i = 0; i < 9; i++) {
          sum += total[i];
        }
        players[i].totalScore = sum;
      }
    }
    return Scaffold(
      body: Form(
        key: formKye,
        child: Column(
          children: [
            SizedBox(
              height: height * .07,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF27986),
                  borderRadius: BorderRadius.circular(width * .5)),
              padding: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .01),
              child: Text(
                widget.playersNames[selectedIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'MyArabicFont',
                    fontSize: width * .07,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width * .05),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ballControllingControllers[selectedIndex],
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'بيان مطلوب';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'التحكم بالكرة',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: passingControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'التمرير',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: catchingControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'الاستلام',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: freeShootsControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'الركلات الحرة',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: shootOnGoalControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'التسديد على المرمى',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: defendingControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'الدفاع',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: fitnessControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'اللياقة البدنية',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: planningControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'التكتيك',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: selfManagementControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'الإدارة الذاتية',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: gettingInAbilityControllers[selectedIndex],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RangeTextInputFormatter(min: 0, max: 10),
                          // Restrict the input to the range 0-10
                        ],
                        decoration: InputDecoration(
                          hintText: 'اختر رقم من 0 إلى 10',
                          hintStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05),
                          labelText: 'القدرة على الاندماج في الفريق',
                          labelStyle: TextStyle(
                              fontFamily: 'MyArabicFont',
                              fontSize: width * .05,
                              color: Color(0xFFF27986)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFF27986)), // Set the border color when the field is focused
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF27986)),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: width * .045, vertical: height * .003)),
                    ),
                    onPressed: () {
                      if (formKye.currentState?.validate() == false) {
                        return;
                      } else {
                        if (selectedIndex < players.length - 1) {
                          setState(() {});
                          int sum = 0;
                          for (int i = 0; i < 9; i++) {
                            sums.add(sum += playersScorse[selectedIndex][i]);
                          }
                          setState(() {
                            selectedIndex++;
                          });
                        } else
                          showPlayersDialog(context, sums, players);
                        print(selectedIndex);
                        print(players.length);
                      }
                    },
                    child: selectedIndex == players.length - 1
                        ? Icon(CupertinoIcons.check_mark)
                        : Text(
                            'التالي',
                            style: TextStyle(
                                fontFamily: 'MyArabicFont',
                                fontSize: width * .07),
                          )),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF27986)),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: width * .045, vertical: height * .003)),
                    ),
                    onPressed: () {
                      if (selectedIndex > 0) {
                        setState(() {
                          selectedIndex--;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: selectedIndex > 0
                        ? Text('السابق',
                            style: TextStyle(
                                fontFamily: 'MyArabicFont',
                                fontSize: width * .07))
                        : Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: height * .03,
            )
          ],
        ),
      ),
    );
  }

  void showPlayersDialog(
      BuildContext context, List<int> sums, List<Player> players) {
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    players.sort((a, b) => a.totalScore.compareTo(b.totalScore));
    List<Player> firstTeam = [];
    /*for (int i = 0; i < players.length / 2; i ++)
      firstTeam.add(value)*/
    // print(players[0].name);
    /*showDialog(
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
                      for (int i = 0; i < playersNum; i++)
                        Text(data[i],
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
                      for (int i = playersNum; i < playersNum * 2; i++)
                        Text(data[i],
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
    print(data);*/
  }
}

void showSkillDialog(BuildContext context, List<Player> players,
    int selectedIndex, String skill) {
  double height = MediaQuery.of(context).size.height,
      width = MediaQuery.of(context).size.width;
  showDialog(
      context: context,
      builder: (_) => Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              width: width * .7,
              height: height * .45,
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            left: width * .041,
                            right: width * .041,
                            top: height * .03),
                        crossAxisCount: 3,
                        children: List.generate(9, (index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              if (skill == 'ballControlling')
                                players[selectedIndex].ballControlling = index;
                              else if (skill == 'passing')
                                players[selectedIndex].passing = index;
                              else if (skill == 'catching')
                                players[selectedIndex].catching = index;
                              else if (skill == 'freeShoots')
                                players[selectedIndex].freeShoots = index;
                              else if (skill == 'shootOnGoal')
                                players[selectedIndex].shootOnGoal = index;
                              else if (skill == 'defending')
                                players[selectedIndex].defending = index;
                              else if (skill == 'fitness')
                                players[selectedIndex].fitness = index;
                              else if (skill == 'planning')
                                players[selectedIndex].planning = index;
                              else if (skill == 'selfManagement')
                                players[selectedIndex].selfManagement = index;
                              else if (skill == 'gettingInAbility')
                                players[selectedIndex].gettingInAbility = index;
                              Navigator.pop(context, index);
                              // Navigator.popUntil(context, ModalRoute.withName('/my_screen'));
                            },
                            child: Material(
                              color: Colors.transparent,
                              child: Card(
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFF27986),
                                  child: Text(
                                    '${index}',
                                    style: TextStyle(
                                      fontFamily: 'MyArabicFont',
                                      color: Colors.white,
                                      fontSize: width * .07,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )),
                      InkWell(
                        onTap: () {
                          if (skill == 'ballControlling')
                            players[selectedIndex].ballControlling = 10;
                          else if (skill == 'passing')
                            players[selectedIndex].passing = 10;
                          else if (skill == 'catching')
                            players[selectedIndex].catching = 10;
                          else if (skill == 'freeShoots')
                            players[selectedIndex].freeShoots = 10;
                          else if (skill == 'shootOnGoal')
                            players[selectedIndex].shootOnGoal = 10;
                          else if (skill == 'defending')
                            players[selectedIndex].defending = 10;
                          else if (skill == 'fitness')
                            players[selectedIndex].fitness = 10;
                          else if (skill == 'planning')
                            players[selectedIndex].planning = 10;
                          else if (skill == 'selfManagement')
                            players[selectedIndex].selfManagement = 10;
                          else if (skill == 'gettingInAbility')
                            players[selectedIndex].gettingInAbility = 10;
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF27986),
                          radius: width * .09,
                          child: Text(
                            '10',
                            style: TextStyle(
                                fontSize: width * .07,
                                fontFamily: 'MyArabicFont',
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .047,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}

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
