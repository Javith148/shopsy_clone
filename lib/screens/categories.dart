import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  final ScrollController _rightController = ScrollController();
  final ScrollController _leftController = ScrollController();

  final List<Map<String, dynamic>> categories = [
    {"name": "Best Selling", "icon": Icons.local_fire_department_outlined},
    {"name": "Mobiles", "icon": Icons.smartphone_outlined},
    {"name": "Women's Wear", "icon": Icons.woman_outlined},
    {"name": "Beauty Products", "icon": Icons.brush_outlined},
    {"name": "Western Wear", "icon": Icons.checkroom_outlined},
    {"name": "Home", "icon": Icons.home_outlined},
    {"name": "Men's Fashion", "icon": Icons.man_2_outlined},
    {"name": "Electronics", "icon": Icons.electrical_services_outlined},
    {"name": "Appliances", "icon": Icons.kitchen_outlined},
    {"name": "Women's Footwear", "icon": Icons.shopping_bag_outlined},
    {"name": "Toys & Stationery", "icon": Icons.toys_outlined},
    {"name": "Men's Footwear", "icon": Icons.hiking_outlined},
    {"name": "Women's Accessories", "icon": Icons.watch_outlined},
    {"name": "Men's Accessories", "icon": Icons.watch_outlined},
    {"name": "Kids Corner", "icon": Icons.child_care_outlined},
  ];

  final Map<String, List<Map<String, String>>> products = {
    "Best Selling": [
      {"image": "assets/mens.jpg", "title": "Top Deals"},
      {"image": "assets/shoe.png", "title": "Trending"},
    ],
    "Mobiles": [
      {"image": "assets/watch.jpg", "title": "Smart Devices"},
    ],
    "Women's Wear": [
      {"image": "assets/womans.png", "title": "Tops"},
      {"image": "assets/saree.jpg", "title": "Sarees"},
    ],
    "Beauty Products": [
      {"image": "assets/jewelry.jpg", "title": "Beauty Kit"},
    ],
    "Western Wear": [
      {"image": "assets/trend.jpg", "title": "Western"},
    ],
    "Home": [
      {"image": "assets/kitchen.jpg", "title": "Home Items"},
    ],
    "Men's Fashion": [
      {"image": "assets/mens.jpg", "title": "Shirts"},
    ],
    "Electronics": [
      {"image": "assets/watch.jpg", "title": "Electronics"},
    ],
    "Appliances": [
      {"image": "assets/oil.jpg", "title": "Appliances"},
    ],
    "Women's Footwear": [
      {"image": "assets/shoe.png", "title": "Sandals"},
    ],
    "Toys & Stationery": [
      {"image": "assets/toys.jpg", "title": "Toys"},
    ],
    "Men's Footwear": [
      {"image": "assets/casual_shoe.jpg", "title": "Shoes"},
    ],
    "Women's Accessories": [
      {"image": "assets/jewelry.jpg", "title": "Accessories"},
    ],
    "Men's Accessories": [
      {"image": "assets/watch.jpg", "title": "Watches"},
    ],
    "Kids Corner": [
      {"image": "assets/baby_dress.jpg", "title": "Kids Set"},
    ],
  };

  void scrollToCategory(int index) {
    _rightController.animateTo(
      index * 260,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    _leftController.animateTo(
      index * 75,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 45,
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontSize: width * 0.04),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),

      body: Row(
        children: [

          /// LEFT SIDE
          Container(
            width: width * 0.22,
            color: Colors.grey[100],
            child: ListView.builder(
              controller: _leftController,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;

                return InkWell(
                  onTap: () {
                    setState(() => selectedIndex = index);
                    scrollToCategory(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.grey[100],
                      border: isSelected
                          ? const Border(
                              left: BorderSide(
                                color: Color(0xFF543CEA),
                                width: 4,
                              ),
                            )
                          : null,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          categories[index]["icon"],
                          size: 26,
                          color: isSelected
                              ? const Color(0xFF543CEA)
                              : Colors.grey,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          categories[index]["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// RIGHT SIDE
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                int index = (scrollInfo.metrics.pixels / 260).floor();

                if (index != selectedIndex &&
                    index >= 0 &&
                    index < categories.length) {
                  setState(() => selectedIndex = index);

                  _leftController.animateTo(
                    index * 75,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
                return true;
              },
              child: ListView.builder(
                controller: _rightController,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final categoryName = categories[index]["name"];
                  final productList = products[categoryName] ?? [];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          categoryName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, i) {
                          final item = productList[i];

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      item["image"]!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    item["title"]!,
                                    style:
                                        const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}