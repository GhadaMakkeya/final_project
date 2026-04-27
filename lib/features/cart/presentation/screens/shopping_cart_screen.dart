import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/widgets/cart_item.dart';
import 'package:veloura/features/cart/presentation/widgets/summary_row.dart';

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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        toolbarHeight: 65,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64,
        title: Text(AppStrings.appName, style: AppTextStyles.appNameTextStyle),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(
                  "Your Cart",
                  style: TextStyle(
                    color: Color(0xFF4E4639),
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFontFamilies.georgia,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${cartItems.length} items ready for checkout.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4E4639),
                  ),
                ),
              ),
              SizedBox(height: 48),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 24, 20, 32),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 247, 247),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(
                          fontFamily: AppFontFamilies.georgia,
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Color(0xFF4E4639),
                        ),
                      ),
                      SizedBox(height: 16),
                      Divider(
                        height: 24,
                        color: Color.fromARGB(255, 201, 192, 178),
                      ),
                      SizedBox(height: 16),
                      SummaryRow(label: "Subtotal", value: "\$1,985.00"),
                      SizedBox(height: 8),
                      SummaryRow(label: "Shipping", value: "Complimentary"),
                      SizedBox(height: 8),
                      SummaryRow(label: "Estimated Tax", value: "\$158.80"),
                      SizedBox(height: 16),
                      Divider(
                        height: 24,
                        color: Color.fromARGB(255, 201, 192, 178),
                      ),
                      SizedBox(height: 16),
                      SummaryRow(
                        label: "Total",
                        value: "\$2,143.80",
                        isBold: true,
                        labelFontSize: 24,
                        valueFontSize: 32,
                        fontFamily: AppFontFamilies.georgia,
                      ),
                      SizedBox(height: 24),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "PROCEED TO CHECKOUT",
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 14,
                            color: Color(0xFF4E4639),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "SECURE CHECKOUT",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4E4639),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
