import 'dart:convert';
import 'package:fantacy_quiz/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
      backgroundColor: const Color(0xFFEDE8E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const Text('Fantasy Quiz',
            style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuizPage())),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF51DEE7),
                      Color(0xFF6BE2E9),
                      Color(0xFFB0EFFB),
                      Color(0xFF93D5F8),
                      Color(0xFF87CDFA),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 100,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_box_rounded),
                    SizedBox(width: 6),
                    Text("Test Ishlash"),
                  ],
                ),
              ),
            ),
            ...List.generate(
              data.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF51DEE7),
                      Color(0xFF6BE2E9),
                      Color(0xFFB0EFFB),
                      Color(0xFF93D5F8),
                      Color(0xFF87CDFA),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ListTile(
                  title: Text(
                      "To'g'ri javoblar soni ${data[index]["correctAnswers"].toString()}"),
                  subtitle: Text(
                      "To'plangan ballar ${data[index]["gainedScore"].toString()}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _getData() async {
    final pref = await SharedPreferences.getInstance();
    final stringList = pref.getStringList("data") ?? [];
    data = stringList.map<Map<String, dynamic>>((e) => json.decode(e)).toList();
    setState(() {});
    print(pref.getString("data"));
  }
}
