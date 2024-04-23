import 'package:flutter/material.dart';

class MySearchField extends StatefulWidget {
  final onSearchChanged;

  const MySearchField({
    super.key,
    required this.onSearchChanged,
  });

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Search',
          contentPadding: EdgeInsets.only(left: 20),
          border: InputBorder.none,
        ),
        onChanged: widget.onSearchChanged,
      ),
    );
  }
}
