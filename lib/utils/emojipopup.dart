import 'package:flutter/material.dart';

class PopUpEmoji extends StatelessWidget {
  final String emoji;

  const PopUpEmoji({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(80),
      backgroundColor: Colors.blue[300],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(
              fontSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}
