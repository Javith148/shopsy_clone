import 'package:flutter/material.dart';
import 'package:shopsy/main.dart';

class OrderPlacedSplash extends StatefulWidget {
  const OrderPlacedSplash({super.key});

  @override
  State<OrderPlacedSplash> createState() => _OrderPlacedSplashState();
}

class _OrderPlacedSplashState extends State<OrderPlacedSplash> {
  @override
  void initState() {
    super.initState();
    // Navigate to homepage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Bottom()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Animation/Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: width * 0.25,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Order Placed Successfully!",
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Thank you for shopping with Shopsy",
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF543CEA)),
            ),
            const SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }
}
