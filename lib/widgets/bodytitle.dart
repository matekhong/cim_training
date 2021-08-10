import 'package:flutter/material.dart';

class BodyTitle extends StatelessWidget {
  final String bodyTitle;

  const BodyTitle({
    Key? key,
    required this.bodyTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(bodyTitle,
        style: TextStyle(
            color: Colors.brown,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            letterSpacing: 5));
  }
}
