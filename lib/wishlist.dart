import 'package:flutter/material.dart';
import 'wishlist_data.dart';
import 'Buy.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Wishlist",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.deepPurple),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: WishlistData.wishlistItems.isEmpty
          ? const Center(
              child: Text(
                "Your wishlist is empty!",
                style: TextStyle(color: Colors.deepPurple, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: WishlistData.wishlistItems.length,
              itemBuilder: (context, index) {
                final item = WishlistData.wishlistItems[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        item['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      item['price']!,
                      style: const TextStyle(
                          color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyPage(product: item),
                              ),
                            ).then((_) => setState(() {}));
                          },
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            setState(() {
                              WishlistData.removeItem(item);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
