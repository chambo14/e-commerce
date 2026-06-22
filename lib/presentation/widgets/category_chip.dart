import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/category.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:SizedBox(
        width: 70,

        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.inputFill,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _iconFromName(category.iconName),
                size: 22,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                category.name,
                style: GoogleFonts.inter(fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'devices':
        return Icons.devices;
      case 'checkroom':
        return Icons.checkroom;
      case 'restaurant':
        return Icons.restaurant;
      case 'home':
        return Icons.home_outlined;
      case 'sports_soccer':
        return Icons.sports_soccer;
      case 'spa':
        return Icons.spa;
      case 'all_inclusive':
        return Icons.apps_rounded;
      default:
        return Icons.category_outlined;
    }
  }
}
