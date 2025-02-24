import 'package:fantacy_quiz/data/source/question_sources.dart';
import 'package:fantacy_quiz/pages/result_page.dart';
import 'package:fantacy_quiz/widgets/custom_test.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Map<String, dynamic>> data;
  int currentIndex = 0;
  List<int> anwers = [];

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final overallSize = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: const Color(0xFFEDE8E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Fantasy Quiz",
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
                        width: overallSize,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      AnimatedContainer(
                        width: overallSize * ((currentIndex + 1) / data.length),
                        height: 16,
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          color: const Color(0xFF30CD63),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${(currentIndex + 1)}/${data.length}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA9A7A5),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              data[currentIndex]["question"],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF141860),
              ),
            ),
            const SizedBox(height: 70),
            Column(
              children: data[currentIndex]["answers"]
                  .map<Widget>(
                    (element) => CustomTest(
                      testLetter: "A",
                      title: element,
                      onTap: () {
                        if (anwers.length == currentIndex + 1) {
                          anwers[currentIndex] =
                              data[currentIndex]["answers"].indexOf(element);
                        } else {
                          final indexElement =
                              data[currentIndex]["answers"].indexOf(element);
                          anwers.insert(currentIndex, indexElement);
                        }
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (anwers.length == currentIndex + 1) {
                  if (currentIndex == data.length - 1) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(selectedAnswers: anwers)));
                    return;
                  }
                  currentIndex++;
                  setState(() {});
                }
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (anwers.length == currentIndex + 1)
                        ? const Color(0xFF30CD63)
                        : const Color(0xFFB0AEAC)),
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      color: (anwers.length == currentIndex + 1)
                          ? Colors.white
                          : const Color(0xFFE3DFD9),
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initData() {
    data = QuestionSources.data;
  }
}
