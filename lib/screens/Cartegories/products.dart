import "package:flutter/material.dart";
import "package:shopsy/screens/Cartegories/productdetails.dart";

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {



  final List<Map<String, String>> mainproducts = [
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
    
  },
  {
    "id": "3",
    "image": "assets/back_to_school.jpg",
    "title": "School Backpack",
    "brand": "Skybags",
    "category": "Bags",

    "price": "231",
    "oldPrice": '799',
    "discount": '71',

    "rating": '3.9',
    "reviews": "200",

    "description":
        "Spacious school backpack with multiple compartments. Water-resistant material and comfortable shoulder straps.",

    "stock": "0",
   
    "delivery": "Free Delivery",
    
  },
  {
    "id": "4",
    "image": "assets/oil.jpg",
    "title": "Hair Oil Refill",
    "brand": "Parachute",
    "category": "Grocery",

    "price": "79",
    "oldPrice": "199",
    "discount": "60",

    "rating": "3.7",
    "reviews": "60",

    "description":
        "Nourishing coconut hair oil refill for strong and healthy hair. Suitable for all hair types.",

    "stock": '25',
   
    "delivery": "Free Delivery",
   
  },
  ];

  TextEditingController searchController = TextEditingController();
List<Map<String, String>> filteredProducts = [];

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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

        
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedSort == title
                    ? Colors.blue
                    : Colors.grey,
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
  List<Map<String, String>> temp = List.from(filteredProducts);

  if (type == "Price -- Low to High") {
    temp.sort((a, b) =>
        int.parse(a["price"]!.replaceAll("₹", ""))
            .compareTo(int.parse(b["price"]!.replaceAll("₹", ""))));
  } 
  else if (type == "Price -- High to Low") {
    temp.sort((a, b) =>
        int.parse(b["price"]!.replaceAll("₹", ""))
            .compareTo(int.parse(a["price"]!.replaceAll("₹", ""))));
  } 
  else if (type == "Popularity") {
    temp.sort((a, b) =>
        double.parse(b["rating"]!)
            .compareTo(double.parse(a["rating"]!)));
  } 
  else if (type == "Newest First") {
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
                    horizontal: 16, vertical: 14),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
                )
              ],
            ),
          );
        },
      );
    },
  );
}

void applyFilter() {
  List<Map<String, String>> temp = mainproducts.where((item) {

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
      body:SingleChildScrollView(child: 
       Padding(
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
        prefixIconConstraints: BoxConstraints(
          minWidth: 35, 
        ),

        contentPadding: EdgeInsets.symmetric(
          vertical: height * 0.008, 
        ),
      ),
    ),
  ),
),
                  SizedBox(width: width*0.015,),
                  Icon(Icons.favorite_outline,size:   height * 0.025),
                  SizedBox(width: width*0.015,),
                  Icon(Icons.shopping_cart_outlined,size:   height * 0.025),
                  SizedBox(width: width*0.015,),
                  
                ],
              ),
            ),Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: width*0.02),child: 
             Image.asset("assets/product_banner.jpeg"),),
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
      ),),
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
                        child: 
                      Container(
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
                        ),)
                      );
                    },
                  ),
          ],
        ),
      ),)
    );
  }
}
