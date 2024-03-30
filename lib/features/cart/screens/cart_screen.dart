import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medihub/features/cart/models/cart.dart';
import 'package:medihub/features/cart/services/cart_services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PharmacyCart extends StatefulWidget {
  const PharmacyCart({Key? key}) : super(key: key);

  static const String routeName = "pharmacyCart";

  @override
  State<PharmacyCart> createState() => _PharmacyCartState();
}

class _PharmacyCartState extends State<PharmacyCart> {

  Cart? fetchedCart ;
  final CartServices cartServices = CartServices();
  String? authToken;

  @override
  void initState() {
    super.initState();
   fetchToken();
   fetcheUserCart();
  }

  void fetchToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    authToken = sharedPreferences.getString('x-auth-token');
    print(authToken);
    // Get the token from shared preferences
  }

  void fetcheUserCart()async{
  
    fetchedCart = await cartServices.fetchCartDetails(authToken);
    print(fetchedCart);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: fetchedCart == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: fetchedCart!.userCart.length,
                    itemBuilder: (context, index) {
                      final item = fetchedCart!.userCart[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    item.pharmacy.medImage,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.pharmacy.medName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(item.pharmacy.medQuantity.toString()),
                                        Text('\$${item.pharmacy.medPrice.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      // Implement delete logic
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '\$${item.pharmacy.medPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$100', // You can calculate the total based on the fetchedCart
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement payment logic
                        },
                        child: const Text('Pay'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
