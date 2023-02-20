import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';

class DwonloadedEmpty extends StatelessWidget {
  const DwonloadedEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.question_mark,
            size: 70,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "لا يوجد اي ملف الان محمل في جهازك",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            splashColor: MyColors.lightGreen,
            borderRadius: BorderRadius.circular(15),
            onTap: (() {}),
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.darkBlue.withOpacity(0.7),
              ),
              child: const Text(
                ' حمل بعض الملفات ',
                style: TextStyle(
                  fontSize: 16,
                  color: MyColors.bg,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
