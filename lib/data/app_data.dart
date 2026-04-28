import 'package:flutter/material.dart';
import 'package:shopsy/models/category_model.dart';

/// 🔹 MAIN CATEGORIES
final List<Category> appCategories = [
  Category(name: "Best Selling", icon: Icons.local_fire_department_outlined),
  Category(name: "Mobiles", icon: Icons.smartphone_outlined),
  Category(name: "Women's Wear", icon: Icons.woman_outlined),
  Category(name: "Beauty Products", icon: Icons.brush_outlined),
  Category(name: "Western Wear", icon: Icons.checkroom_outlined),
  Category(name: "Home", icon: Icons.home_outlined),
  Category(name: "Men's Fashion", icon: Icons.man_2_outlined),
  Category(name: "Electronics", icon: Icons.electrical_services_outlined),
  Category(name: "Appliances", icon: Icons.kitchen_outlined),
  Category(name: "Women's Footwear", icon: Icons.shopping_bag_outlined),
  Category(name: "Toys & Stationery", icon: Icons.toys_outlined),
  Category(name: "Men's Footwear", icon: Icons.hiking_outlined),
  Category(name: "Women's Accessories", icon: Icons.watch_outlined),
  Category(name: "Men's Accessories", icon: Icons.watch_outlined),
  Category(name: "Kids Corner", icon: Icons.child_care_outlined),
];


/// 🔹 SUB CATEGORIES (NO API FIELD)
final Map<String, List<SubCategory>> appSubCategories = {

  "Best Selling": [
    SubCategory(image: "assets/mens.jpg", title: "Top Deals"),
    SubCategory(image: "assets/shoe.png", title: "Trending Now"),
    SubCategory(image: "assets/watch.jpg", title: "Best Picks"),
    SubCategory(image: "assets/womans.png", title: "Hot Sellers"),
    SubCategory(image: "assets/kitchen.jpg", title: "Mega Deals"),
    SubCategory(image: "assets/jewelry.jpg", title: "Popular"),
  ],

  "Mobiles": [
    SubCategory(image: "assets/smart.jpg", title: "Smartphones"),
    SubCategory(image: "assets/airpods.jpg", title: "Earbuds"),
    SubCategory(image: "assets/watch.jpg", title: "Smart Watch"),
  ],

  "Women's Wear": [
    SubCategory(image: "assets/womans.png", title: "Tops & Tees"),
    SubCategory(image: "assets/saree.jpg", title: "Sarees"),
    SubCategory(image: "assets/westen.jpg", title: "Kurtis"),
    SubCategory(image: "assets/trend.jpg", title: "Salwar Sets"),
    SubCategory(image: "assets/jewelry.jpg", title: "Dress Material"),
    SubCategory(image: "assets/womans.png", title: "Leggings"),
  ],

  "Beauty Products": [
    SubCategory(image: "assets/jewelry.jpg", title: "Skincare"),
    SubCategory(image: "assets/accessories.png", title: "Makeup"),
    SubCategory(image: "assets/womans.png", title: "Hair Care"),
    SubCategory(image: "assets/jewelry.jpg", title: "Fragrance"),
    SubCategory(image: "assets/accessories.png", title: "Nail Art"),
    SubCategory(image: "assets/womans.png", title: "Bath & Body"),
  ],

  "Western Wear": [
    SubCategory(image: "assets/trend.jpg", title: "Dresses"),
    SubCategory(image: "assets/westen.jpg", title: "Tops"),
    SubCategory(image: "assets/womans.png", title: "Jeans"),
    SubCategory(image: "assets/trend.jpg", title: "Skirts"),
    SubCategory(image: "assets/westen.jpg", title: "Jumpsuits"),
    SubCategory(image: "assets/womans.png", title: "Shorts"),
  ],

  "Home": [
    SubCategory(image: "assets/kitchen.jpg", title: "Kitchen Tools"),
    SubCategory(image: "assets/bedsheet.jpg", title: "Bedsheets"),
    SubCategory(image: "assets/dryers.jpg", title: "Home Decor"),
    SubCategory(image: "assets/lunch_box.jpg", title: "Storage"),
    SubCategory(image: "assets/oil.jpg", title: "Cleaning"),
    SubCategory(image: "assets/kitchen.jpg", title: "Bathroom"),
  ],

  "Men's Fashion": [
    SubCategory(image: "assets/mens.jpg", title: "Shirts"),
    SubCategory(image: "assets/t_shirt.jpg", title: "T-Shirts"),
    SubCategory(image: "assets/trend.jpg", title: "Track Pants"),
    SubCategory(image: "assets/mens.jpg", title: "Jeans"),
    SubCategory(image: "assets/t_shirt.jpg", title: "Kurtas"),
    SubCategory(image: "assets/mens.jpg", title: "Innerwear"),
  ],

  "Electronics": [
    SubCategory(image: "assets/airpods.jpg", title: "Headphones"),
    SubCategory(image: "assets/smart.jpg", title: "Speakers"),
    SubCategory(image: "assets/watch.jpg", title: "Chargers"),
    SubCategory(image: "assets/airpods.jpg", title: "Cables"),
    SubCategory(image: "assets/smart.jpg", title: "Power Banks"),
    SubCategory(image: "assets/watch.jpg", title: "LED Lights"),
  ],

  "Appliances": [
    SubCategory(image: "assets/stove.jpg", title: "Gas Stoves"),
    SubCategory(image: "assets/kitchen.jpg", title: "Mixer Grinder"),
    SubCategory(image: "assets/dryers.jpg", title: "Iron"),
    SubCategory(image: "assets/oil.jpg", title: "Cooker"),
    SubCategory(image: "assets/stove.jpg", title: "Kettle"),
    SubCategory(image: "assets/kitchen.jpg", title: "Toaster"),
  ],

  "Women's Footwear": [
    SubCategory(image: "assets/shoe.png", title: "Sandals"),
    SubCategory(image: "assets/casual_shoe.jpg", title: "Flats"),
    SubCategory(image: "assets/shoe.png", title: "Heels"),
    SubCategory(image: "assets/casual_shoe.jpg", title: "Sports Shoes"),
    SubCategory(image: "assets/shoe.png", title: "Slippers"),
    SubCategory(image: "assets/casual_shoe.jpg", title: "Bellies"),
  ],

  "Toys & Stationery": [
    SubCategory(image: "assets/toys.jpg", title: "Soft Toys"),
    SubCategory(image: "assets/back_to_school.jpg", title: "School Bags"),
    SubCategory(image: "assets/toys.jpg", title: "Board Games"),
    SubCategory(image: "assets/back_to_school.jpg", title: "Art Supplies"),
    SubCategory(image: "assets/toys.jpg", title: "Action Figures"),
    SubCategory(image: "assets/back_to_school.jpg", title: "Notebooks"),
  ],

  "Men's Footwear": [
    SubCategory(image: "assets/casual_shoe.jpg", title: "Casual Shoes"),
    SubCategory(image: "assets/shoe.png", title: "Sports Shoes"),
    SubCategory(image: "assets/casual_shoe.jpg", title: "Sandals"),
    SubCategory(image: "assets/shoe.png", title: "Formal Shoes"),
    SubCategory(image: "assets/casual_shoe.jpg", title: "Slippers"),
    SubCategory(image: "assets/shoe.png", title: "Loafers"),
  ],

  "Women's Accessories": [
    SubCategory(image: "assets/jewelry.jpg", title: "Earrings"),
    SubCategory(image: "assets/watch.jpg", title: "Watches"),
    SubCategory(image: "assets/accessories.png", title: "Handbags"),
    SubCategory(image: "assets/jewelry.jpg", title: "Bangles"),
    SubCategory(image: "assets/watch.jpg", title: "Sunglasses"),
    SubCategory(image: "assets/accessories.png", title: "Hair Clips"),
  ],

  "Men's Accessories": [
    SubCategory(image: "assets/watch.jpg", title: "Watches"),
    SubCategory(image: "assets/suitcase.jpg", title: "Wallets"),
    SubCategory(image: "assets/accessories.png", title: "Belts"),
    SubCategory(image: "assets/watch.jpg", title: "Sunglasses"),
    SubCategory(image: "assets/suitcase.jpg", title: "Bags"),
    SubCategory(image: "assets/accessories.png", title: "Caps"),
  ],

  "Kids Corner": [
    SubCategory(image: "assets/baby_dress.jpg", title: "Boys Wear"),
    SubCategory(image: "assets/toys.jpg", title: "Girls Wear"),
    SubCategory(image: "assets/baby_dress.jpg", title: "Infant Wear"),
    SubCategory(image: "assets/back_to_school.jpg", title: "School Combos"),
    SubCategory(image: "assets/toys.jpg", title: "Toys"),
    SubCategory(image: "assets/baby_dress.jpg", title: "Kids Shoes"),
  ],
};