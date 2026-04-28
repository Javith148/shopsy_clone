import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/models/addressmodel.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> _addresses = [];

  List<AddressModel> get addresses => _addresses;

  // Load from storage
  Future<void> loadAddresses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getStringList("addresses") ?? [];

      _addresses = data
          .map((e) => AddressModel.fromJson(jsonDecode(e)))
          .toList();

      notifyListeners();
    } catch (e) {
      debugPrint("Error loading addresses: $e");
    }
  }

  // Save new address
  Future<void> addAddress(AddressModel address) async {
    _addresses.add(address);
    await _saveToPrefs();
    notifyListeners();
  }

  // Update existing address
  Future<void> updateAddress(int index, AddressModel address) async {
    if (index >= 0 && index < _addresses.length) {
      _addresses[index] = address;
      await _saveToPrefs();
      notifyListeners();
    }
  }

  // Delete address
  Future<void> deleteAddress(int index) async {
    if (index >= 0 && index < _addresses.length) {
      _addresses.removeAt(index);
      await _saveToPrefs();
      notifyListeners();
    }
  }

  // Helper to save to SharedPreferences
  Future<void> _saveToPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> data =
          _addresses.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList("addresses", data);
    } catch (e) {
      debugPrint("Error saving addresses: $e");
    }
  }
}

// Cart Item Model
class CartItem {
  final Map<String, dynamic> product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

// Cart Provider
class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get totalItems =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Add to cart
  void addToCart(Map<String, dynamic> product, {int quantity = 1}) {
    final existingIndex = _cartItems
        .indexWhere((item) => item.product['id'] == product['id']);

    if (existingIndex >= 0) {
      // Product already in cart, increase quantity
      _cartItems[existingIndex].quantity += quantity;
    } else {
      // Add new product
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product['id'] == productId);
    notifyListeners();
  }

  // Update quantity
  void updateQuantity(String productId, int newQuantity) {
    final itemIndex =
        _cartItems.indexWhere((item) => item.product['id'] == productId);
    if (itemIndex >= 0 && newQuantity > 0) {
      _cartItems[itemIndex].quantity = newQuantity;
      notifyListeners();
    }
  }

  // Clear cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
