import 'package:e_commerce_app/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "title": "Le marché local dans votre poche",
      "description": "Découvrez, achetez et vendez des produits frais et artisanaux directement près de chez vous.",
      "icon": Icons.storefront_rounded,
      "color": Colors.green.shade50,
      "iconColor": Colors.green,
    },
    {
      "title": "Consommez local, simplement",
      "description": "Trouvez des fruits, légumes et créations uniques à deux pas de chez vous. Soutenez l'économie locale en circuit court.",
      "icon": Icons.location_on_rounded,
      "color": Colors.orange.shade50,
      "iconColor": Colors.orange,
    },
    {
      "title": "Vendez en un clin d'œil",
      "description": "Vous êtes producteur ou artisan ? Créez votre boutique gratuitement et touchez instantanément les voisins autour de vous.",
      "icon": Icons.add_a_photo_rounded,
      "color": Colors.blue.shade50,
      "iconColor": Colors.blue,
    },
    {
      "title": "Prêt à rejoindre la communauté ?",
      "description": "Activez la géolocalisation pour voir ce qui se vend à proximité et commencer l'expérience.",
      "icon": Icons.people_alt_rounded,
      "color": Colors.purple.shade50,
      "iconColor": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPage == _onboardingData.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Bouton Passer (Skip) en haut
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_onboardingData.length - 1);
                  },
                  child: Text(
                    isLastPage ? "" : "Passer",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
            ),

            // Contenu du Carrousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Zone Visuelle / Illustration
                        Container(
                          height: 220,
                          width: 220,
                          decoration: BoxDecoration(
                            color: _onboardingData[index]["color"],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _onboardingData[index]["icon"],
                            size: 100,
                            color: _onboardingData[index]["iconColor"],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Titre
                        Text(
                          _onboardingData[index]["title"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Description
                        Text(
                          _onboardingData[index]["description"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicateurs de pages (Dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.green : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Boutons d'action inférieurs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? "Rejoindre le marché" : "Suivant",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Option secondaire sur le dernier écran
            if (isLastPage)
              TextButton(
                onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                },
                child: const Text(
                  "Explorer l'application sans inscription",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                ),
              )
            else
              const SizedBox(height: 48), // Espacement constant pour éviter les sauts de layout
          ],
        ),
      ),
    );
  }
}