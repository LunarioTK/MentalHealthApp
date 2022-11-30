import 'package:flutter/material.dart';

class EmojiFace extends StatelessWidget {
  final String emoji;
  const EmojiFace({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        emoji,
        style: const TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}
