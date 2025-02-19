import 'package:fantacy_quiz/pages/result_page.dart';
import 'package:flutter/material.dart';

class CustomTest extends StatelessWidget {
  final String testLetter;
  final String title;
  final String price;
  final String percentage;
  final bool percentageColor;

  const CustomTest({
    super.key,
    required this.testLetter,
    required this.title,
    required this.price,
    required this.percentage,
    this.percentageColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ResultPage())),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        width: double.infinity,
        height: 66,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F3F6),
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
            const SizedBox(width: 20),
            Text(
              price,
              style: const TextStyle(
                color: Color(0xFF33343B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              percentage,
              style: TextStyle(
                color: percentageColor ?const Color(0xFF2EBF77) : const Color(0xFFA00215),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
