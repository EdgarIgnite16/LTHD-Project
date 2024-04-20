import 'package:btap4/models/listSubject_Example.dart';
import 'package:btap4/models/subject.dart';
import 'package:btap4/widgets/custom_app_bar.dart';
import 'package:btap4/widgets/profile_item.dart';
import 'package:btap4/widgets/show_location_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressedOfSearchButton: () {},
        onPressOfQuestionMarkButton: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ShowLocationHeader(localtion: "Ho Chi Minh City"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                children: [
                  for (Subject item in Example.presidentsList) ProfileItem(subject: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
