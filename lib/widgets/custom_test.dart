import 'package:fantacy_quiz/pages/result_page.dart';
import 'package:flutter/material.dart';

class CustomTest extends StatelessWidget {
  final String testLetter;
  final String title;
  final bool percentageColor;
  final Function() onTap;

  const CustomTest({
    super.key,
    required this.testLetter,
    required this.title,
    this.percentageColor = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        width: double.infinity,
        height: 66,
        decoration: BoxDecoration(
          color: percentageColor ? const Color(0xFF23D064) : const Color(0xFFF4F3F6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFEDE8E2),
              child: Text(
                testLetter,
                style: const TextStyle(
                    color: Color(0xFF0A0B10),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF0A0B10),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
