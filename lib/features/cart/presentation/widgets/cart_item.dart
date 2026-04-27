import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';

class CartItem extends StatelessWidget {
  final String name, subtitle, image;
  final double price;
  final int quantity;
  final VoidCallback onRemove, onIncrement, onDecrement;
  const CartItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF2EDE8),
      elevation: 0.1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: AppFontFamilies.georgia,
                        color: Color(0xFF4E4639),
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: AppFontFamilies.georgia,
                        color: Color(0xFF4E4639),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 160, 149, 133),),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 225, 221, 216),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          _qtyButton(Icons.remove, onDecrement),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          _qtyButton(Icons.add, onIncrement),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: Text(
                        "REMOVE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 28, height: 28, child: Icon(icon, size: 16)),
    );
  }
}
