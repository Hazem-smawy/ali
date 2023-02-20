import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 16 19 28 1
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  final Color primaryColor = const Color.fromRGBO(16, 19, 28, 1);
  final Color secondaryColor = MyColors.bg;
  final Color placeHolderColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'الموقع الرسمي لفضيلة الشيخ ابي الحسن علي بن محمد بن عبده المطري ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  hintText: 'الاسم الكامل'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        FaIcon(
                          FontAwesomeIcons.user,
                          color: primaryColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                ),
                // email

                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: TextFormField(
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  hintText: 'example@gmail.com'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        FaIcon(
                          FontAwesomeIcons.envelope,
                          color: primaryColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                ),
                // number
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  hintText: 'رقم الهاتف'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        FaIcon(
                          FontAwesomeIcons.phone,
                          color: primaryColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),

                //message box

                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              ': الرساله',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            FaIcon(
                              FontAwesomeIcons.message,
                              color: primaryColor,
                              size: 20,
                            ),
                          ],
                        ),
                        const Divider(),
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          minLines: 3,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),

                // vervication number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.darkBlue.withOpacity(0.5),
                      ),
                      child: const Text(
                        '124233',
                        style: TextStyle(
                          color: MyColors.bg,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: secondaryColor,
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: ' كود التحقق   ',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // send button
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColors.darkBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.message,
                          color: MyColors.bg,
                          size: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'ارســــــال',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
