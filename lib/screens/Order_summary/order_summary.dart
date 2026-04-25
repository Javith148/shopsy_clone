import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      
                      Icon(
                        Icons.check_circle_outline,
                        color: const Color(0xFF543CEA),size: height *0.035,
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
                     
                      Text("\t Order summary \t",style: TextStyle(fontWeight: FontWeight.w500),),
                     
                      Text("Payment")
                    ]),
                    SizedBox(height: height*0.02,),
                     Container(
                          height: 3,
                          width: double.infinity,
                          color: const Color.fromARGB(157, 134, 134, 134),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
