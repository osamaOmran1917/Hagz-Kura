import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagz_kura/skills_based_selection.dart';

class InsertPlayers extends StatefulWidget {
  final int playersNum;

  InsertPlayers(this.playersNum);

  @override
  _InsertPlayersState createState() => _InsertPlayersState();
}

class _InsertPlayersState extends State<InsertPlayers> {
  var formKye = GlobalKey<FormState>();
  final List<TextEditingController> controllers = [];
  late List<int> randomNumbers;

  @override
  void initState() {
    super.initState();
    randomNumbers = [];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;

    List<Widget> screen = [];
    for (int i = 0; i < widget.playersNum * 2; i++) {
      controllers.add(TextEditingController());

      screen.add(TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'myarabicfont'),
        controller: controllers[i],
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            return 'املأ الخانة';
          }
          return null;
        },
        decoration: InputDecoration(
          counterStyle: TextStyle(fontFamily: 'myarabicfont'),
          errorStyle: TextStyle(fontFamily: 'myarabicfont'),
          floatingLabelStyle: TextStyle(fontFamily: 'myarabicfont'),
          helperStyle: TextStyle(fontFamily: 'myarabicfont'),
          hintStyle: TextStyle(fontFamily: 'myarabicfont'),
          labelStyle: TextStyle(fontFamily: 'myarabicfont'),
          prefixStyle: TextStyle(fontFamily: 'myarabicfont'),
          suffixStyle: TextStyle(fontFamily: 'myarabicfont'),
          hintText: 'اللاعب رقم ${i + 1}',
        ),
      ));
    }

    screen.add(SizedBox(height: 20));

    screen.add(ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        )),
        backgroundColor: MaterialStateProperty.all(Color(0xFFF27986)),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .003)),
      ),
      onPressed: () {
        showRandomizedDialog(context, formKye, widget.playersNum, controllers);
      },
      child: Text(
        'تقسيم عشوائي',
        style: TextStyle(
            fontFamily: 'MyArabicFont',
            color: Colors.white,
            fontSize: width * .07),
      ),
    ));

    screen.add(SizedBox(height: 20));

    screen.add(ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        )),
        backgroundColor: MaterialStateProperty.all(Color(0xFFF27986)),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .003)),
      ),
      onPressed: () {
        if (formKye.currentState?.validate() == false) {
          return;
        }
        List<String> players = [];
        for (int i = 0; i < widget.playersNum * 2; i++)
          players.add(controllers[i].text);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SkillsBasedSelectionScreen(players)));
      },
      child: Text(
        'تقسيم حسب المهارات',
        style: TextStyle(
            fontFamily: 'MyArabicFont',
            color: Colors.white,
            fontSize: width * .07),
      ),
    ));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'حجز كورة',
          style: TextStyle(
              fontFamily: 'MyArabicFont',
              color: Colors.black,
              fontSize: width * .07),
        ),
      ),
      body: Center(
        child: Form(
          key: formKye,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: screen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showRandomizedDialog(BuildContext context, var formKye, int playersNum,
    List<TextEditingController> controllers) {
  double height = MediaQuery.of(context).size.height,
      width = MediaQuery.of(context).size.width;
  if (formKye.currentState?.validate() == false) {
    return;
  }
  // _generateRandomNumber();
  List<String> data = [];
  String finalList = '';
  for (int i = 0; i < playersNum * 2; i++) {
    data.add(controllers[i].text);
  }
  data.shuffle();
  for (int i = 0; i < playersNum * 2; i++) {
    finalList += data[i];
  }
  print(finalList);
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
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: Color(0xFFF27986),
                    onPressed: () {
                      Navigator.pop(context);
                      showRandomizedDialog(
                          context, formKye, playersNum, controllers);
                    },
                    label: Icon(CupertinoIcons.restart)),
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
  print(data);
}
