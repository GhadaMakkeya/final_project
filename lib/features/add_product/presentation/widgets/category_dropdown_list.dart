import 'package:flutter/material.dart';

const List<String> _kCategories = [
  'Bags & Accessories',
  'Clothing',
  'Footwear',
  'Jewelry',
  'Home & Living',
  'Art & Prints',
];

class CategoryDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 251, 248, 245),
        border: Border.all(color: Color.fromARGB(255, 121, 95, 68), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: Color.fromARGB(255, 251, 248, 245),
          borderRadius: BorderRadius.circular(12),
          elevation: 3,
          menuMaxHeight: 260,
          hint: Row(
            children: const [
              Icon(Icons.grid_view_rounded, size: 16, color: Color.fromARGB(255, 121, 95, 68)),
              SizedBox(width: 8),
              Text(
                'Select a category',
                style: TextStyle(
                  color: Color.fromARGB(255, 121, 95, 68),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color.fromARGB(255, 121, 95, 68),
              size: 22,
            ),
          ),
          selectedItemBuilder: (_) => _kCategories
              .map(
                (c) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    c,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5C3D1E),
                    ),
                  ),
                ),
              )
              .toList(),
          items: _kCategories.map((c) {
            final isSelected = c == value;
            return DropdownMenuItem(
              value: c,
              child: Row(
                children: [
                  Icon(
                    _categoryIcon(c),
                    size: 16,
                    color: isSelected
                        ? const Color(0xFF8B5E3C)
                        : const Color(0xFFB08060),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    c,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? const Color(0xFF5C3D1E)
                          : const Color(0xFF7A5C44),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Bags & Accessories':
        return Icons.shopping_bag_outlined;
      case 'Clothing':
        return Icons.checkroom_outlined;
      case 'Footwear':
        return Icons.directions_walk_outlined;
      case 'Jewelry':
        return Icons.diamond_outlined;
      case 'Home & Living':
        return Icons.chair_outlined;
      case 'Art & Prints':
        return Icons.palette_outlined;
      default:
        return Icons.label_outline;
    }
  }
}
