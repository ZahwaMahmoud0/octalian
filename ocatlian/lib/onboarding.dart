import 'package:flutter/material.dart';
import 'onboarding_list.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (i) {
                  setState(() => currentIndex = i);
                },
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          onboardingPages[i]["title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF754CB4),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          onboardingPages[i]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 25),
                        Image.asset(onboardingPages[i]["image"]!, height: 270),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text("Skip"),
                    onPressed: () =>
                        _controller.jumpToPage(onboardingPages.length - 1),
                  ),
                  Row(
                    children: List.generate(
                      onboardingPages.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 12 : 10,
                        height: currentIndex == index ? 12 : 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? Color(0xFF754CB4)
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF754CB4),
                    ),
                    child: Text(
                      currentIndex == onboardingPages.length - 1
                          ? "Start"
                          : "Next",
                          style: TextStyle(color: Colors.white), 
                    ),
                    onPressed: () {
                      if (currentIndex == onboardingPages.length - 1) {
                        Navigator.pushNamed(context, '/home');
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
