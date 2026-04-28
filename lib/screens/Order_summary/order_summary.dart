import 'package:flutter/material.dart';
import 'package:shopsy/screens/Order_summary/add_addess.dart';
import 'package:shopsy/screens/Order_summary/payment_page.dart';
import "package:shopsy/provider/providerclass.dart";
import 'package:provider/provider.dart';

class OrderSummary extends StatefulWidget {
  final Map<String, dynamic> product;
  const OrderSummary({super.key, required this.product});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int selectedQty = 1;

  String calculateDeliveryDate(String deliveryTime) {
    try {
      final parts = deliveryTime.replaceAll(RegExp(r'[^0-9-]'), '').split('-');

      if (parts.isEmpty) return deliveryTime;

      final maxDays = int.parse(parts.last);

      final today = DateTime.now();
      final deliveryDate = today.add(Duration(days: maxDays));

      return _formatFullDate(deliveryDate);
    } catch (e) {
      return deliveryTime;
    }
  }

  String _formatFullDate(DateTime date) {
    final months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    final days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return "${months[date.month - 1]} ${date.day}, ${days[date.weekday - 1]}";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    int stock = int.tryParse(widget.product['stock'].toString()) ?? 1;
    if (stock < 1) stock = 1;

    int oldPrice = int.tryParse(widget.product['oldPrice'].toString()) ?? 0;
    int discount = int.tryParse(widget.product['discount'].toString()) ?? 0;
    
    // Price calculations with quantity
    int totalOldPrice = oldPrice * selectedQty;
    int discountAmount = ((oldPrice * discount) ~/ 100) * selectedQty;
    int dicountprice = discountAmount;
    int couponDiscount = 26 * selectedQty;
    int finalprice = totalOldPrice - discountAmount - couponDiscount;


      final addresses = Provider.of<AddressProvider>(context).addresses;
      
      // Check if address is sufficient
      bool isAddressSufficient = addresses.isNotEmpty &&
          addresses.last.altPhone.isNotEmpty &&
          addresses.last.landmark.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
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
                    "Review Order",
                    style: TextStyle(fontSize: height * 0.022),
                  ),
                ],
              ),
            ),
       Expanded(child: 
      Stack(
        children: [

       SingleChildScrollView(
        child: Column(
          children: [
          
            SizedBox(height: height * 0.02),
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
                CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xFF543CEA),
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: width * 0.25,
                  color: const Color(0xFF543CEA),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF543CEA),
                      width: 1.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: const Color(0xFF543CEA),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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
          
       
                    

                       /// 🔹 ADDRESS SECTION
                      addresses.isEmpty
                          ?   GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddDeliveryAddess()),
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: width * 0.02),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.deepPurple),
                                            ),
                                            child: Text("Change",
                                                style: TextStyle(
                                                    color:
                                                        Colors.deepPurple)),
                                          ),
                                        )
                            
                          : Builder(
                              builder: (context) {
                                final addr = addresses.last;
                                final index = addresses.length - 1;
                                return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(width * 0.04),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      /// NAME
                                      Text(
                                        addr.fullName,
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      SizedBox(height: width * 0.02),

                                      /// ADDRESS
                                      Text(
                                        "${addr.house}, ${addr.road}, ${addr.city}\n${addr.state} - ${addr.pincode}",
                                        style: TextStyle(
                                          fontSize: width * 0.035,
                                        ),
                                      ),

                                      SizedBox(height: width * 0.02),

                                      /// PHONE
                                      Text(
                                        addr.phone,
                                        style: TextStyle(
                                          fontSize: width * 0.038,
                                        ),
                                      ),

                                      SizedBox(height: width * 0.03),

                                      Row(
                                        children: [
                                          if (addr.altPhone.isEmpty || addr.landmark.isEmpty)
                                            Expanded(
                                              child: Text(
                                                "Address details insufficient.",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: width * 0.032,
                                                ),
                                              ),
                                            )
                                          else
                                            const Spacer(),

                                          /// EDIT
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AddDeliveryAddess(
                                                    initialAddress: addr,
                                                    index: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.03,
                                                vertical: width * 0.015,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade400),
                                              ),
                                              child: Text("Edit",
                                                  style: TextStyle(
                                                      color: Colors.blue)),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: width * 0.03),

                                      /// CHANGE BUTTON
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddDeliveryAddess()),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              vertical: width * 0.02),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurple),
                                          ),
                                          child: Text("Change",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurple)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                             Container(
              height: 5,
              width: double.infinity,
              color: const Color.fromARGB(157, 134, 134, 134),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: height * 0.02,
                top: height * 0.01,
                end: height * 0.02,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product['title'],
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          SizedBox(height: height * 0.05),

                          Row(
                            children: [
                              Text(
                                "${widget.product['discount']}% off",
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),

                              SizedBox(width: width * 0.01),

                              Text(
                                "₹${totalOldPrice}",
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),

                              SizedBox(width: width * 0.01),

                              Text(
                                "₹${widget.product['price']}",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "1 coupan applied • 6 offer available",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "Delivery by ${calculateDeliveryDate(widget.product['deliveryTime'] ?? "2-4 days")}",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 105, 105, 105),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: width * 0.03),

                    Column(
                      children: [
                        Image.asset(
                          widget.product['image'],
                          height: height * 0.1,
                        ),

                        SizedBox(height: height * 0.01),

                        Container(
                          height: width * 0.08,
                          width: width * 0.22,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(width * 0.02),
                            color: Colors.white,
                          ),
                          child: DropdownButton<int>(
                            dropdownColor: Colors.white,
                            value: selectedQty,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: width * 0.06,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedQty = value!;
                              });
                            },
                            items: List.generate(stock, (index) {
                              int qty = index + 1;
                              return DropdownMenuItem<int>(
                                value: qty,
                                child: Text(
                                  "Qty: $qty",
                                  style: TextStyle(fontSize: width * 0.03),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.description, color: Colors.grey),
                    SizedBox(width: width * 0.025),
                    Text("Invoice", style: TextStyle(fontSize: width * 0.04)),
                    Spacer(),
                    Text(
                      "Add Email",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: const Color(0xFF543CEA),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 4,
              width: double.infinity,
              color: const Color.fromARGB(157, 182, 182, 182),
            ),
            Container(
              height: 4,
              width: double.infinity,
              color: const Color.fromARGB(157, 182, 182, 182),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price Details",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Price ($selectedQty item${selectedQty > 1 ? 's' : ''})",
                          style: TextStyle(
                            fontSize: width * 0.037,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: width * 0.005),
                        Icon(
                          Icons.info_outline,
                          color: Colors.blueGrey,
                          size: width * 0.04,
                        ),
                        Spacer(),
                        Text(
                          "₹${totalOldPrice}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.008),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: width * 0.037,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        Spacer(),
                        Text(
                          "- ₹$dicountprice",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Coupan for you",
                          style: TextStyle(
                            fontSize: width * 0.037,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: width * 0.005),
                        Icon(
                          Icons.info_outline,
                          color: Colors.blueGrey,
                          size: width * 0.04,
                        ),
                        Spacer(),
                        Text(
                          "- ₹$couponDiscount",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: 0.8,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Customer Price",
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Spacer(),
                        Text(
                          "₹$finalprice",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: 0.8,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "You Will  save ₹$discountAmount on this order",
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ), 
            Container(
                      height: 0.8,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
            Container(
                      height: 20,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 211, 211, 211),
                    ),
                    Image.asset("assets/super_coin.jpeg"),
            Container(
                      height: 100,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 211, 211, 211),
                    ),
                   
          
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: 
      Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.directional(
                  start: width * 0.04,
                  end: width * 0.03,
                  top: width * 0.02,
                  bottom: width * 0.01,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                                "₹${totalOldPrice}",
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  color: const Color.fromARGB(255, 92, 92, 92),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                                Text(
                          "₹$finalprice",
                          style: TextStyle(
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                         Text(
                      "View price details",
                      style: TextStyle(
                        fontSize: width * 0.032,
                        color: const Color(0xFF543CEA),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                               

                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: isAddressSufficient
                          ? () {
                              int oldPrice = int.tryParse(
                                      widget.product['oldPrice'].toString()) ??
                                  0;
                              int discount = int.tryParse(
                                      widget.product['discount'].toString()) ??
                                  0;
                              int totalOldPrice = oldPrice * selectedQty;
                              int discountAmount =
                                  ((oldPrice * discount) ~/ 100) * selectedQty;
                              int couponDiscount = 26 * selectedQty;
                              int finalprice = totalOldPrice - discountAmount - couponDiscount;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                    product: widget.product,
                                    finalPrice: finalprice,
                                    oldPrice: oldPrice,
                                    discountAmount: discountAmount,
                                    selectedQty: selectedQty,
                                  ),
                                ),
                              );
                            }
                          : null,
                      child: Container(
                        height: height * 0.045,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: isAddressSufficient
                              ? const Color(0xFF543CEA)
                              : Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
                ))
      )
      ],
      )
  ) ],
      ) );
  }
}
