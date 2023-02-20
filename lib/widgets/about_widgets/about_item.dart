import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutItem extends StatelessWidget {
  final String text;
  const AboutItem({super.key, required this.text});
  //color: Color.fromRGBO(145, 135, 82, 1),
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: MyColors.bg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 15, bottom: 30),
            child: Text(
              text,
              style: TextStyle(
                color: MyColors.darkBlue,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontFamily: 'Cairo',
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Positioned(
            bottom: -15,
            right: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.containerBg,
              ),
            ),
          ),
          Positioned(
            top: -15,
            right: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.containerBg,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyColors.lightGreen,
                      width: 1,
                    )
                    //color: Color.fromRGBO(16, 19, 28, 1),
                    ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                    FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: MyColors.lightGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'عرض المزيد',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: MyColors.lightGreen,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 0,
            bottom: 15,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: 4,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.bg, width: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
