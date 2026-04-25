import 'package:flutter/material.dart';
import 'package:shopsy/screens/Cartegories/categories.dart';
import 'package:shopsy/screens/splashscreen.dart';
import 'screens/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopsy_clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body:Splashscreen()),
    );
  }
}


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.grid_view,
    Icons.person_outline,
    Icons.shopping_cart,
  ];

  
  final List<String> labels = [
    "Home",
    "Search",
    "Categories",
    "Account",
    "Cart",
  ];

  
  final List<Widget> screens = [
    Homepage(),
    Center(child: Text("Search")),
    Categories(),
    Center(child: Text("Account")),
    Center(child: Text("Cart")),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
     
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        height: height * 0.06,
        decoration: BoxDecoration(
          color: Colors.white,
         
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            bool isActive = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  
                  Container(
                    height: height * 0.003,
                    width: width * 0.1,
                    margin: EdgeInsets.only(bottom: height * 0.008),
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF543CEA) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Icon(
                    icons[index],
                    size: height * 0.025,
                    color: isActive ? const Color(0xFF543CEA) : Colors.grey,
                  ),

                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: isActive ? const Color(0xFF543CEA) : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}