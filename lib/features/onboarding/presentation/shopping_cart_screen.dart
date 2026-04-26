import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:veloura/features/onboarding/domain/models/cart_item_model.dart';
import 'package:veloura/features/onboarding/presentation/widgets/cart_item.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  final List<CartItemModel> cartItems = [
    CartItemModel(
      name: 'Cashmere & Silk Scarf',
      subtitle: 'Midnight Navy',
      price: 345.00,
      quantity: 1,
      image: 'assets/images/Silk Scarf.png',
    ),
    CartItemModel(
      name: 'Eternity Band',
      subtitle: '18k Yellow Gold, Size 7',
      price: 1250.00,
      quantity: 1,
      image: 'assets/images/Gold Ring.png',
    ),
    CartItemModel(
      name: 'Oud Bergamot',
      subtitle: 'Eau de Parfum, 50ml',
      price: 195.00,
      quantity: 2,
      image: 'assets/images/Perfume.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text(
          "VELOURA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Color(0xff061F3D),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              "Your Bag",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "${cartItems.length} items ready for checkout.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff4E4639),
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItem(
                  name: item.name,
                  subtitle: item.subtitle,
                  image: item.image,
                  price: item.price,
                  quantity: item.quantity,
                  onRemove: () => setState(() => cartItems.removeAt(index)),
                  onIncrement: () => setState(() => item.quantity++),
                  onDecrement: () => setState(() {
                    if (item.quantity > 1) item.quantity--;
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
