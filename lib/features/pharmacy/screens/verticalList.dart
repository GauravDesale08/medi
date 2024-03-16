import 'package:flutter/material.dart';
import 'package:medihub/utils/customBanner.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key}) : super(key: key);

  static const String routeName = "pharmacy";

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Implement cart action
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search doctor, drug, article...",
            ),
          ),
          CustomBanner(
            text: 'Order quickly with \nPrescription',
            buttonText: 'Upload Prescription',
            imagePath: 'assets/contractrqe 1.png',
            onPressed: () {
              // Add your button action here
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildProductCard('Product 1', '10 pcs', '\$20',
                                'assets/product1.jpg'),
                            _buildProductCard('Product 2', '15 pcs', '\$25',
                                'assets/product2.jpg'),
                            _buildProductCard('Product 3', '20 pcs', '\$30',
                                'assets/product3.jpg'),
                            _buildProductCard('Product 4', '25 pcs', '\$35',
                                'assets/product4.jpg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      String name, String pcs, String price, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 80,
            width: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(name),
          Text(pcs),
          Text(price),
        ],
      ),
    );
  }
}
