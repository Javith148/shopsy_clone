import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

   final PageController _controller = PageController(viewportFraction: 0.4);

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
  
  final List<Map<String, String>> lootproduct = [
    {"name": "Kitchen", "image": "assets/kitchen.jpg"},
    {"name": "Toys", "image": "assets/toys.jpg"},
    {"name": "Shoes", "image": "assets/shoe.png"},
    {"name": "Accessories", "image": "assets/accessories.png"},
    {"name": "Jewelry", "image": "assets/jewelry.jpg"},
    {"name": "Western", "image": "assets/westen.jpg"},
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
      "price": "699",
    },
    {
      "brand": "Urban Carrier",
      "name": "Suitcases & Bags",
      "image": "assets/suitcase.jpg",
      "price": "639",
    },
    {
      "brand": "HR",
      "name": "Watches",
      "image": "assets/watch.jpg",
      "price": "84",
    },
    {
      "brand": "TRY THIS",
      "name": "Men's T-Shirts",
      "image": "assets/t_shirt.jpg",
      "price": "199",
    },
    {
      "brand": "Javiro",
      "name": "Cleaning Supplies",
      "image": "assets/download.jpg",
      "price": "130",
    },
    {
      "brand": "Tea Valley",
      "name": "Fresh Tea",
      "image": "assets/kitchen.jpg",
      "price": "59",
    },
    {
      "brand": "Fashion",
      "name": "Women's Wear",
      "image": "assets/womans.png",
      "price": "109",
    },
    {
      "brand": "Style",
      "name": "Jewelry",
      "image": "assets/jewelry.jpg",
      "price": "179",
    },
    {
      "brand": "Puma",
      "name": "casul show",
      "image": "assets/casual_shoe.jpg",
      "price": "1790",
    },
  ];
 
  final List<Map<String, String>> summmerproducts = [
    {"image": "assets/dryers.jpg", "name": "Lights", "price": "₹79"},
    {"image": "assets/baby_dress.jpg", "name": "Kids Set", "price": "₹49"},
    {"image": "assets/trend.jpg", "name": "Trackpants", "price": "₹99"},
    {"image": "assets/mens.jpg", "name": "Kurta", "price": "₹149"},
    {"image": "assets/womans.png", "name": "Tops", "price": "₹249"},
    {"image": "assets/t_shirt.jpg", "name": "T-Shirts", "price": "₹199"},
  ];

  List items = [
    {"image": "assets/mens.jpg", "title": "Bottomwear", "price": "₹199"},
    {"image": "assets/shoe.png", "title": "Sandals", "price": "₹129"},
    {
      "image": "assets/back_to_school.jpg",
      "title": "School Bags",
      "price": "₹129",
    },
    {"image": "assets/oil.jpg", "title": "Refills", "price": "₹79"},
    {"image": "assets/saree.jpg", "title": "Salwars", "price": "₹199"},
    {"image": "assets/watch.jpg", "title": "Clocks", "price": "₹129"},
    {"image": "assets/kitchen.jpg", "title": "Garden", "price": "₹49"},
    {"image": "assets/jewelry.jpg", "title": "Watches", "price": "₹99"},
    {"image": "assets/deal.jpg", "title": "Soaps", "price": "₹79"},
    {"image": "assets/casual_shoe.jpg", "title": "Kids Shoes", "price": "₹99"},
    {"image": "assets/dryers.jpg", "title": "Lights", "price": "₹79"},
    {"image": "assets/baby_dress.jpg", "title": "Kids Set", "price": "₹49"},
    {"image": "assets/trend.jpg", "title": "Trackpants", "price": "₹99"},
    {"image": "assets/mens.jpg", "title": "Kurta", "price": "₹149"},
    {"image": "assets/womans.png", "title": "Tops", "price": "₹249"},
    {"image": "assets/t_shirt.jpg", "title": "T-Shirts", "price": "₹199"},
  ];

  final List<Map<String, String>> spl_items = [
    {"image": "assets/mens.jpg", "title": "Bottomwear"},
    {"image": "assets/shoe.png", "title": "Sandals"},
    {"image": "assets/back_to_school.jpg", "title": "School Bags"},
    {"image": "assets/oil.jpg", "title": "Refills"},
    {"image": "assets/saree.jpg", "title": "Salwars"},
    {"image": "assets/watch.jpg", "title": "Clocks"},
  ];

  final List<Map<String, String>> mega_items = [
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

  final List<Map<String, String>> mainproducts = [
    {
      "image": "assets/mens.jpg",
      "title": "shirt",
      "price": "₹199",
      "oldPrice": "₹399",
      "discount": "50% off",
      "rating": "3.8",
    },
    {
      "image": "assets/shoe.png",
      "title": "Sandals",
      "price": "₹129",
      "oldPrice": "₹299",
      "discount": "60% off",
      "rating": "3.6",
    },
    {
      "image": "assets/back_to_school.jpg",
      "title": "School Bags",
      "price": "₹231",
      "oldPrice": "₹799",
      "discount": "71% off",
      "rating": "3.9",
    },
    {
      "image": "assets/oil.jpg",
      "title": "Refills",
      "price": "₹79",
      "oldPrice": "₹199",
      "discount": "60% off",
      "rating": "3.7",
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: height * 0.11,
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

                  Image.asset("assets/banner.jpeg"),
                  SizedBox(height: height * 0.005),
                  //loot section
                  Image.asset("assets/loot.jpeg"),
                  Container(
                    color: Color.fromARGB(255, 250, 220, 129),
                    padding: EdgeInsets.all(width * 0.03),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: lootproduct.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: width * 0.03,
                        mainAxisSpacing: height * 0.015,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final item = lootproduct[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset(
                                    item["image"]!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              Text(
                                item["name"]!,
                                style: TextStyle(fontSize: width * 0.04),
                              ),
                              SizedBox(height: height * 0.01),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Image.asset("assets/loot_bottom.jpeg"),
                  //budget section
                  SizedBox(height: height * 0.01),
                  Image.asset("assets/budget_banner.jpeg"),
                  Container(
                    color: Color(0xFF00DBF7),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.02,
                        bottom: height * 0.03,
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
                  //pomotion section
                  SizedBox(height: height * 0.01),
                  Image.asset("assets/promotion.jpeg"),
                  SizedBox(height: height * 0.01),
                  // summer sale section
                  Image.asset("assets/summer.jpeg"),
                  Container(
                    color: Color(0xFF00DBF7),
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      bottom: height * 0.02,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      itemCount: summmerproducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: width * 0.03,
                        mainAxisSpacing: height * 0.015,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final item = summmerproducts[index];

                        return Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item["image"]!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(height: height * 0.005),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.006,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    item["name"]!,
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    item["price"]!,
                                    style: TextStyle(
                                      fontSize: width * 0.032,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  // brand sale section
                  Image.asset("assets/brand_banner.jpeg"),
                  Container(
                    color: Color(0xFFFFCC22),
                    padding: EdgeInsets.all(width * 0.03),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: brandproducts.length,
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

                              Text(
                                item["name"]!,
                                style: TextStyle(fontSize: width * 0.03),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: height * 0.008,
                                ),
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
                  ),
                  SizedBox(height: height * 0.01),
                  // lowest price section
                  Image.asset("assets/lowest_price.jpeg"),
                  Container(
                    color: Color(0xFFFFCC22),

                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFBEE9F7),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Image.asset(
                                          item['image'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item['title'],
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          item['price'],
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  //  spl momment slider
                  Image.asset("assets/spl_moments.jpeg"),
                  SizedBox(
                    height: height * 0.2,
                    child: PageView.builder(
                      padEnds: false,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        final item = spl_items[index % spl_items.length];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00DBF7), Color(0xFFFFCC22)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    item["image"]!,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: height * 0.015),
                                Text(
                                  item["title"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  // mega value slider
                  Image.asset("assets/mega.jpeg"),
                  Container(
                    color: Color(0xFF00DBF7),
                    height: height * 0.23,
                    child: PageView.builder(
                      padEnds: false,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        final item = mega_items[index % mega_items.length];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item["image"]!,
                                height: 120,
                                fit: BoxFit.contain,
                              ),

                              SizedBox(height: height * 0.015),
                              Text(
                                item["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: height * 0.008,
                                ),
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
                  ),
                  SizedBox(height: height * 0.01),
                  // small price zoon
                  Image.asset("assets/zone.jpeg"),
                  Container(
                    color: Color(0xFFFCF7E3),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.01),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                        SizedBox(
                          height: height * 0.07,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/29.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }

                              final item = categories[index - 1];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: height * 0.06,
                                  height: height * 0.05,

                                  decoration: BoxDecoration(color: Colors.red),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["image"]!,
                                        height: height * 0.05,
                                        fit: BoxFit.contain,
                                      ),

                                      Flexible(
                                        child: Text(
                                          item["name"]!,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          height: height * 0.07,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/49.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }

                              final item = categories[index - 1];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: height * 0.06,
                                  height: height * 0.05,

                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["image"]!,
                                        height: height * 0.05,
                                        fit: BoxFit.contain,
                                      ),

                                      Flexible(
                                        child: Text(
                                          item["name"]!,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          height: height * 0.07,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/29.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }

                              final item = categories[index - 1];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: height * 0.06,
                                  height: height * 0.05,

                                  decoration: BoxDecoration(color: Colors.red),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["image"]!,
                                        height: height * 0.05,
                                        fit: BoxFit.contain,
                                      ),

                                      Flexible(
                                        child: Text(
                                          item["name"]!,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          height: height * 0.07,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/49.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }

                              final item = categories[index - 1];

                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: height * 0.06,
                                  height: height * 0.05,

                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["image"]!,
                                        height: height * 0.05,
                                        fit: BoxFit.contain,
                                      ),

                                      Flexible(
                                        child: Text(
                                          item["name"]!,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // all products
                  Padding(
                    padding: EdgeInsetsGeometry.directional(
                      start: height * 0.02,
                    ),
                    child: Text(
                      "Product For You",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(width * 0.03),
                    itemCount: mainproducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: width * 0.03,
                      mainAxisSpacing: height * 0.015,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final item = mainproducts[index];

                      return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      item["image"]!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 16,
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            item["rating"]!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.green,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text(
                                    item["title"]!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Row(
                                    children: [
                                      Text(
                                        item["discount"]!,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: width * 0.032,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        item["oldPrice"]!,
                                          style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        item["price"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.035,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
