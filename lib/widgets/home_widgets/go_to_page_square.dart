import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoveToPageSquareShape extends StatelessWidget {
  final String goTo;
  final IconData icon;
  final Function gotToPage;
  MoveToPageSquareShape(
      {super.key,
      required this.goTo,
      required this.icon,
      required this.gotToPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              gotToPage();
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: 150,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                // 16 19 28 1
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Color.fromRGBO(145, 135, 82, 1),

                  // color: Color.fromRGBO(16, 19, 28, 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(
                        icon,
                        color: Color.fromRGBO(16, 19, 28, 1),
                        //color: Color.fromRGBO(145, 135, 82, 1),
                        size: 30,
                      ),
                      Text(
                        goTo,
                        style: TextStyle(
                          color: Color.fromRGBO(16, 19, 28, 1),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
