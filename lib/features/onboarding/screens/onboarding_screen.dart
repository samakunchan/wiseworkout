import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/feedback/widgets/feedback_button.dart';
import 'package:wiseworkout/features/onboarding/signals/onboarding_store.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.isRelaunched = false});

  final bool isRelaunched;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _complete() async {
    if (widget.isRelaunched) {
      Navigator.of(context).pop();
    } else {
      await kGetIt<OnboardingStore>().completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> slides = [
      _buildSlide1(context),
      _buildSlide2(context),
      _buildSlide3(context),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: widget.isRelaunched
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: [
          const FeedbackButton(labels: ['onboarding']),
          if (_currentPage < slides.length - 1)
            TextButton(
              onPressed: _complete,
              child: Text(
                context.localizations.buttonSkip,
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: .bold),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultSpacing),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: slides,
                ),
              ),
              const SizedBox(height: 16),
              // Dots indicator
              Row(
                mainAxisAlignment: .center,
                children: List.generate(slides.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              // Next/Get Started Button
              SizedBox(
                width: .infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_currentPage < slides.length - 1) {
                      await _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      await _complete();
                    }
                  },
                  child: Text(
                    _currentPage == slides.length - 1 ? context.localizations.buttonGetStarted : context.localizations.buttonNext,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlide1(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 8,
                      ),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.fitness_center,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bolt,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 60,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: .stretch,
          children: [
            RichText(
              textAlign: .center,
              text: TextSpan(
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 28,
                  height: 1.2,
                ),
                children: [
                  TextSpan(
                    text: context.localizations.welcomeScreenTitlePrefix,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge?.color,
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.welcomeScreenTitleHighlight,
                    style: const TextStyle(
                      color: kPrimaryOrange,
                      fontStyle: .italic,
                    ),
                  ),
                  TextSpan(
                    text: context.localizations.welcomeScreenTitleSuffix,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.localizations.welcomeScreenSubtitleKnowledge,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextGreyVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.welcomeScreenSubtitleSequence,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextDark,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide2(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 8,
                      ),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.alarm,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.volume_up,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 60,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              context.localizations.onboardingSlide2Title,
              textAlign: .center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 28,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.localizations.onboardingSlide2Subtitle1,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextGreyVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.onboardingSlide2Subtitle2,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextDark,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide3(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 8,
                      ),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.bar_chart,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.local_fire_department,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 60,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              context.localizations.onboardingSlide3Title,
              textAlign: .center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 28,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.localizations.onboardingSlide3Subtitle1,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextGreyVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.localizations.onboardingSlide3Subtitle2,
              textAlign: .center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextDark,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
