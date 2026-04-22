import "package:flutter/material.dart";

class Productdetails extends StatelessWidget {
  final Map<String, String> product;

  const Productdetails({super.key, required this.product});

  Widget buildRatingStars(double rating, double size ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // full star
          return Icon(Icons.star, color: Colors.green, size: size);
        } else if (index < rating && rating % 1 != 0) {
          // half star
          return Icon(Icons.star_half, color: Colors.green, size: size);
        } else {
          // empty star
          return Icon(Icons.star, color: Colors.grey, size: size);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double rating = double.parse(product['rating'].toString());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: width * 0.02),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: width * 0.02),
        ],
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: width * 0.01),

                Row(
                  children: [
                    SizedBox(width: width * 0.02),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          product["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: width * 0.02),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['title'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${product['price'].toString()}",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "₹${product['oldPrice'].toString()}",
                                style: TextStyle(
                                  fontSize: width * 0.023,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "${product['discount'].toString()}% off",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width * 0.04),
                Stack(
                  children: [
                    Image.asset(
                      product["image"]!,
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      right: width * 0.03,
                      top: width * 0.03,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_outline),
                      ),
                    ),
                    Positioned(
                      right: width * 0.03,
                      top: width * 0.15,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: width * 0.05,
                    top: width * 0.05,
                  ),
                  child: Text(
                    product['title'].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: width * 0.035),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: width * 0.05,
                    top: width * 0.03,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${product['discount'].toString()}% off",
                        style: TextStyle(
                          fontSize: width * 0.025,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),

                      SizedBox(width: width * 0.01),
                      Text(
                        "₹${product['oldPrice'].toString()}",
                        style: TextStyle(
                          fontSize: width * 0.02,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        "₹${product['price'].toString()}",
                        style: TextStyle(
                          fontSize: width * 0.025,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: width * 0.04,
                    top: width * 0.015,
                  ),
                  child: Row(
                    children: [
                      buildRatingStars(rating, width * 0.04),
                      SizedBox(width: 6),
                      Text(
                        "${rating.toString()} rating & ${product['reviews'].toString()} reviews",
                        style: TextStyle(
                          fontSize: width * 0.025,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: width * 0.04,
                    top: width * 0.015,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: Text("!",style: TextStyle(fontSize: width *0.02,fontWeight: FontWeight.w600 ,color: Colors.white),),
                      ),
                      SizedBox(width: width*0.02,),
                      Text(" Seller changed. Checked for any changes in pricing and related information",style: TextStyle(fontSize: width *0.023,)),
                    ]))

              ],
            ),
          ),
        ],
      ),
    );
  }
}
