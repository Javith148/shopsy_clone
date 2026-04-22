import 'package:flutter/material.dart';
import 'package:shopsy/screens/Cartegories/products.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  final ScrollController _rightController = ScrollController();
  final ScrollController _leftController = ScrollController();
  bool _isSyncing = false;

  final List<GlobalKey> keys = List.generate(15, (index) => GlobalKey());


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

 final Map<String, List<Map<String, String>>> subCategories = {
  "Best Selling": [
    {"image": "assets/mens.jpg", "title": "Top Deals", "api": "top-deals"},
    {"image": "assets/shoe.png", "title": "Trending Now", "api": "trending"},
    {"image": "assets/watch.jpg", "title": "Best Picks", "api": "best-picks"},
    {"image": "assets/womans.png", "title": "Hot Sellers", "api": "hot-sellers"},
    {"image": "assets/kitchen.jpg", "title": "Mega Deals", "api": "mega-deals"},
    {"image": "assets/jewelry.jpg", "title": "Popular", "api": "popular"},
  ],

  "Mobiles": [
    {"image": "assets/smart.jpg", "title": "Smartphones", "api": "smartphones"},
    {"image": "assets/airpods.jpg", "title": "Earbuds", "api": "earbuds"},
    {"image": "assets/watch.jpg", "title": "Smart Watch", "api": "smartwatch"},
  ],

  "Women's Wear": [
    {"image": "assets/womans.png", "title": "Tops & Tees", "api": "tops"},
    {"image": "assets/saree.jpg", "title": "Sarees", "api": "sarees"},
    {"image": "assets/westen.jpg", "title": "Kurtis", "api": "kurtis"},
    {"image": "assets/trend.jpg", "title": "Salwar Sets", "api": "salwar"},
    {"image": "assets/jewelry.jpg", "title": "Dress Material", "api": "dress-material"},
    {"image": "assets/womans.png", "title": "Leggings", "api": "leggings"},
  ],

  "Beauty Products": [
    {"image": "assets/jewelry.jpg", "title": "Skincare", "api": "skincare"},
    {"image": "assets/accessories.png", "title": "Makeup", "api": "makeup"},
    {"image": "assets/womans.png", "title": "Hair Care", "api": "haircare"},
    {"image": "assets/jewelry.jpg", "title": "Fragrance", "api": "fragrance"},
    {"image": "assets/accessories.png", "title": "Nail Art", "api": "nailart"},
    {"image": "assets/womans.png", "title": "Bath & Body", "api": "bathbody"},
  ],

  "Western Wear": [
    {"image": "assets/trend.jpg", "title": "Dresses", "api": "dresses"},
    {"image": "assets/westen.jpg", "title": "Tops", "api": "tops-western"},
    {"image": "assets/womans.png", "title": "Jeans", "api": "jeans-women"},
    {"image": "assets/trend.jpg", "title": "Skirts", "api": "skirts"},
    {"image": "assets/westen.jpg", "title": "Jumpsuits", "api": "jumpsuits"},
    {"image": "assets/womans.png", "title": "Shorts", "api": "shorts"},
  ],

  "Home": [
    {"image": "assets/kitchen.jpg", "title": "Kitchen Tools", "api": "kitchen"},
    {"image": "assets/bedsheet.jpg", "title": "Bedsheets", "api": "bedsheets"},
    {"image": "assets/dryers.jpg", "title": "Home Decor", "api": "decor"},
    {"image": "assets/lunch_box.jpg", "title": "Storage", "api": "storage"},
    {"image": "assets/oil.jpg", "title": "Cleaning", "api": "cleaning"},
    {"image": "assets/kitchen.jpg", "title": "Bathroom", "api": "bathroom"},
  ],

  "Men's Fashion": [
    {"image": "assets/mens.jpg", "title": "Shirts", "api": "mens-shirts"},
    {"image": "assets/t_shirt.jpg", "title": "T-Shirts", "api": "mens-tshirts"},
    {"image": "assets/trend.jpg", "title": "Track Pants", "api": "trackpants"},
    {"image": "assets/mens.jpg", "title": "Jeans", "api": "mens-jeans"},
    {"image": "assets/t_shirt.jpg", "title": "Kurtas", "api": "mens-kurtas"},
    {"image": "assets/mens.jpg", "title": "Innerwear", "api": "innerwear"},
  ],

  "Electronics": [
    {"image": "assets/airpods.jpg", "title": "Headphones", "api": "headphones"},
    {"image": "assets/smart.jpg", "title": "Speakers", "api": "speakers"},
    {"image": "assets/watch.jpg", "title": "Chargers", "api": "chargers"},
    {"image": "assets/airpods.jpg", "title": "Cables", "api": "cables"},
    {"image": "assets/smart.jpg", "title": "Power Banks", "api": "powerbanks"},
    {"image": "assets/watch.jpg", "title": "LED Lights", "api": "ledlights"},
  ],

  "Appliances": [
    {"image": "assets/stove.jpg", "title": "Gas Stoves", "api": "gas-stoves"},
    {"image": "assets/kitchen.jpg", "title": "Mixer Grinder", "api": "mixer"},
    {"image": "assets/dryers.jpg", "title": "Iron", "api": "iron"},
    {"image": "assets/oil.jpg", "title": "Cooker", "api": "cooker"},
    {"image": "assets/stove.jpg", "title": "Kettle", "api": "kettle"},
    {"image": "assets/kitchen.jpg", "title": "Toaster", "api": "toaster"},
  ],

  "Women's Footwear": [
    {"image": "assets/shoe.png", "title": "Sandals", "api": "sandals"},
    {"image": "assets/casual_shoe.jpg", "title": "Flats", "api": "flats"},
    {"image": "assets/shoe.png", "title": "Heels", "api": "heels"},
    {"image": "assets/casual_shoe.jpg", "title": "Sports Shoes", "api": "sports-women"},
    {"image": "assets/shoe.png", "title": "Slippers", "api": "slippers"},
    {"image": "assets/casual_shoe.jpg", "title": "Bellies", "api": "bellies"},
  ],

  "Toys & Stationery": [
    {"image": "assets/toys.jpg", "title": "Soft Toys", "api": "soft-toys"},
    {"image": "assets/back_to_school.jpg", "title": "School Bags", "api": "school-bags"},
    {"image": "assets/toys.jpg", "title": "Board Games", "api": "board-games"},
    {"image": "assets/back_to_school.jpg", "title": "Art Supplies", "api": "art"},
    {"image": "assets/toys.jpg", "title": "Action Figures", "api": "action-figures"},
    {"image": "assets/back_to_school.jpg", "title": "Notebooks", "api": "notebooks"},
  ],

  "Men's Footwear": [
    {"image": "assets/casual_shoe.jpg", "title": "Casual Shoes", "api": "casual-men"},
    {"image": "assets/shoe.png", "title": "Sports Shoes", "api": "sports-men"},
    {"image": "assets/casual_shoe.jpg", "title": "Sandals", "api": "sandals-men"},
    {"image": "assets/shoe.png", "title": "Formal Shoes", "api": "formal"},
    {"image": "assets/casual_shoe.jpg", "title": "Slippers", "api": "slippers-men"},
    {"image": "assets/shoe.png", "title": "Loafers", "api": "loafers"},
  ],

  "Women's Accessories": [
    {"image": "assets/jewelry.jpg", "title": "Earrings", "api": "earrings"},
    {"image": "assets/watch.jpg", "title": "Watches", "api": "watches-women"},
    {"image": "assets/accessories.png", "title": "Handbags", "api": "handbags"},
    {"image": "assets/jewelry.jpg", "title": "Bangles", "api": "bangles"},
    {"image": "assets/watch.jpg", "title": "Sunglasses", "api": "sunglasses"},
    {"image": "assets/accessories.png", "title": "Hair Clips", "api": "hairclips"},
  ],

  "Men's Accessories": [
    {"image": "assets/watch.jpg", "title": "Watches", "api": "watches-men"},
    {"image": "assets/suitcase.jpg", "title": "Wallets", "api": "wallets"},
    {"image": "assets/accessories.png", "title": "Belts", "api": "belts"},
    {"image": "assets/watch.jpg", "title": "Sunglasses", "api": "sunglasses-men"},
    {"image": "assets/suitcase.jpg", "title": "Bags", "api": "bags"},
    {"image": "assets/accessories.png", "title": "Caps", "api": "caps"},
  ],

  "Kids Corner": [
    {"image": "assets/baby_dress.jpg", "title": "Boys Wear", "api": "boys"},
    {"image": "assets/toys.jpg", "title": "Girls Wear", "api": "girls"},
    {"image": "assets/baby_dress.jpg", "title": "Infant Wear", "api": "infant"},
    {"image": "assets/back_to_school.jpg", "title": "School Combos", "api": "school-combo"},
    {"image": "assets/toys.jpg", "title": "Toys", "api": "kids-toys"},
    {"image": "assets/baby_dress.jpg", "title": "Kids Shoes", "api": "kids-shoes"},
  ],
};

  @override
  void initState() {
    super.initState();
    _rightController.addListener(_onRightScroll);
  }

  @override
  void dispose() {
    _rightController.removeListener(_onRightScroll);
    _rightController.dispose();
    _leftController.dispose();
    super.dispose();
  }

  void _onRightScroll() {
    if (_isSyncing) return;

    for (int i = keys.length - 1; i >= 0; i--) {
      final ctx = keys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(Offset.zero).dy;
        if (pos <= 180) {
          if (selectedIndex != i) {
            setState(() => selectedIndex = i);
            _scrollLeftTo(i);
          }
          break;
        }
      }
    }
  }

  void _scrollLeftTo(int index) {
    if (!_leftController.hasClients) return;
    final target = index * 82.0;
    final maxScroll = _leftController.position.maxScrollExtent;
    _leftController.animateTo(
      target.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  
  void scrollToCategory(int index) {
    _isSyncing = true;
    setState(() => selectedIndex = index);

    final ctx = keys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.0,
      ).then((_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _isSyncing = false;
        });
      });
    } else {
      _isSyncing = false;
    }

    _scrollLeftTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const Color primaryColor = Color(0xFF543CEA);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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

      body: Column(
        children: [
         
        
          Expanded(
            child: Row(
              children: [
             
                Container(
                  width: width * 0.21,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey.shade200,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: ListView.builder(
                    controller: _leftController,
                    padding: EdgeInsets.zero,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () => scrollToCategory(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFF5F5F5),
                            border: Border(
                              left: BorderSide(
                                color: isSelected
                                    ? primaryColor
                                    : Colors.transparent,
                                width: 3.5,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Icon(
                                  categories[index]["icon"],
                                  size: 22,
                                  color: isSelected
                                      ? primaryColor
                                      : Colors.grey[600],
                                ),
                              
                              const SizedBox(height: 6),
                              Text(
                                categories[index]["name"],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  height: 1.2,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

               
                Expanded(
                  child: SingleChildScrollView(
                    controller: _rightController,
                    child: Column(
                      children: List.generate(categories.length, (index) {
                        final categoryName =
                            categories[index]["name"] as String;
                        final items = subCategories[categoryName] ?? [];

                        return Container(
                          key: keys[index],
                          margin: const EdgeInsets.only(bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        categoryName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF212121),
                                        ),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),

                              
                              Container(
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 4, 10, 14),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: items.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.78,
                                  ),
                                  itemBuilder: (context, i) {
                                    final item = items[i];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Products()));
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    const Color(0xFFF9F9FB),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      Colors.grey.shade200,
                                                  width: 0.8,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  item["image"]!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            item["title"]!,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                             
                             
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}