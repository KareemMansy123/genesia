import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingPage> onboardingPages = [
     OnboardingPage(
      image: 'assets/images/onboarding1.jpg',
      title: 'Welcome to Genesia',
      description: 'Discover a new way to interact with AI characters.',
    ),
     OnboardingPage(
      image: 'assets/images/onboarding2.jpg',
      title: 'Choose Your Character',
      description: 'Select a character to begin your journey.',
    ),
     OnboardingPage(
      image: 'assets/images/onboarding3.jpg',
      title: 'Engage and Enjoy',
      description: 'Chat and enjoy the experience.',
      isLastPage: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return onboardingPages[index];
        },
        itemCount: onboardingPages.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        loop: false,
      ),
    );
  }
}
