import 'package:flutter/material.dart';
import 'package:shopsy/screens/Order_summary/add_addess.dart';

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
    int discountAmount = (oldPrice * discount) ~/ 100;
    int dicountprice = oldPrice - discountAmount;

    int finalprice = discountAmount - 26;
   

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

      Expanded(child: 
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
            SizedBox(height: height * 0.02),
            Container(
      width: double.infinity,
      
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          
          Text(
            "Riyaz",
            style: TextStyle(
              fontSize: width * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: width * 0.02),

          
          Text(
            "Mathigiri hosur, mathigiri bus stand\nHOSUR - 635109",
            style: TextStyle(
              fontSize: width * 0.035,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: width * 0.02),

          
          Text(
            "9677987432",
            style: TextStyle(
              fontSize: width * 0.038,
            ),
          ),

          SizedBox(height: width * 0.03),

         
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Address details insufficient to attempt delivery. Please add more details.",
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: Colors.red,
                     fontWeight: FontWeight.w600
                  ),
                ),
              ),

              SizedBox(width: width * 0.02),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.035,
                  vertical: width * 0.015,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Text(
                  "Edit details",
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: width * 0.04),

         GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeliveryAddess()));
          },
          child: 
          Container(
            width: double.infinity,
            
            padding: EdgeInsets.symmetric(vertical: width * 0.015),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
            ),
            child: Text(
              "Change",
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.deepPurple,
                 fontWeight: FontWeight.w600
              ),
            ),
          ),),
        ],
      ),
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
                    // 🔥 LEFT SIDE (TEXT)
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
                                "₹${widget.product['oldPrice']}",
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
                          "Price (1 item)",
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
                          "₹${widget.product['oldPrice']}",
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
                          "- ₹26",
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
                                "₹${widget.product['oldPrice'].toString()}",
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
                    Container(
                      height: height *0.045,
                      width: width *0.4,
                      color: Colors.grey[700],
                      child: Center(
                        child: Text("Continue",style: TextStyle(
                        fontSize: width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),)
                        ,),)
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
