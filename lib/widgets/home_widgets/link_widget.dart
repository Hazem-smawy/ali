import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkWidget extends StatelessWidget {
  final title;
  Function goToPage;
  final IconData icon;
  LinkWidget(
      {super.key, this.title, required this.icon, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.red,
      hoverColor: Colors.black,
      highlightColor: Colors.green,
      onTap: () {
        goToPage();
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyColors.bg,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              color: MyColors.textPrimary,
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.containerBg,
              ),
              child: FaIcon(
                icon,
                color: MyColors.darkBlue,
                size: 17,
              )),
        ]),
      ),
    );
  }
}
