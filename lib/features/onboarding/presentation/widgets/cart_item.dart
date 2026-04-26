import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey)),
          Row(
            children: [
              Row(
                children: [
                  _qtyButton(Icons.remove, onDecrement),
                  Text('$quantity', style: TextStyle(fontSize: 15)),
                  _qtyButton(Icons.add, onIncrement),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "REMOVE",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
