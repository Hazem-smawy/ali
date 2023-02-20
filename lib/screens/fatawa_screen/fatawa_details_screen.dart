import 'package:ali_almatary/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatawaDetailsScreen extends StatelessWidget {
  const FatawaDetailsScreen(
      {super.key, required this.title, required this.content});
  final title;
  final content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerRight,
              child: Wrap(
                alignment: WrapAlignment.end,
                verticalDirection: VerticalDirection.up,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: MyColors.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(
                      FontAwesomeIcons.share,
                      color: MyColors.lightGreen,
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: MyColors.bg, borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(15),
              child: Container(
                  child: Html(
                data: content,
                style: {
                  'p': Style(
                    lineHeight: LineHeight.number(1.4),
                    whiteSpace: WhiteSpace.PRE,
                    direction: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    color: MyColors.paragraph,
                  )
                },
              )),
            )
          ]),
        ),
      ),
    );
  }
}
