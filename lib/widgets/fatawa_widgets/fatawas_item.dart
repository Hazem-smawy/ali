import 'package:ali_almatary/screens/fatawa_screen/fatawa_details_screen.dart';
import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatawaItem extends StatelessWidget {
  const FatawaItem({super.key, required this.title, required this.content});
  final String title;
  final content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => FatawaDetailsScreen()));
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          color: MyColors.bg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: AlignmentDirectional.topEnd,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.fileLines,
                          size: 40,
                          color: MyColors.darkBlue.withOpacity(0.7),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 80, left: 10, right: 15, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FatawaDetailsScreen(
                                title: title,
                                content: content,
                              )));
                    },
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: MyColors.darkBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cairo',
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  right: -15,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.containerBg,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FatawaDetailsScreen(
                                title: title,
                                content: content,
                              )));
                    },
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
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' مشاهده',
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
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: MyColors.darkBlue.withOpacity(0.7), width: 2),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
