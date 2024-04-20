import 'package:flutter/material.dart';

class ShowLocationHeader extends StatelessWidget {
  const ShowLocationHeader({
    super.key,
    required this.localtion,
  });

  final String localtion;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: Colors.purple,
      child: Center(
        child: Text(
          "Your localtion: $localtion",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
