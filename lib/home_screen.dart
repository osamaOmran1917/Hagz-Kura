import 'package:flutter/material.dart';
import 'package:hagz_kura/insert_names.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: height * .21,
                  right: _isAnimated ? width * .199 : -width * .5,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'الفرقة الواحدة كام لاعب؟',
                    style: TextStyle(
                        fontFamily: 'MyArabicFont',
                        color: Colors.black,
                        fontSize: width * .07),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: GridView.count(
            padding: EdgeInsets.only(
                left: width * .15, right: width * .15, bottom: height * .35),
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => InsertNames(index + 3)));
                },
                child: Material(
                  color: Colors.transparent,
                  child: Card(
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFF27986),
                      child: Text(
                        '${index + 3}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}