import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductGridPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Neem Oil Spray",
      description: "Organic pesticide for common plant pests.",
      price: "₹199",
      imageUrl: "assets/plant_products/1.webp",
    ),
    Product(
      name: "Fungal Cure Powder",
      description: "Effective against fungal infections like mildew.",
      price: "₹149",
      imageUrl: "assets/plant_products/2.jpeg",
    ),
    Product(
      name: "Root Booster",
      description: "Strengthens plant roots and prevents rot.",
      price: "₹250",
      imageUrl: "assets/plant_products/3.jpeg",
    ),
    Product(
      name: "Insecticidal Soap",
      description: "Kills soft-bodied insects safely.",
      price: "₹179",
      imageUrl: "assets/plant_products/4.jpeg",
    ),
    Product(
      name: "Bordeaux Mixture",
      description: "Fungicide for blight and downy mildew.",
      price: "₹120",
      imageUrl: "assets/plant_products/5.jpeg",
    ),
    Product(
      name: "Copper Oxychloride",
      description: "Controls bacterial and fungal diseases.",
      price: "₹180",
      imageUrl: "assets/plant_products/6.jpeg",
    ),
    Product(
      name: "Sulphur Dust",
      description: "Treats powdery mildew, rust, and mites.",
      price: "₹160",
      imageUrl: "assets/plant_products/7.jpeg",
    ),
    Product(
      name: "Trichoderma Bio-Fungicide",
      description: "Fights root and stem rot naturally.",
      price: "₹199",
      imageUrl: "assets/plant_products/8.webp",
    ),
    Product(
      name: "Panchagavya Fertilizer",
      description: "Organic growth booster and pest repellent.",
      price: "₹130",
      imageUrl: "assets/plant_products/9.webp",
    ),
    Product(
      name: "Potassium Bicarbonate",
      description: "Controls fungal growth on plant leaves.",
      price: "₹110",
      imageUrl: "assets/plant_products/10.jpeg",
    ),
    Product(
      name: "Castor Oil Cake",
      description: "Fertilizer and nematode repellent.",
      price: "₹140",
      imageUrl: "assets/plant_products/11.jpeg",
    ),
    Product(
      name: "Seaweed Extract Spray",
      description: "Improves plant immunity and stress tolerance.",
      price: "₹200",
      imageUrl: "assets/plant_products/12.jpeg",
    ),
    Product(
      name: "Garlic-Chili Pest Spray",
      description: "Natural spray to repel common insects.",
      price: "₹99",
      imageUrl: "assets/plant_products/13.jpeg",
    ),
    Product(
      name: "Azadirachtin 1500ppm",
      description: "Strong neem-based pesticide for heavy pests.",
      price: "₹249",
      imageUrl: "assets/plant_products/14.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cure Products for Plant Diseases"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
          children: products.map((product) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      product.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.price,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
