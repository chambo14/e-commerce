import 'package:e_commerce_app/presentation/screens/auth/onbaording_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/register_screen.dart';
import 'presentation/screens/cart/cart_screen.dart';
import 'presentation/screens/delivery/delivery_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/product/product_detail_screen.dart';
import 'presentation/screens/product/product_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ECommerceApp(),
    ),
  );
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/onbaording',
      routes: {
        '/onbaording': (_) => const OnboardingScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
        '/products': (_) => const ProductListScreen(),
        '/cart': (_) => const CartScreen(),
        '/delivery': (_) => const DeliveryScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(productId: productId),
          );
        }
        return null;
      },
    );
  }
}
