import 'package:fantacy_quiz/pages/result_page.dart';
import 'package:fantacy_quiz/widgets/custom_test.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE8E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Fantasy Quiz #156",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF151514)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        width: 125,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFF30CD63),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "2/5",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA9A7A5),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "PREDICT THE TOP LOSER (for tomorrow) across these indices",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF141860),
              ),
            ),
            const SizedBox(height: 70),
            const CustomTest(
              testLetter: "A",
              title: "NIFTY50",
              price: "\$ 17,356,",
              percentage: "-0.31%",
            ),
            const SizedBox(height: 30),
            const CustomTest(
              testLetter: "B",
              title: "NIFTYNEXT50",
              price: "\$ 56,226,",
              percentage: "-0.31%",
            ),
            const SizedBox(height: 30),
            const CustomTest(
              testLetter: "C",
              title: "NIFTYBank",
              price: "\$ 17,356,",
              percentage: "+2.12%",
              percentageColor: true,
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ResultPage())),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFB0AEAC)),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(color: Color(0xFFE3DFD9), fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
