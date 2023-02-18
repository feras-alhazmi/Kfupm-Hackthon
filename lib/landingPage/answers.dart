import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Answer(title: "no thing"),
      itemCount: 4,
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Text(title),
    );
  }
}
