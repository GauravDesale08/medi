import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/appointment';
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openPaymentPortal() async {
    var options = {
      'key': 'rzp_test_pFfYWIa2Jo0gJk',
      'amount': 20000,
      'name': 'John',
      'description': 'Payment',
      'prefill': {'contact': '9999999999', 'email': 'john@razorpay.com'},
      'external': {'wallets': ['paytm']}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }



  String selectedDate = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130, // Set a fixed height
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://via.placeholder.com/150',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Name',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Position'),
                              Text('Rating'),
                              Text('Distance'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          ' Wednesday, Jun 23, 2021 | 10:00 AM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Reason',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.format_indent_increase_outlined),
                        Text(
                          ' Reason for appointment',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 16),
                    Text(
                      'Payment Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Consultation'),
                        Text('\$Price'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Admin Fee'),
                        Text('\$Price'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Aditional Discount'),
                        Text('\$Price'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('\$Total Price'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '\$Total Price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                openPaymentPortal();
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}