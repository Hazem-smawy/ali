import 'package:ali_almatary/widgets/about_widgets/about_item.dart';
import 'package:ali_almatary/widgets/home_widgets/go_to_page_square.dart';
import 'package:flutter/material.dart';

class AboutAliScreen extends StatelessWidget {
  const AboutAliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: 3,
        itemBuilder: ((context, index) => AboutItem(
            text: 'قال ابن حبان في كتابه "الثقات" ترجمة أحمد بن صالح المصري')),
      ),
    );
  }
}
