import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:shopsy/provider/providerclass.dart";

class PaymentPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final int finalPrice;
  final int oldPrice;
  final int discountAmount;
  final int selectedQty;

  const PaymentPage({
    super.key,
    required this.product,
    required this.finalPrice,
    required this.oldPrice,
    required this.discountAmount,
    required this.selectedQty,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'cod'; // cod, upi, card

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final addresses = Provider.of<AddressProvider>(context).addresses;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: width * 0.04,
              top: height * 0.04,
              end: width * 0.03,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(width: width * 0.03),
                Text(
                  "Payment",
                  style: TextStyle(fontSize: height * 0.022),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // Main Content
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),

                      // Step Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: const Color(0xFF543CEA),
                            size: height * 0.035,
                          ),
                          Container(
                            height: 2,
                            width: width * 0.25,
                            color: const Color(0xFF543CEA),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: const Color(0xFF543CEA),
                            size: height * 0.035,
                          ),
                          Container(
                            height: 2,
                            width: width * 0.25,
                            color: const Color(0xFF543CEA),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xFF543CEA),
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Customer"),
                          Text(
                            "\t Order summary \t",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("Payment"),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      Container(
                        height: 3,
                        width: double.infinity,
                        color: const Color.fromARGB(157, 134, 134, 134),
                      ),

                      SizedBox(height: height * 0.02),

                      // Delivery Address Section
                      if (addresses.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(width * 0.04),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deliver to:",
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: width * 0.02),
                                Text(
                                  addresses.last.fullName,
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: width * 0.01),
                                Text(
                                  "${addresses.last.house}, ${addresses.last.road}\n${addresses.last.city}, ${addresses.last.state} - ${addresses.last.pincode}",
                                  style: TextStyle(
                                    fontSize: width * 0.034,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      SizedBox(height: height * 0.02),

                      Container(
                        height: 8,
                        width: double.infinity,
                        color: const Color.fromARGB(157, 182, 182, 182),
                      ),

                      // Price Summary
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price Details",
                              style: TextStyle(
                                fontSize: width * 0.042,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            _priceRow(width, "Price (${widget.selectedQty} item${widget.selectedQty > 1 ? 's' : ''})",
                                "₹${widget.oldPrice * widget.selectedQty}"),
                            SizedBox(height: height * 0.01),
                            _priceRow(
                              width,
                              "Discount",
                              "- ₹${widget.discountAmount * widget.selectedQty}",
                              isDiscount: true,
                            ),
                            SizedBox(height: height * 0.01),
                            _priceRow(
                              width,
                              "Coupon",
                              "- ₹26",
                              isDiscount: true,
                            ),
                            SizedBox(height: height * 0.015),
                            Container(
                              height: 0.8,
                              width: double.infinity,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: height * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontSize: width * 0.042,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "₹${widget.finalPrice * widget.selectedQty}",
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF543CEA),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "You will save ₹${widget.discountAmount * widget.selectedQty}",
                              style: TextStyle(
                                fontSize: width * 0.036,
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 8,
                        width: double.infinity,
                        color: const Color.fromARGB(157, 182, 182, 182),
                      ),

                      // Payment Methods
                      SizedBox(height: height * 0.01),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.01,
                        ),
                        child: Text(
                          "Select Payment Method",
                          style: TextStyle(
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Cash on Delivery
                      _paymentMethodTile(
                        width,
                        height,
                        icon: Icons.payments,
                        title: "Cash on Delivery",
                        subtitle: "Pay when you receive",
                        value: 'cod',
                      ),

                      // UPI
                      _paymentMethodTile(
                        width,
                        height,
                        icon: Icons.qr_code_2,
                        title: "UPI / BHIM",
                        subtitle: "Google Pay, PhonePe, Paytm, etc.",
                        value: 'upi',
                      ),

                      // Card
                      _paymentMethodTile(
                        width,
                        height,
                        icon: Icons.credit_card,
                        title: "Credit / Debit Card",
                        subtitle: "Visa, Mastercard, RuPay",
                        value: 'card',
                      ),

                      Container(
                        height: 8,
                        width: double.infinity,
                        color: const Color.fromARGB(157, 182, 182, 182),
                      ),

                      // Security Badge
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: const Color(0xFF543CEA),
                              size: width * 0.05,
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              "100% Secure Transaction",
                              style: TextStyle(
                                fontSize: width * 0.038,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF543CEA),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: height * 0.12),
                    ],
                  ),
                ),

                // Bottom Button
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: width * 0.03,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                "₹${widget.finalPrice * widget.selectedQty}",
                                style: TextStyle(
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              _showPlaceOrderDialog(context, width, height);
                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: const Color(0xFF543CEA),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "Place Order",
                                  style: TextStyle(
                                    fontSize: width * 0.042,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(double width, String label, String value,
      {bool isDiscount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.036,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: width * 0.036,
            fontWeight: FontWeight.w500,
            color: isDiscount ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _paymentMethodTile(
    double width,
    double height, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.008,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPaymentMethod = value;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.015,
          ),
          decoration: BoxDecoration(
            color: selectedPaymentMethod == value
                ? Colors.blue.shade50
                : Colors.white,
            border: Border.all(
              color: selectedPaymentMethod == value
                  ? const Color(0xFF543CEA)
                  : Colors.grey.shade300,
              width: selectedPaymentMethod == value ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF543CEA),
                size: width * 0.06,
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: width * 0.032,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Radio<String>(
                value: value,
                groupValue: selectedPaymentMethod,
                activeColor: const Color(0xFF543CEA),
                onChanged: (newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlaceOrderDialog(BuildContext context, double width, double height) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Order"),
        content: Text(
          "Proceed with ${_getPaymentMethodName(selectedPaymentMethod)}?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Order placed successfully!"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(
              "Place Order",
              style: TextStyle(color: const Color(0xFF543CEA)),
            ),
          ),
        ],
      ),
    );
  }

  String _getPaymentMethodName(String method) {
    switch (method) {
      case 'cod':
        return 'Cash on Delivery';
      case 'upi':
        return 'UPI Payment';
      case 'card':
        return 'Card Payment';
      default:
        return 'Payment';
    }
  }
}
