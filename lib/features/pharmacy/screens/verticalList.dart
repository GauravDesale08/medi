import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medihub/features/pharmacy/screens/cart.dart';
import 'package:medihub/features/pharmacy/services/productModel.dart';
import 'package:medihub/utils/customBanner.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key}) : super(key: key);

  static const String routeName = "pharmacy";

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://your-api-url-here'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return List<Product>.from(data.map((item) => Product.fromJson(item)));
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, PharmacyCart.routeName);
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
          FutureBuilder<List<Product>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(snapshot.data![index]);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      width: 120,
      height: 200, // Increased height
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imageUrl,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Text(product.name),
              Text(product.pcs),
              Text(product.price),
            ],
          ),
          Positioned(
            bottom: -5,
            right: -5,
            child: IconButton(
              onPressed: () {
                // Add your button action here
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
