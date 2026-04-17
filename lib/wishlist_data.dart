import 'product_model.dart';

class WishlistData {
  static List<Product> wishlistItems = [];

  static void addItem(Product item) {
    if (!wishlistItems.any((e) => e.title == item.title)) {
      wishlistItems.add(item);
    }
  }

  static void removeItem(Product item) {
    wishlistItems.removeWhere((e) => e.title == item.title);
  }
}