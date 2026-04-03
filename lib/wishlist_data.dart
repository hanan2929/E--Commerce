class WishlistData {
  static List<Map<String, String>> wishlistItems = [];

  static void addItem(Map<String, String> item) {
    if (!wishlistItems.any((e) => e['name'] == item['name'])) {
      wishlistItems.add(item);
    }
  }

  static void removeItem(Map<String, String> item) {
    wishlistItems.removeWhere((e) => e['name'] == item['name']);
  }
}
