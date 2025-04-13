import 'package:e_bazar/Ui%20/Home/Home_screen.dart';
import 'package:e_bazar/widget/app_image.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/Image@2x.png",
      "title": "Hello",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis."
    },
    {
      "image": "assets/Placeholder_01@2x.png",
      "title": "Welcome",
      "description":
      "Morbi eu eleifend lacus. Lorem ipsum dolor sit amet, consectetur."
    },
    {
      "image": "assets/Placeholder_01@2x.png",
      "title": "Shop Now",
      "description":
      "Get the best deals now. Morbi eu eleifend lacus. Lorem ipsum dolor sit amet."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      image: onboardingData[index]["image"]!,
                      title: onboardingData[index]["title"]!,
                      description: onboardingData[index]["description"]!,
                      showButton: index==1 || index ==2,
                      buttonText: index==1? "Ready":"Go!",
                    );
                  },
                ),
              ),
              // Page Indicator
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (index) => AnimatedContainer(
                      duration: Duration(seconds: 3),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.blue
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingCard extends StatelessWidget {
  final String image, title, description;
  final bool showButton;
  final String buttonText;

  OnboardingCard({
    required this.image,
    required this.title,
    required this.description,
    this.showButton=false ,
    this.buttonText = "Ready?",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image, height: 300, fit: BoxFit.cover),
              ),
              SizedBox(height: 30),
              Text(title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text(description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 20,),
              if (showButton)
              GestureDetector(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      )
                    ]
                  ),
                  child: Text(
                    buttonText, // ✅ Dynamic Button Text
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
