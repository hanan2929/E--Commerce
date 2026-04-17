import 'package:flutter/material.dart';
import 'wishlist_data.dart';
import 'Buy.dart';
import 'package:firebase_database/firebase_database.dart';
import 'product_model.dart';

class CosmeticsPage extends StatefulWidget {
  const CosmeticsPage({super.key});

  @override
  State<CosmeticsPage> createState() => _CosmeticsPageState();
}

class _CosmeticsPageState extends State<CosmeticsPage> {
  final List<Map<String, String>> staticCosmetics = [
    {
      "image": "https://images.unsplash.com/photo-1596462502278-27bfdc4033c8?q=80&w=1000&auto=format&fit=crop",
      "name": "Luxury Lipstick Red",
      "price": "\$25",
      "description": "Long-lasting matte red lipstick for a bold and elegant look."
    },
    {
      "image": "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=1000&auto=format&fit=crop",
      "name": "Nail Polish Set",
      "price": "\$15",
      "description": "High-shine, chip-resistant nail polish in trendy seasonal colors."
    },
    {
      "image": "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=1000&auto=format&fit=crop",
      "name": "Hydrating Face Cream",
      "price": "\$45",
      "description": "Moisturizing cream enriched with vitamin E for glowing skin."
    },
    {
      "image": "https://images.unsplash.com/photo-1594465919760-441fe5908ab0?q=80&w=1000&auto=format&fit=crop",
      "name": "Premium Foundation",
      "price": "\$35",
      "description": "Flawless coverage foundation that blends perfectly with your skin tone."
    },
  ];

  List<Map<String, String>> firebaseCosmetics = [];
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _listenToFirebase();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _listenToFirebase() {
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<Map<String, String>> fetched = [];
        data.forEach((key, value) {
          final item = value as Map<dynamic, dynamic>;
          String imagePath = (item['image'] ?? "").toString();

          fetched.add({
            "name": (item['title'] ?? "...").toString(),
            "price": (item['price'] ?? "...").toString(),
            "description": (item['description'] ?? "").toString(),
            "image": imagePath.isNotEmpty ? imagePath : "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
          });
        });
        if (mounted) {
          setState(() {
            firebaseCosmetics = fetched.reversed.toList();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allItems = [...firebaseCosmetics, ...staticCosmetics];
    final List<Map<String, String>> filteredItems = allItems.where((item) {
      return item['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          "Cosmetics",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Search Cosmetics",
                  hintText: "Search here",
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.deepPurple),
                    onPressed: () {},
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0x33673AB7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  WishlistData.wishlistItems.any((e) => e.title == item['name']);

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A673AB7),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => BuyPage(
                              product: Product(
                                id: 0,
                                title: item["name"]!,
                                description: item["description"]!,
                                category: "Cosmetics",
                                price: double.tryParse(item["price"]!.replaceAll("\$", "")) ?? 0,
                                rating: 4.5,
                                thumbnail: item["image"]!,
                              ),
                            ),
                          ),
                        );                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color(0x0D673AB7),
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      item["image"]!,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.brush, size: 50, color: Colors.deepPurple),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      final product = Product(
                                        id: 0,
                                        title: item["name"]!,
                                        description: item["description"]!,
                                        category: "Cosmetics",
                                        price: double.tryParse(item["price"]!.replaceAll("\$", "")) ?? 0,
                                        rating: 4.5,
                                        thumbnail: item["image"]!,
                                      );

                                      setState(() {
                                        if (WishlistData.wishlistItems.any((e) => e.title == product.title)) {
                                          WishlistData.removeItem(product);
                                        } else {
                                          WishlistData.addItem(product);
                                        }
                                      });
                                    },
                                    child: Icon(
                                      WishlistData.wishlistItems.any((e) => e.title == item["name"])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: WishlistData.wishlistItems.any((e) => e.title == item["name"])
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 22,
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["name"]!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item["price"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.add, color: Colors.white, size: 18),
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
