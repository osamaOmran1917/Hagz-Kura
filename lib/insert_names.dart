import 'dart:math';

import 'package:flutter/material.dart';

class InsertNames extends StatefulWidget {
  final int playersNum;

  InsertNames(this.playersNum);

  @override
  _InsertNamesState createState() => _InsertNamesState();
}

class _InsertNamesState extends State<InsertNames> {
  var formKye = GlobalKey<FormState>();
  final List<TextEditingController> controllers = [];
  late int _randomNumber;

  @override
  void initState() {
    super.initState();
    _randomNumber = 0;
  }

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(100);
    });
  }

  void _printData() {
    print(widget.playersNum);
    /*if () {
      List<String> data = [];
      data.shuffle();
      print(data);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [];
    for (int i = 0; i < widget.playersNum; i++) {
      controllers.add(TextEditingController());

      screen.add(TextFormField(
        controller: controllers[i],
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            return 'املأ الخانة';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'اللاعب رقم ${i + 1}',
        ),
      ));
    }

    screen.add(ElevatedButton(
      onPressed: () {
        if (formKye.currentState?.validate() == false) {
          return;
        }
        _generateRandomNumber();
      },
      child: Text('Generate Random Number'),
    ));

    screen.add(SizedBox(height: 20));

    screen.add(ElevatedButton(
      onPressed: _printData,
      child: Text('Print Data'),
    ));

    screen.add(Text(
      'Random Number: $_randomNumber',
      style: TextStyle(fontSize: 20),
    ));

    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: screen,
            ),
          ),
        ),
      ),
    );
  }
}
