import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsy/provider/providerclass.dart';
import 'package:shopsy/screens/Order_summary/add_addess.dart';
import 'package:shopsy/screens/Order_summary/order_summary.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer2<CartProvider, AddressProvider>(
        builder: (context, cartProvider, addressProvider, child) {
          final cartItems = cartProvider.cartItems;

          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                ],
              ),
            );
          }

          int totalOldPrice = 0;
          int totalDiscount = 0;
          int totalCoupon = cartItems.length * 26;
          int totalFinalPrice = 0;

          for (var item in cartItems) {
            int oldPrice = int.tryParse(
                    item.product['oldPrice'].toString()) ??
                0;
            int discount = int.tryParse(
                    item.product['discount'].toString()) ??
                0;
            int quantity = item.quantity;

            int itemOldPrice = oldPrice * quantity;
            int itemDiscount = ((oldPrice * discount) ~/ 100) * quantity;

            totalOldPrice += itemOldPrice;
            totalDiscount += itemDiscount;
            totalFinalPrice += itemOldPrice - itemDiscount;
          }
          totalFinalPrice -= totalCoupon;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width *0.04,
                        top: width *0.1,
                        bottom: width *0.02
                      
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back),
                          ),
                          SizedBox(width: width * 0.03),
                          Text(
                            "My Cart (${cartItems.length})",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),

                    // Delivery Address
                    if (addressProvider.addresses.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.015,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deliver to: ${addressProvider.addresses.last.fullName}, ${addressProvider.addresses.last.pincode}",
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  "${addressProvider.addresses.last.house}, ${addressProvider.addresses.last.road}",
                                  style: TextStyle(
                                    fontSize: width * 0.032,
                                    color: Colors.grey[600],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeliveryAddess()));
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: const Color(0xFF543CEA),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    Container(
                      height: 8,
                      color: Colors.grey.shade200,
                    ),

                    // Cart Items
                    ...cartItems.map((cartItem) {
                      int oldPrice = int.tryParse(
                              cartItem.product['oldPrice'].toString()) ??
                          0;
                      int discount = int.tryParse(
                              cartItem.product['discount'].toString()) ??
                          0;
                      int discountAmount =
                          ((oldPrice * discount) ~/ 100) *
                              cartItem.quantity;
                      int itemTotal = (oldPrice * cartItem.quantity) -
                          discountAmount -
                          (26 * cartItem.quantity);

                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(width * 0.04),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                SizedBox(width: width * 0.02),
                                // Product Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Product Title
                                      Text(
                                        cartItem.product['title'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      
                                     
                                      // Price Info
                                      Row(
                                        children: [
                                          Text(
                                            "${cartItem.product['discount']}% off",
                                            style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Text(
                                            "₹${cartItem.product['oldPrice']}",
                                            style: TextStyle(
                                              fontSize: width * 0.03,
                                              decoration: TextDecoration
                                                  .lineThrough,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Text(
                                            "₹${cartItem.product['price']}",
                                            style: TextStyle(
                                              fontSize: width * 0.036,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.015),
                                      // Offers Info
                                      Text(
                                        "1 coupon applied • 5 offers available",
                                        style: TextStyle(
                                          fontSize: width * 0.028,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      // Delivery Info
                                      Text(
                                        "Delivery by Tue May 5",
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                 // Product Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    cartItem.product['image'],
                                    width: width * 0.25,
                                    height: width * 0.25,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Quantity and Actions
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.01,
                            ),
                            child: Row(
                              children: [
                                // Quantity Selector
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (cartItem.quantity > 1) {
                                            cartProvider.updateQuantity(
                                              cartItem.product['id'],
                                              cartItem.quantity - 1,
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.03,
                                              vertical: height * 0.008),
                                          child: Text("-",
                                              style: TextStyle(
                                                  fontSize: width * 0.04)),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: height * 0.025,
                                        color: Colors.grey.shade300,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.04,
                                            vertical: height * 0.008),
                                        child: Text(
                                          cartItem.quantity.toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.035),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: height * 0.025,
                                        color: Colors.grey.shade300,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cartProvider.updateQuantity(
                                            cartItem.product['id'],
                                            cartItem.quantity + 1,
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.03,
                                              vertical: height * 0.008),
                                          child: Text("+",
                                              style: TextStyle(
                                                  fontSize: width * 0.04)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                // Move to Saved & Remove
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "❤ Move to Saved Items",
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.03),
                                    GestureDetector(
                                      onTap: () {
                                        cartProvider.removeFromCart(
                                          cartItem.product['id'],
                                        );
                                      },
                                      child: Text(
                                        "🗑 Remove",
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      );
                    }).toList(),

                    Container(
                      height: 8,
                      color: Colors.grey.shade200,
                    ),

                    // Price Details
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price Details",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          _priceRow(
                            width,
                            "Price (${cartItems.length} item${cartItems.length > 1 ? 's' : ''})",
                            "₹$totalOldPrice",
                          ),
                          SizedBox(height: height * 0.01),
                          _priceRow(
                            width,
                            "Discount",
                            "- ₹$totalDiscount",
                            isDiscount: true,
                          ),
                          SizedBox(height: height * 0.01),
                          _priceRow(
                            width,
                            "Coupons for you",
                            "- ₹$totalCoupon",
                            isDiscount: true,
                          ),
                          SizedBox(height: height * 0.015),
                          Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: height * 0.015),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Customer Price",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "₹$totalFinalPrice",
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "You will save ₹$totalDiscount on this order",
                            style: TextStyle(
                              fontSize: width * 0.036,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Security Info
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Container(
                        padding: EdgeInsets.all(width * 0.03),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_user,
                              color: Colors.green,
                              size: width * 0.05,
                            ),
                            SizedBox(width: width * 0.03),
                            Expanded(
                              child: Text(
                                "Safe and secure payments. Easy returns.\n100% Authentic products.",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.15),
                  ],
                ),
              ),
              // Continue Button
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹$totalOldPrice",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              color: Colors.grey[600],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            "₹$totalFinalPrice",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigate to order summary with first cart item
                          if (cartItems.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderSummary(
                                  product: cartItems.first.product,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.08,
                            vertical: height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF543CEA),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
}
