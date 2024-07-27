import 'package:compass_app/models/interest.dart';
import 'package:compass_app/providers/interest_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PassionateScreen extends ConsumerStatefulWidget {
  const PassionateScreen({super.key});

  @override
  ConsumerState<PassionateScreen> createState() => _PassionateScreenState();
}

class _PassionateScreenState extends ConsumerState<PassionateScreen> {
  final PageController _pageController1 = PageController();
  final PageController _pageController2 = PageController();

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passionateInterests = ref.watch(passionateInterestProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('가슴 뛰게 하는 것'),
      ),
      body: PageView.builder(
        controller: _pageController1,
        itemCount: passionateInterests.length,
        onPageChanged: (index) {
          _pageController2.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        itemBuilder: (context, index) {
          final interest = passionateInterests[index];
          return Stack(
            children: [
              // 배경 카드
              Center(
                child: Transform.scale(
                  scale: 1.1,
                  child: InterestCard(
                    interest: interest,
                    onTap: () {
                      context.push('/passionate/${interest.name}');
                    },
                  ),
                ),
              )
                  .animate(delay: 100.ms)
                  .fade(duration: 300.ms)
                  .slideX(begin: -0.2, duration: 300.ms, curve: Curves.easeOut),
              // 전경 카드
              Center(
                child: InterestCard(
                  interest: interest,
                  onTap: () {
                    context.push('/passionate/${interest.name}');
                  },
                ),
              )
                  .animate()
                  .fade(duration: 300.ms)
                  .slideX(begin: 0.2, duration: 300.ms, curve: Curves.easeOut),
            ],
          );
        },
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final Interest interest;
  final VoidCallback onTap;

  const InterestCard({
    super.key,
    required this.interest,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 아이콘
              Icon(
                interest.icon,
                size: 80,
              ),
              const SizedBox(height: 20),
              // 이름
              Text(
                interest.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // 설명
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  interest.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
