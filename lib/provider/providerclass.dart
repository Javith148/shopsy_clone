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

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Map<String, dynamic>.from(json['product']),
      quantity: json['quantity'],
    );
  }
}

// Cart Provider
class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  CartProvider() {
    loadCart();
  }

  List<CartItem> get cartItems => _cartItems;

  int get totalItems =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Load from storage
  Future<void> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getStringList("cart_items") ?? [];

      _cartItems = data
          .map((e) => CartItem.fromJson(jsonDecode(e)))
          .toList();

      notifyListeners();
    } catch (e) {
      debugPrint("Error loading cart: $e");
    }
  }

  // Save to storage
  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> data =
          _cartItems.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList("cart_items", data);
    } catch (e) {
      debugPrint("Error saving cart: $e");
    }
  }

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
    _saveCart();
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product['id'] == productId);
    _saveCart();
    notifyListeners();
  }

  // Update quantity
  void updateQuantity(String productId, int newQuantity) {
    final itemIndex =
        _cartItems.indexWhere((item) => item.product['id'] == productId);
    if (itemIndex >= 0 && newQuantity > 0) {
      _cartItems[itemIndex].quantity = newQuantity;
      _saveCart();
      notifyListeners();
    }
  }

  // Clear cart
  void clearCart() {
    _cartItems.clear();
    _saveCart();
    notifyListeners();
  }

  // Check if product is in cart
  bool isInCart(String productId) {
    return _cartItems.any((item) => item.product['id'] == productId);
  }
}

// Wishlist Provider
class WishlistProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _wishlistItems = [];

  WishlistProvider() {
    loadWishlist();
  }

  List<Map<String, dynamic>> get wishlistItems => _wishlistItems;

  // Load from storage
  Future<void> loadWishlist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getStringList("wishlist_items") ?? [];

      _wishlistItems = data
          .map((e) => Map<String, dynamic>.from(jsonDecode(e)))
          .toList();

      notifyListeners();
    } catch (e) {
      debugPrint("Error loading wishlist: $e");
    }
  }

  // Save to storage
  Future<void> _saveWishlist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> data =
          _wishlistItems.map((e) => jsonEncode(e)).toList();
      await prefs.setStringList("wishlist_items", data);
    } catch (e) {
      debugPrint("Error saving wishlist: $e");
    }
  }

  // Toggle wishlist
  void toggleWishlist(Map<String, dynamic> product) {
    final index = _wishlistItems.indexWhere((item) => item['id'] == product['id']);
    if (index >= 0) {
      _wishlistItems.removeAt(index);
    } else {
      _wishlistItems.add(product);
    }
    _saveWishlist();
    notifyListeners();
  }

  // Check if product is wishlisted
  bool isWishlisted(String productId) {
    return _wishlistItems.any((item) => item['id'] == productId);
  }

  // Remove from wishlist
  void removeFromWishlist(String productId) {
    _wishlistItems.removeWhere((item) => item['id'] == productId);
    _saveWishlist();
    notifyListeners();
  }
}
