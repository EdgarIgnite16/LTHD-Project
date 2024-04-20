import 'package:btap4/models/subject.dart';
import 'package:btap4/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(subject: subject),
        ),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subject.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  subject.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple.shade300,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
