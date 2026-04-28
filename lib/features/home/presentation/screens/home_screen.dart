import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:veloura/features/home/data/category_data.dart';
import 'package:veloura/features/home/data/offers_data.dart';
import 'package:veloura/features/home/data/product_data_model.dart';
import 'package:veloura/features/home/presentation/widgets/custom_category_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_offer_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_product_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<CategoryData> categories = [
    CategoryData(categoryName: "All", isSelected: true),
    CategoryData(categoryName: "jewelry"),
    CategoryData(categoryName: "Perfumes"),
    CategoryData(categoryName: "Bags"),
    CategoryData(categoryName: "Shoes"),
  ];
  void selectCategory(int index) {
    for (var element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<OffersData> offers = [
      OffersData(
        imagePath:
            "https://i.pinimg.com/736x/ef/5d/19/ef5d19d66d9fafecd3ff4d1c85f82c3c.jpg",
        offerTitle: "Winter Collection",
        offerDesc: "Exclusive 20% off for the next 24 hours",
      ),
      OffersData(
        imagePath:
            "https://i.pinimg.com/control1/1200x/2e/fd/67/2efd6797c8ef797666ffaa7cd9d473b8.jpg",
        offerTitle: "Winter Collection",
        offerDesc: "Exclusive 20% off for the next 24 hours",
      ),
      OffersData(
        imagePath:
            "https://i.pinimg.com/736x/ef/5d/19/ef5d19d66d9fafecd3ff4d1c85f82c3c.jpg",
        offerTitle: "Winter Collection",
        offerDesc: "Exclusive 20% off for the next 24 hours",
      ),
    ];
    List<ProductDataModel> products = [
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/a7/42/24/a7422429694f5e1426ebaf85b5160d89.jpg",
        productName: "Signature Chrono",
        price: "\$1,250.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/control1/736x/7d/d9/ed/7dd9edd6992dec26196227c59688ad24.jpg",
        productName: "Essence No. 5",
        price: "\$280.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/04/3e/d4/043ed498d9e5d1d3cddd2587283805b3.jpg",
        productName: "Aviator Gilt",
        price: "\$890.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/36/ce/79/36ce79b6407b7fc75cdfaaee1668a916.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
      ProductDataModel(
        imagePath:
            "https://i.pinimg.com/736x/6e/d6/be/6ed6be775c633f8f58d7fac15438917b.jpg",
        productName: "Noir Envelope Bag",
        price: "\$420.00",
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xffF2EDE8),
      //-------------AppBar------------
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Color(0xffF2EDE8),
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64,
        title: Text(
          AppStrings.appName,
          style: const TextStyle(
            fontFamily: AppFontFamilies.georgia,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
            color: Color(0xFF1A1A1A),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Color(0xff1C1917)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Color(0xff1C1917)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //----------featured offers---------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Offers",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: AppFontFamilies.georgia,
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "SEE ALL",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    return CustomOfferIteam(offersData: offers[index]);
                  },
                ),
              ),
              SizedBox(height: 15),
              //----------offers section---------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(offers.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              //----------category---------
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CustomCategoryItem(
                      categoryData: categories[index],
                      onTap: () {
                        selectCategory(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CategoryScreen();
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              //----------products--------
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.6 / 3,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CustomProductCard(productDataModel: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
