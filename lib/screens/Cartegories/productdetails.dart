import "package:flutter/material.dart";
import "package:shopsy/screens/Cartegories/products.dart";
import "package:shopsy/screens/Order_summary/order_summary.dart";

class Productdetails extends StatefulWidget {
  final Map<String, dynamic> product;

  const Productdetails({super.key, required this.product});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  late bool showAllDetails = false;
  double userRating = 0;

  Widget buildRatingStars(double rating, double size) {
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

  Widget _buildRatingBar(int stars, int count, double width) {
    return Row(
      children: [
        Text(
          "$stars ★",
          style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: width * 0.02),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: count / 100,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
        ),
        SizedBox(width: width * 0.02),
        SizedBox(
          width: width * 0.08,
          child: Text(
            count.toString(),
            style: TextStyle(
              fontSize: width * 0.03,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double rating = double.parse(widget.product['rating'].toString());

    final details = widget.product['product_details'] as Map<String, dynamic>;

    final entriesList = details.entries.toList();

    final visibleItems = showAllDetails
        ? entriesList
        : entriesList.take(5).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: height * 0.03),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width * 0.01),

                        SizedBox(height: width * 0.04),
                        Stack(
                          children: [
                            Image.asset(
                              widget.product["image"]!,
                              width: double.infinity,
                              height: 450,
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
                            widget.product['title'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: width * 0.04),
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
                                "${widget.product['discount'].toString()}% off",
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),

                              SizedBox(width: width * 0.01),
                              Text(
                                "₹${widget.product['oldPrice'].toString()}",
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "₹${widget.product['price'].toString()}",
                                style: TextStyle(
                                  fontSize: width * 0.04,
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
                              buildRatingStars(rating, width * 0.045),
                              SizedBox(width: 6),
                              Text(
                                "${rating.toString()} rating & ${widget.product['reviews'].toString()} reviews",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: width * 0.02,
                            top: width * 0.015,
                            end: width * 0.04,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(width * 0.025),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(width * 0.015),
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: width * 0.04,
                                  ),
                                ),

                                SizedBox(width: width * 0.025),

                                Expanded(
                                  child: Text(
                                    "Seller changed. Check for any updates in pricing and related information.",
                                    style: TextStyle(
                                      fontSize: width * 0.032,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: const Color.fromARGB(144, 221, 220, 220),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.directional(
                            start: width * 0.04,
                            top: height * 0.02,
                            end: width * 0.04,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.confirmation_number,
                                color: Colors.green,
                                size: width * 0.06,
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "Available offers",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "view more",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: const Color(0xFF543CEA),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.directional(
                            start: width * 0.04,
                            top: height * 0.02,
                            end: width * 0.04,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "NA",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "Know More",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF543CEA),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.0155),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: const Color.fromARGB(157, 221, 221, 221),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.grid_view,
                              size: height * 0.02,
                              color: const Color(0xFF543CEA),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              "View Similar",
                              style: TextStyle(color: const Color(0xFF543CEA)),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: const Color.fromARGB(157, 221, 221, 221),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width * 0.04,
                        end: width * 0.04,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Find a seller that delivers to you",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Enter pincode",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF543CEA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width * 0.04,
                        end: width * 0.04,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.fire_truck_outlined, size: height * 0.025),
                          SizedBox(width: width * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery by ${calculateDeliveryDate(widget.product['deliveryTime'] ?? "2-4 days")}",
                              ),
                              Text(
                                "if ordered within 58m 08s",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    124,
                                    124,
                                    124,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),

                          Icon(Icons.arrow_forward_ios, size: height * 0.018),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width * 0.04,
                        end: width * 0.04,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.swap_horizontal_circle,
                            size: height * 0.025,
                            color: Colors.blue,
                          ),
                          SizedBox(width: width * 0.05),
                          Text("7 days Replacement Policy"),
                          Spacer(),

                          Icon(Icons.arrow_forward_ios, size: height * 0.018),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width * 0.04,
                        end: width * 0.04,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.payments,
                            size: height * 0.025,
                            color: Colors.green,
                          ),
                          SizedBox(width: width * 0.05),
                          Text("Cash on Delivery Available"),
                          Spacer(),

                          Icon(Icons.arrow_forward_ios, size: height * 0.018),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: width * 0.04,
                        end: width * 0.04,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: height * 0.025,
                          ),
                          SizedBox(width: width * 0.05),
                          Text("Cancellation upto 48hrs"),
                          Spacer(),

                          Icon(Icons.arrow_forward_ios, size: height * 0.018),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          child: Text(
                            "Product Details",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        ...visibleItems.map<Widget>((entry) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    entry.key.toString(),
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    entry.value.toString(),
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),

                        SizedBox(height: height * 0.01),

                        if (entriesList.length > 5)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAllDetails = !showAllDetails;
                                });
                              },
                              child: Text(
                                showAllDetails ? "Read Less" : "Read More",
                                style: TextStyle(
                                  color: const Color(0xFF543CEA),
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                        SizedBox(height: height * 0.02),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(
                            start: width * 0.04,
                            end: width * 0.04,
                          ),
                          child: Text(
                            "Details",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Padding(
                          padding: EdgeInsetsGeometry.directional(
                            start: width * 0.04,
                            end: width * 0.04,
                          ),
                          child: Text(
                            widget.product['description'],
                            style: TextStyle(fontSize: width * 0.035),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ratings & Reviews",
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Rate Product",
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: const Color(0xFF543CEA),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.025),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      rating.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    buildRatingStars(rating, width * 0.045),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      "${widget.product['reviews']} reviews",
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: width * 0.05),

                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    _buildRatingBar(5, 71, width),
                                    SizedBox(height: height * 0.008),
                                    _buildRatingBar(4, 15, width),
                                    SizedBox(height: height * 0.008),
                                    _buildRatingBar(3, 18, width),
                                    SizedBox(height: height * 0.008),
                                    _buildRatingBar(2, 9, width),
                                    SizedBox(height: height * 0.008),
                                    _buildRatingBar(1, 22, width),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.08,)
                  ],
                ),
              ),
            ),
          ),
             Container(
              height: height * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child:Padding(padding: EdgeInsetsGeometry.directional(bottom: height*0.01,top: height*0.04),child: 
               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
               
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),

                  Expanded(
                    child: Container(
                      height: height * 0.04,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          isDense: true,
                          border: InputBorder.none,

                          prefixIcon: Icon(Icons.search, size: 20),
                          prefixIconConstraints: BoxConstraints(minWidth: 35),

                          contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.008,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015),
                  Icon(Icons.favorite_outline, size: height * 0.025),
                  SizedBox(width: width * 0.015),
                  Icon(Icons.shopping_cart_outlined, size: height * 0.025),
                  SizedBox(width: width * 0.015),
                ],
              ),
            ),
          ),
        Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.07,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          children: [

         
            Expanded(
              child: Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: const Color(0xFF543CEA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: width * 0.03),

           
            Expanded(
              child:  GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSummary(product: widget.product)));
            },
            child: Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: const Color(0xFF543CEA),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),)
          ],
        ),
      ),
    ),

        ],
      ),
    );
  }
}
