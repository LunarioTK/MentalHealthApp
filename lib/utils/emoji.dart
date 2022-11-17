import 'package:flutter/material.dart';

class EmojiFace extends StatelessWidget {
  final String emoji;
  EmojiFace({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[300], borderRadius: BorderRadius.circular(18)),
      padding: const EdgeInsets.fromLTRB(15, 18, 15, 18),
      child: Text(
        emoji,
        style: const TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}
