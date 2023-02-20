import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.reFreshPage});
  final Function() reFreshPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Spacer(),
          const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'تأكد من انك متصل بالانترنت',
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
            onTap: reFreshPage,
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(152, 251, 237, 112),
              ),
              child: const Text(
                'تحديث الصفحة ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
