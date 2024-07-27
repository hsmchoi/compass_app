import 'package:compass_app/models/interest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExcitingDetailScreen extends StatelessWidget {
  final Interest interest;

  const ExcitingDetailScreen({super.key, required this.interest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(interest.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              interest.icon,
              size: 80,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                interest.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
            .animate()
            .fade(duration: 300.ms)
            .slideY(begin: 1, duration: 300.ms, curve: Curves.easeOut),
      ),
    );
  }
}
