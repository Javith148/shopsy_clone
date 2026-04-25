import "package:flutter/material.dart";
import "package:shopsy/screens/Cartegories/productdetails.dart";

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 
  final List<Map<String, dynamic>> mainproducts = [
    {
      "id": "1",
      "image": "assets/mens.jpg",
      "title": "Cotton Casual Shirt",
      "brand": "Levis",
      "category": "Clothing",

      "price": "199",
      "oldPrice": "399",
      "discount": "50",

      "rating": "3.8",
      "reviews": "120",

      "description":
          "Premium cotton casual shirt with breathable fabric. Perfect for daily wear and office use. Slim fit design with durable stitching.",

      "stock": "10",

      "delivery": "Free Delivery",

      "deliveryTime": "3-5 days",

      "product_details": {
        "Pack of": "1",
        "Sales package": "1pc shirt",
        "Size": "XXL",
        "Style code": "Ch-1-checks-grey",
        "Color": "Teal blue",
        "Fabric": "Cotton blend",
        "Pattern": "Checkered",
        "Ideal for": "Men",
        "Occasion": "Casual",
        "Sleeve": "Full sleeve",
        "Collar": "Spread",
        "Hem": "Curved",
        "Suitable for": "Western wear",
        "Reversible": "No",
        "Fabric care": "Dry in shade",
        "Pattern/print type": "Checkered",
        "Net quantity": "1",
      },
    },
    {
      "id": "2",
      "image": "assets/shoe.png",
      "title": "Men Sandals",
      "brand": "Bata",
      "category": "Footwear",

      "price": "129",
      "oldPrice": "299",
      "discount": "60",

      "rating": "3.6",
      "reviews": "80",

      "description":
          "Comfortable daily wear sandals with anti-slip sole. Lightweight and durable design suitable for outdoor use.",

      "stock": "5",

      "delivery": "₹40 Delivery",
      "deliveryTime": "2-3 days",
      "product_details" :{
         "Article number": "110-bk",
  "Brand": "Stifron",
  "Color code": "Brown",
  "Size in number": "9",
  "Style code": "Formal",
  "Uk india size": "9",
  "Color": "Brown",
  "Ideal for": "Men",
  "Occasion": "Formal",
  "Outer material": "Genuine leather",
  "Care instructions": "Normal wash",
  "Closure": "Lace-ups",
  "Euro size": "43",
  "Inner material": "Comfort fabric",
  "Ornamentation type": "Lace",
      }
    },
    {
      "id": "3",
      "image": "assets/phone.jpg",
      "title": "Smartphone Pro Max",
      "brand": "TechBrand",
      "category": "Electronics",

      "price": "25999",
      "oldPrice": "45999",
      "discount": "43",

      "rating": "4.5",
      "reviews": "450",

      "description": "Latest flagship smartphone with 5G support, 108MP camera, and powerful processor for gaming and photography.",

      "stock": "15",

      "delivery": "Free Delivery",
      "deliveryTime": "1-2 days",
      "product_details": {
        "Brand": "TechBrand",
        "Model": "Pro Max 2024",
        "RAM": "12GB",
        "Storage": "256GB",
        "Display": "6.7 inch AMOLED",
        "Processor": "Latest Chipset",
        "Camera": "108MP + 48MP + 12MP",
        "Battery": "5000 mAh",
        "OS": "Latest Android",
        "Warranty": "1 year",
      }
    },
    {
      "id": "4",
      "image": "assets/earbuds.jpg",
      "title": "Wireless Earbuds",
      "brand": "AudioMax",
      "category": "Electronics",

      "price": "2499",
      "oldPrice": "5999",
      "discount": "58",

      "rating": "4.2",
      "reviews": "320",

      "description": "Premium wireless earbuds with active noise cancellation, 30 hours battery life, and crystal-clear sound quality.",

      "stock": "50",

      "delivery": "Free Delivery",
      "deliveryTime": "2-3 days",
      "product_details": {
        "Brand": "AudioMax",
        "Model": "Pro Buds",
        "Noise Cancellation": "Active ANC",
        "Battery Life": "30 hours",
        "Charging Case": "Yes",
        "Water Resistant": "IPX5",
        "Connectivity": "Bluetooth 5.3",
        "Driver Size": "12mm",
        "Weight": "4.5g per bud",
        "Colors Available": "Black, White, Gold",
      }
    },
    {
      "id": "5",
      "image": "assets/laptop.jpg",
      "title": "Laptop Pro 15",
      "brand": "CompuTech",
      "category": "Electronics",

      "price": "89999",
      "oldPrice": "129999",
      "discount": "30",

      "rating": "4.7",
      "reviews": "280",

      "description": "Powerful laptop with latest processor, 16GB RAM, perfect for programming, design, and content creation.",

      "stock": "8",

      "delivery": "₹299 Delivery",
      "deliveryTime": "3-4 days",
      "product_details": {
        "Brand": "CompuTech",
        "Processor": "Core i7",
        "RAM": "16GB DDR5",
        "Storage": "512GB SSD",
        "Screen": "15.6 inch IPS",
        "GPU": "RTX 4050",
        "Battery": "12 hours",
        "Weight": "1.9 kg",
        "OS": "Windows 11",
        "Warranty": "2 years",
      }
    },
    {
      "id": "6",
      "image": "assets/waterbottle.jpg",
      "title": "Stainless Steel Water Bottle",
      "brand": "HydroLife",
      "category": "Home & Kitchen",

      "price": "799",
      "oldPrice": "1499",
      "discount": "47",

      "rating": "4.3",
      "reviews": "620",

      "description": "Keeps drinks hot for 24 hours and cold for 36 hours. Eco-friendly and durable stainless steel construction.",

      "stock": "100",

      "delivery": "Free Delivery",
      "deliveryTime": "2-3 days",
      "product_details": {
        "Brand": "HydroLife",
        "Capacity": "1 Liter",
        "Material": "Stainless Steel",
        "Insulation": "Double Wall",
        "Temperature": "Hot 24h, Cold 36h",
        "Mouth": "Wide Mouth",
        "Colors": "Blue, Black, Silver",
        "Weight": "450g",
        "BPA Free": "Yes",
        "Warranty": "Lifetime",
      }
    },
    {
      "id": "7",
      "image": "assets/bedsheet.jpg",
      "title": "100% Cotton Bed Sheet Set",
      "brand": "ComfortHome",
      "category": "Home & Furnishing",

      "price": "1299",
      "oldPrice": "2999",
      "discount": "56",

      "rating": "4.4",
      "reviews": "450",

      "description": "Premium 300 thread count cotton bed sheets, super soft and comfortable for a good night's sleep.",

      "stock": "35",

      "delivery": "Free Delivery",
      "deliveryTime": "3-4 days",
      "product_details": {
        "Brand": "ComfortHome",
        "Material": "100% Cotton",
        "Thread Count": "300",
        "Pieces": "4 (Set)",
        "Size": "King",
        "Colors": "White, Grey, Blue",
        "Care": "Machine Wash Cold",
        "Shrink Free": "Yes",
        "Softness": "Ultra Soft",
        "Warranty": "2 years",
      }
    },
    {
      "id": "8",
      "image": "assets/serum.jpg",
      "title": "Vitamin C Face Serum",
      "brand": "SkinCare+",
      "category": "Beauty",

      "price": "599",
      "oldPrice": "1299",
      "discount": "54",

      "rating": "4.6",
      "reviews": "890",

      "description": "Advanced vitamin C serum brightens skin, reduces dark spots, and improves skin texture. Dermatologist approved.",

      "stock": "80",

      "delivery": "Free Delivery",
      "deliveryTime": "1-2 days",
      "product_details": {
        "Brand": "SkinCare+",
        "Volume": "30ml",
        "Active Ingredient": "Vitamin C 20%",
        "Skin Type": "All Types",
        "Texture": "Lightweight Serum",
        "Application": "Face",
        "Dermatologist": "Approved",
        "Results": "Visible in 2 weeks",
        "Paraben Free": "Yes",
        "Shelf Life": "2 years",
      }
    },
    {
      "id": "9",
      "image": "assets/runningshoe.jpg",
      "title": "Professional Running Shoes",
      "brand": "SportMax",
      "category": "Footwear",

      "price": "3499",
      "oldPrice": "7999",
      "discount": "56",

      "rating": "4.5",
      "reviews": "340",

      "description": "Lightweight running shoes with advanced cushioning technology, perfect for marathon training and daily runs.",

      "stock": "45",

      "delivery": "Free Delivery",
      "deliveryTime": "2-3 days",
      "product_details": {
        "Brand": "SportMax",
        "Type": "Running Shoe",
        "Sole": "Rubber Outsole",
        "Cushioning": "Gel Technology",
        "Fit": "Snug",
        "Weight": "280g",
        "Sizes": "6-12",
        "Colors": "Black, White, Red",
        "Arch Support": "High",
        "Water Resistant": "Yes",
      }
    },
    {
      "id": "10",
      "image": "assets/coffeemachine.jpg",
      "title": "Automatic Coffee Maker",
      "brand": "BrewMaster",
      "category": "Kitchen Appliances",

      "price": "2899",
      "oldPrice": "5999",
      "discount": "52",

      "rating": "4.4",
      "reviews": "520",

      "description": "Brew perfect coffee in 5 minutes. Programmable timer, auto shut-off, and keeps coffee hot for hours.",

      "stock": "28",

      "delivery": "₹99 Delivery",
      "deliveryTime": "3-5 days",
      "product_details": {
        "Brand": "BrewMaster",
        "Capacity": "1.2 Liters",
        "Power": "900W",
        "Brew Time": "5 minutes",
        "Temperature": "Maintains Hot",
        "Features": "Programmable, Auto Shut-off",
        "Carafe": "Glass",
        "Filter": "Permanent Filter",
        "Colors": "Black, Silver",
        "Warranty": "1 year",
      }
    },
    {
      "id": "11",
      "image": "assets/headphones.jpg",
      "title": "Wireless Gaming Headset",
      "brand": "GameSound",
      "category": "Electronics",

      "price": "3999",
      "oldPrice": "8999",
      "discount": "55",

      "rating": "4.5",
      "reviews": "410",

      "description": "Professional gaming headset with 7.1 surround sound, noise-cancelling mic, and 25-hour battery life.",

      "stock": "32",

      "delivery": "Free Delivery",
      "deliveryTime": "2-3 days",
      "product_details": {
        "Brand": "GameSound",
        "Sound": "7.1 Surround",
        "Mic": "Noise Cancelling",
        "Battery": "25 hours",
        "Connectivity": "2.4GHz Wireless",
        "Compatibility": "PC, PS5, Xbox",
        "Comfort Fit": "Memory Foam",
        "Colors": "Black, Red",
        "Weight": "320g",
        "Warranty": "2 years",
      }
    },
    {
      "id": "12",
      "image": "assets/smartwatch.jpg",
      "title": "Fitness Smartwatch",
      "brand": "FitTrack",
      "category": "Wearables",

      "price": "4999",
      "oldPrice": "9999",
      "discount": "50",

      "rating": "4.3",
      "reviews": "670",

      "description": "Advanced fitness tracking with heart rate monitor, blood oxygen tracking, and 14-day battery life.",

      "stock": "55",

      "delivery": "Free Delivery",
      "deliveryTime": "2-3 days",
      "product_details": {
        "Brand": "FitTrack",
        "Display": "AMOLED 1.4 inch",
        "Battery Life": "14 days",
        "Heart Rate": "24/7 Monitoring",
        "Blood Oxygen": "SpO2 Tracking",
        "Water Resistant": "5ATM",
        "Sports Modes": "100+",
        "Color Options": "Black, Silver, Gold",
        "Warranty": "1 year",
        "Compatibility": "iOS & Android",
      }
    },
   
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = [];

  String selectedSort = "Price: Low to High";

  @override
  void initState() {
    super.initState();
    filteredProducts = mainproducts;
  }

  void searchProducts(String query) {
    final input = query.toLowerCase();

    final results = mainproducts.where((item) {
      final title = (item["title"] ?? "").toString().toLowerCase();
      final desc = (item["description"] ?? "").toString().toLowerCase();
      final brand = (item["brand"] ?? "").toString().toLowerCase();
      final category = (item["category"] ?? "").toString().toLowerCase();

      return title.contains(input) ||
          desc.contains(input) ||
          brand.contains(input) ||
          category.contains(input);
    }).toList();

    setState(() {
      filteredProducts = results;
    });
  }

  Widget buildSortTile(String title, Function setModalState) {
    return InkWell(
      onTap: () {
        setModalState(() {
          selectedSort = title;
        });

        applySorting(title);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedSort == title ? Colors.blue : Colors.grey,
                  width: 2,
                ),
              ),
              child: selectedSort == title
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void applySorting(String type) {
    List<Map<String, dynamic>> temp = List.from(filteredProducts);

    if (type == "Price -- Low to High") {
      temp.sort(
        (a, b) => int.parse(
          a["price"]!.replaceAll("₹", ""),
        ).compareTo(int.parse(b["price"]!.replaceAll("₹", ""))),
      );
    } else if (type == "Price -- High to Low") {
      temp.sort(
        (a, b) => int.parse(
          b["price"]!.replaceAll("₹", ""),
        ).compareTo(int.parse(a["price"]!.replaceAll("₹", ""))),
      );
    } else if (type == "Popularity") {
      temp.sort(
        (a, b) =>
            double.parse(b["rating"]!).compareTo(double.parse(a["rating"]!)),
      );
    } else if (type == "Newest First") {
      temp = temp.reversed.toList();
    }

    setState(() {
      filteredProducts = temp;
    });
  }

  RangeValues selectedPrice = RangeValues(0, 1000);
  double selectedRating = 0;
  double selectedDiscount = 0;

  void showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: const Text(
                    "SORT BY",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),

                buildSortTile("Popularity", setModalState),
                buildSortTile("Price -- Low to High", setModalState),
                buildSortTile("Price -- High to Low", setModalState),
                buildSortTile("Newest First", setModalState),

                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    RangeValues tempPrice = selectedPrice;
    double tempRating = selectedRating;
    double tempDiscount = selectedDiscount;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.all(16),
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FILTER",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 15),

                  Text("Price Range"),
                  RangeSlider(
                    values: tempPrice,
                    min: 0,
                    max: 1000,
                    divisions: 20,
                    labels: RangeLabels(
                      "₹${tempPrice.start.toInt()}",
                      "₹${tempPrice.end.toInt()}",
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        tempPrice = values;
                      });
                    },
                  ),

                  Text("Minimum Rating"),
                  Slider(
                    value: tempRating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: tempRating.toString(),
                    onChanged: (val) {
                      setModalState(() {
                        tempRating = val;
                      });
                    },
                  ),

                  Text("Minimum Discount"),
                  Slider(
                    value: tempDiscount,
                    min: 0,
                    max: 80,
                    divisions: 8,
                    label: "${tempDiscount.toInt()}%",
                    onChanged: (val) {
                      setModalState(() {
                        tempDiscount = val;
                      });
                    },
                  ),

                  Spacer(),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedPrice = RangeValues(0, 1000);
                              selectedRating = 0;
                              selectedDiscount = 0;
                              filteredProducts = mainproducts;
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Clear"),
                        ),
                      ),

                      SizedBox(width: 10),

                      // Apply
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            selectedPrice = tempPrice;
                            selectedRating = tempRating;
                            selectedDiscount = tempDiscount;

                            applyFilter();
                            Navigator.pop(context);
                          },
                          child: Text("Apply"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void applyFilter() {
    List<Map<String, dynamic>> temp = mainproducts.where((item) {
      int price = int.parse(item["price"]!.replaceAll("₹", ""));
      double rating = double.parse(item["rating"]!);
      int discount = int.parse(item["discount"]!.replaceAll("% off", ""));

      return price >= selectedPrice.start &&
          price <= selectedPrice.end &&
          rating >= selectedRating &&
          discount >= selectedDiscount;
    }).toList();

    setState(() {
      filteredProducts = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: height * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: height * 0.01),
                child: Row(
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
                          controller: searchController,
                          onChanged: searchProducts,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Image.asset("assets/product_banner.jpeg"),
              ),
              Container(
                width: width,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showSortBottomSheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.swap_vert, size: 22),
                            SizedBox(width: 6),
                            Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey.shade300,
                    ),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showFilterBottomSheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.tune, size: 22),
                            SizedBox(width: 6),
                            Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(width * 0.03),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: width * 0.03,
                  mainAxisSpacing: height * 0.015,
                  childAspectRatio: 0.68,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final item = filteredProducts[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productdetails(product: item),
                        ),
                      );
                    },
                    child: Container(
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
                                        decoration: TextDecoration.lineThrough,
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
