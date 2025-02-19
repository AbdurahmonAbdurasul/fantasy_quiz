import 'package:flutter/material.dart';

class CustomResultContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String number;

  const CustomResultContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: const Color(0xFFEDE8E2),
                  child: Icon(
                    icon,
                    color: const Color(0xFF23D064),
                  )),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF0A0B10),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            number,
            style: const TextStyle(
              color: Color(0xFF33343B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
