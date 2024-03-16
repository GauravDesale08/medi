import 'package:flutter/material.dart';
import 'package:medihub/constants/colors.dart';
import 'package:medihub/features/pharmacy/screens/cart.dart';
import 'package:provider/provider.dart';

class ProductData extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}

class ProductSelected extends StatefulWidget {
  const ProductSelected({Key? key}) : super(key: key);

  static const String routeName = "productSelected";

  @override
  State<ProductSelected> createState() => _ProductSelectedState();
}

class _ProductSelectedState extends State<ProductSelected> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<ProductData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drugs Detail'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/300',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drug Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Drug Weight',
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          productData.decrementQuantity();
                        },
                        icon: const Icon(Icons.remove),
                        color: bgColor, // Set the color of the icon
                        splashRadius: 20, // Set the splash radius
                        iconSize: 24, // Set the icon size
                      ),
                      Text('${productData.quantity}'),
                      IconButton(
                        onPressed: () {
                          productData.incrementQuantity();
                        },
                        icon: const Icon(Icons.add),
                        color: bgColor, // Set the color of the icon
                        splashRadius: 20, // Set the splash radius
                        iconSize: 24, // Set the icon size
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24, // Set the font size to make it big
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. SedLorem ipsum dolor sit amet, consectetur adipiscing elit. SedLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed.........',
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity, // Set width to match parent
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add to cart logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            bgColor, // Use bgColor as the button's background color
                      ),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ), // Add cart icon
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
