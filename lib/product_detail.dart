import 'package:flutter/material.dart';
import 'product_model.dart';
import 'Buy.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Product Details",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.category,
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    product.description,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // INFO CARD
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        rowInfo(context, "Stock", "99"), // static fallback
                        const Divider(),
                        rowInfo(context, "Brand", "Unknown"), // static fallback
                        const Divider(),
                        rowInfo(context, "Shipping", "3-5 days"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  reviewCard(context, "John Doe", "Great product!", 5),
                  reviewCard(context, "Sarah", "Not bad", 4),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyPage(product: product),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Buy Now",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget rowInfo(BuildContext context, String title, String value) {
    final textStyle = TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textStyle),
        Text(value, style: textStyle),
      ],
    );
  }

  Widget reviewCard(BuildContext context, String name, String comment, int rating) {
    return Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.deepPurple),
        title: Text(name, style: TextStyle(color: Theme.of(context).textTheme.titleSmall?.color)),
        subtitle: Text(comment, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
        trailing: Text("⭐ $rating", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
      ),
    );
  }
}
