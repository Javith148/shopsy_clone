import 'package:flutter/material.dart';
import 'package:shopsy/screens/Order_summary/order_placed_splash.dart';

class PaymentPage extends StatefulWidget {
  final int totalAmount;
  final int? oldPrice;
  final int? discountAmount;
  final int? couponDiscount;

  const PaymentPage({
    super.key,
    required this.totalAmount,
    this.oldPrice,
    this.discountAmount,
    this.couponDiscount,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.015,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 3 of 3",
                          style: TextStyle(fontSize: width * 0.032)),
                      Text(
                        "Payments",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.lock_outline, size: width * 0.04),
                      SizedBox(width: 4),
                      Text(
                        "100% Secure",
                        style: TextStyle(
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    // 🔹 Total Amount Card with Dropdown Breakdown
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(width * 0.04),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.018,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F2F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                                  ],
                                ),
                                Text(
                                  "₹${widget.totalAmount}",
                                  style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              SizedBox(height: 15),
                              _priceBreakdownRow(width, "Price (items)", "₹${widget.oldPrice ?? widget.totalAmount}"),
                              SizedBox(height: 8),
                              _priceBreakdownRow(width, "Discount", "- ₹${widget.discountAmount ?? 0}", isDiscount: true),
                              SizedBox(height: 8),
                              _priceBreakdownRow(width, "Coupons", "- ₹${widget.couponDiscount ?? 0}", isDiscount: true),
                              SizedBox(height: 8),
                              const Divider(),
                              SizedBox(height: 8),
                              _priceBreakdownRow(width, "Total", "₹${widget.totalAmount}", isBold: true),
                            ]
                          ],
                        ),
                      ),
                    ),

                    // 🔹 Offer Card
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F4EA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "5% instant discount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: width * 0.04,
                                    color: Colors.green[800],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Claim now with payment offers",
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: width * 0.032,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("https://img.icons8.com/color/48/visa.png"),
                              ),
                              SizedBox(width: 6),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("https://img.icons8.com/color/48/mastercard.png"),
                              ),
                              SizedBox(width: 6),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("https://img.icons8.com/color/48/google-pay.png"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // 🔹 Cash on Delivery Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.currency_rupee),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Cash on Delivery",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_up),
                            ],
                          ),

                          SizedBox(height: 10),

                          Container(
                            padding: EdgeInsets.all(width * 0.04),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "40,553 people used online payment options in the last hour.\nPay online now for safe and contactless delivery.",
                                  style: TextStyle(
                                    fontSize: width * 0.032,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 15),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const OrderPlacedSplash()),
                                    );
                                  },
                                  child: Container(
                                    height: height * 0.055,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Place Order",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // 🔹 UPI Section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("UPI",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("UPI",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                Text("Pay by any UPI app",
                                    style: TextStyle(color: Colors.grey)),
                                Text(
                                  "Save upto ₹19 • 15 offers available",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // 🔹 All Other Options
                    Container(
                      margin: EdgeInsets.all(width * 0.04),
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "All other payment options",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Gift Card, UPI, Cards & more",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    // 🔹 Bottom Text
                    Column(
                      children: [
                        Text(
                          "35 Crore happy customers and counting!",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Icon(Icons.sentiment_satisfied, color: Colors.grey),
                      ],
                    ),

                    SizedBox(height: height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceBreakdownRow(double width, String label, String value, {bool isDiscount = false, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            color: Colors.grey[700],
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: width * 0.035,
            color: isDiscount ? Colors.green : (isBold ? Colors.black : Colors.grey[800]),
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}