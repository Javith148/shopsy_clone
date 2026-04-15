import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> categories = [
    {"name": "School", "image": "assets/back_to_school.jpg"},
    {"name": "Women", "image": "assets/womans.png"},
    {"name": "Mens", "image": "assets/mens.jpg"},
    {"name": "Kitchen", "image": "assets/kitchen.jpg"},
    {"name": "Toys", "image": "assets/toys.jpg"},
    {"name": "Shoes", "image": "assets/shoe.png"},
    {"name": "Accessories", "image": "assets/accessories.png"},
    {"name": "Jewelry", "image": "assets/jewelry.jpg"},
    {"name": "Western", "image": "assets/westen.jpg"},
    {"name": "Saree", "image": "assets/saree.jpg"},
    {"name": "Trending", "image": "assets/trend.jpg"},
    {"name": "Deals", "image": "assets/deal.jpg"},
  ];

  final List<Map<String, String>> products = [
    {"name": "Kitchen Bestseller", "image": "assets/oil.jpg", "price": "49"},
    {
      "name": "Kids Combo Sets",
      "image": "assets/baby_dress.jpg",
      "price": "49",
    },
    {"name": "Men's Shirts", "image": "assets/mens.jpg", "price": "109"},
    {"name": "Ayurvedic Juices", "image": "assets/juice.jpg", "price": "199"},
    {"name": "Wrist Watch", "image": "assets/watch.jpg", "price": "65"},
    {"name": "Daily Wear Saree", "image": "assets/saree.jpg", "price": "199"},
    {"name": "Lunch Box", "image": "assets/lunch_box.jpg", "price": "199"},
    {"name": "Cleaning", "image": "assets/dryers.jpg", "price": "79"},
    {"name": "Bedsheets", "image": "assets/bedsheet.jpg", "price": "129"},
  ];


  final List<Map<String, String>> brandproducts = [
  {
    "brand": "SuryaViva",
    "name": "Gas Stoves",
    "image": "assets/stove.jpg",
    "price": "699"
  },
  {
    "brand": "Urban Carrier",
    "name": "Suitcases & Bags",
    "image": "assets/suitcase.jpg",
    "price": "639"
  },
  {
    "brand": "HR",
    "name": "Watches",
    "image": "assets/watch.jpg",
    "price": "84"
  },
  {
    "brand": "TRY THIS",
    "name": "Men's T-Shirts",
    "image": "assets/t_shirt.jpg",
    "price": "199"
  },
  {
    "brand": "Javiro",
    "name": "Cleaning Supplies",
    "image": "assets/download.jpg", 
    "price": "130"
  },
  {
    "brand": "Tea Valley",
    "name": "Fresh Tea",
    "image": "assets/kitchen.jpg",
    "price": "59"
  },
  {
    "brand": "Fashion",
    "name": "Women's Wear",
    "image": "assets/womans.png",
    "price": "109"
  },
  {
    "brand": "Style",
    "name": "Jewelry",
    "image": "assets/jewelry.jpg",
    "price": "179"
  },
  {
    "brand": "Puma",
    "name": "casul show",
    "image": "assets/casual_shoe.jpg",
    "price": "1790"
  },
];
final List<Map<String, String>> summmerproducts = [
  {
    "name": "Trendy Tees",
    "price": "Under ₹179",
    "image": "https://picsum.photos/200?random=1"
  },
  {
    "name": "Sunscreen",
    "price": "From ₹59",
    "image": "https://picsum.photos/200?random=2"
  },
  {
    "name": "Ice Cube Trays",
    "price": "From ₹49",
    "image": "https://picsum.photos/200?random=3"
  },
  {
    "name": "Water Bottles",
    "price": "Under ₹149",
    "image": "https://picsum.photos/200?random=4"
  },
  {
    "name": "Slippers",
    "price": "From ₹79",
    "image": "https://picsum.photos/200?random=5"
  },
  {
    "name": "Fruit Juice",
    "price": "From ₹59",
    "image": "https://picsum.photos/200?random=6"
  },
  {
    "name": "Sunglasses",
    "price": "From ₹99",
    "image": "https://picsum.photos/200?random=7"
  },
  {
    "name": "Caps",
    "price": "Under ₹129",
    "image": "https://picsum.photos/200?random=8"
  },
  {
    "name": "Backpacks",
    "price": "From ₹299",
    "image": "https://picsum.photos/200?random=9"
  },
];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: width * 0.03,
              top: height * 0.04,
              end: width * 0.03,
              bottom: height * 0.01,
            ),
            child: Container(
              height: height * 0.045,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  isDense: true,
                  border: InputBorder.none,

                  contentPadding: EdgeInsets.only(
                    left: -width * 0.02,
                    top: height * 0.01,
                    bottom: height * 0.01,
                  ),

                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.03,
                      right: width * 0.04,
                      top: height * 0.008,
                      bottom: height * 0.008,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/icon.jpg",
                        width: 18,
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: Icon(Icons.search, size: height * 0.025),
                  ),

                  prefixIconConstraints: BoxConstraints(
                    minWidth: width * 0.12,
                    minHeight: height * 0.04,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/ja.jpeg"),
                  SizedBox(height: height * 0.01),

                  SizedBox(
                    height: height * 0.14,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.03,
                            right: index == categories.length - 1
                                ? width * 0.03
                                : 0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    category["image"]!,
                                    height: height * 0.08,
                                    width: height * 0.08,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.008),
                              Text(
                                category["name"]!,
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: height * 0.12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.03,
                            right: index == categories.length - 1
                                ? width * 0.03
                                : 0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    category["image"]!,
                                    height: height * 0.08,
                                    width: height * 0.08,
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.008),
                              Text(
                                category["name"]!,
                                style: TextStyle(fontSize: width * 0.03),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Image.asset("assets/banner.jpeg"),
                  SizedBox(height: height * 0.005),
                  Image.asset("assets/budget_banner.jpeg"),

                  Container(
                    color: Color(0xFFE3F2FD), 
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.02, 
                        bottom:  height * 0.03,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),

                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: width * 0.03,
                          mainAxisSpacing: height * 0.018,
                          childAspectRatio: 0.68,
                        ),

                        itemBuilder: (context, index) {
                          final item = products[index];

                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEAF6FF),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(14),
                                        ),
                                        child: SizedBox(
                                          height: height * 0.22,
                                          width: double.infinity,
                                          child: Image.asset(
                                            item["image"]!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF00BCD4),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "From",
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              Text(
                                                "₹${item["price"]}",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                               
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: 6,
                                  ),
                                  child: Text(
                                    item["name"]!,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: width * 0.032,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                   SizedBox(height: height * 0.01),
                  Image.asset("assets/brand_banner.jpeg"),
Container(
  color: Color(0xFFFFC107), // 🔹 yellow background
  padding: EdgeInsets.all(width * 0.03),
  child: GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: width * 0.03,
      mainAxisSpacing: height * 0.015,
      childAspectRatio: 0.7,
    ),
    itemBuilder: (context, index) {
      final item = brandproducts[index];

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [

            // 🔹 Brand Name (Top)
            Padding(
              padding: EdgeInsets.only(top: height * 0.008),
              child: Text(
                item["brand"]!,
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 🔹 Image
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item["image"]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // 🔹 Title
            Text(
              item["name"]!,
              style: TextStyle(
                fontSize: width * 0.03,
              ),
            ),

            // 🔹 Price
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.008),
              child: Text(
                "From ₹${item["price"]}",
                style: TextStyle(
                  fontSize: width * 0.032,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
// ),
//  SizedBox(height: height * 0.01),
//                   Image.asset("assets/summer.jpeg"),
//                 Container(
//   color: Color(0xFF1ECAD3),
//   padding: EdgeInsets.only(
//     top: height * 0.02,     
//     bottom: height * 0.02,   
//   ),
//   child: GridView.builder(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     padding: EdgeInsets.symmetric(horizontal: width * 0.03),
//     itemCount: summmerproducts.length,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 3,
//       crossAxisSpacing: width * 0.03,
//       mainAxisSpacing: height * 0.015,
//       childAspectRatio: 0.7,
//     ),
//     itemBuilder: (context, index) {
//       final item = summmerproducts[index];

//       return Column(
//         children: [

//           // 🔹 Image
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 item["image"]!,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           SizedBox(height: height * 0.005),

//           // 🔹 Bottom Gradient Box
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(
//               vertical: height * 0.006,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.yellow,
//                   Colors.lightBlueAccent,
//                 ],
//               ),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   item["name"]!,
//                   style: TextStyle(
//                     fontSize: width * 0.03,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   item["price"]!,
//                   style: TextStyle(
//                     fontSize: width * 0.032,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     },
//   ),
)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
