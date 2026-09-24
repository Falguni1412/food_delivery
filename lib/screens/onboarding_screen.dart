import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboarding1.png",
      "title": "Choose Your Food",
      "desc": "Explore the best meals from your favorite restaurants and cafes "
    },
    {
      "image": "assets/onboarding2.png",
      "title": "Fast Delivery",
      "desc": "Get your food delivered quickly at your doorstep"
    },
    {
      "image": "assets/onboarding3.png",
      "title": "Track Order",
      "desc": "Track your order in real-time with live updates"
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < onboardingData.length - 1) {
        _currentIndex++;
        _controller.animateToPage(_currentIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(data["image"]!, height: 300),
              const SizedBox(height: 40),
              Text(data["title"]!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(data["desc"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (dotIndex) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    duration: const Duration(milliseconds: 300),
                    height: 8,
                    width: _currentIndex == dotIndex ? 24 : 8,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
