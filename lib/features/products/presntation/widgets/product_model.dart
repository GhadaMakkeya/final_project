class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String color;
  final String? label;
  final String? originalPrice;

  Product({
    required this.name,
    required this.price,
    this.label,
    required this.imageUrl,
    required this.color,
    this.originalPrice,
  });
}

final List<Product> myProducts = [
  Product(
    name: "Saphire Stiletto Pump",
    price: "\$980.00",
    originalPrice: "\$1,225.00",
    color: "MIDNIGHT BLUE",
    label: "SALE",
    imageUrl:
        "https://images.unsplash.com/photo-1594035910387-fea47794261f?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    originalPrice: "\$1,225.00",
    color: "18K YELLOW GOLD",
    label: "SALE",
    imageUrl:
        "https://images.unsplash.com/photo-1617229649830-3c949e1fabbe?q=80&w=1959&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    label: "NEW",
    imageUrl:
        "https://images.unsplash.com/photo-1591561954557-26941169b49e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    label: "SOLD OUT",
    imageUrl:
        "https://images.unsplash.com/photo-1594035910387-fea47794261f?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://images.unsplash.com/photo-1594035910387-fea47794261f?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://images.unsplash.com/photo-1590736704728-f4730bb30770?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    label: "NEW",
    imageUrl:
        "https://images.unsplash.com/photo-1542452255191-c85a98f2c5d1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    label: "SOLD OUT",
    imageUrl:
        "https://images.unsplash.com/photo-1671642883395-0ab89c3ac890?q=80&w=733&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://plus.unsplash.com/premium_photo-1681276169450-4504a2442173?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://frankie4.com/cdn/shop/files/0000_20251011_FRANKIE4_PDP_Studio_HepburnCherryStud_web_AW26_02640.jpg?v=1773974468&width=3000",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://plus.unsplash.com/premium_photo-1681276170291-27698ccc0a8e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Product(
    name: "Eterna Diamond Collet",
    price: "\$4,250.00",
    color: "18K YELLOW GOLD",
    imageUrl:
        "https://frankie4.com/cdn/shop/files/03092025_SS25_LP_Clarkson-Chocolate-Suede_FRANKIE4_2130-web.jpg?v=1768966131&width=3000",
  ),
];
