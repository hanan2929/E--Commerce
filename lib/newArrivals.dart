import 'package:flutter/material.dart';
import 'wishlist_data.dart';
import 'Buy.dart';
import 'package:firebase_database/firebase_database.dart';

class NewArrivalsPage extends StatefulWidget {
  const NewArrivalsPage({super.key});

  @override
  State<NewArrivalsPage> createState() => _NewArrivalsPageState();
}

class _NewArrivalsPageState extends State<NewArrivalsPage> {
  final List<Map<String, String>> staticProducts = [
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwMSj56ZPUMUzf_ZBgrx8ZUy1SDTyq6Rtn3w&s",
      "name": "Nike Sportswear Club Fleece",
      "price": "\$99"
    },
    {
      "image": "https://www.kershkicks.co.uk/cdn/shop/files/Screenshot_2024-07-12_at_9.11.59_pm.png?v=1720821499",
      "name": "Trail Running Jacket Nike",
      "price": "\$110"
    },
    {
      "image": "https://dafakar.com/cdn/shop/files/3stripBlackAdidasLogoHoodiewhite_500x.jpg?v=1762330853",
      "name": "Adidas Hoodie",
      "price": "\$120"
    },
    {
      "image": "https://i.pinimg.com/736x/6f/05/8b/6f058b4c1b26f79f1c24300c62f841d6.jpg",
      "name": "Puma T-Shirt",
      "price": "\$80"
    },
    {
      "image": "https://www.sportsdirect.com/images/products/42229099_h.jpg",
      "name": "Rebook T-shirt ",
      "price": "\$75"
    },
    {
      "image": "https://img01.ztat.net/article/spp-media-p1/6839e6c8081a4894acce745ecf6bb925/ab9c90f4396745bd9ec2a63d9407797f.jpg?imwidth=762&filter=packshot",
      "name": "Jordan hoodie",
      "price": "\$150"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7WmKOGW9EHo9Cs2odhVyFQcWq5U7L5sPQKw&s",
      "name": "Gucci T-Shirt",
      "price": "\$200"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRuMBminBOeNaTWdu5f1Rw22mhcu-geZgxRA&s",
      "name": "New Balance trouser",
      "price": "\$99"
    },
    {
      "image": "https://amiri.com/cdn/shop/files/7cb19c81-71f4-4a1f-b794-ef29b276edbf_grande.jpg?v=1733525899",
      "name": "Amiri T-Shirt",
      "price": "\$110"
    },
    {
      "image": "https://customfreaks.store/wp-content/uploads/2022/02/133_12019674-4234-424a-b43e-1c11994364e6.png",
      "name": "LV Jacket",
      "price": "\$250"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZGIe5l4Mrx5Vba8nQzyyx6cb45JLn7TYDGg&s",
      "name": "Fila Track suit",
      "price": "\$120"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7oPzRyUnqKv-CeY8R4vKqj2z48LKXa-W5Sw&s",
      "name": "Nike hoodie",
      "price": "\$145"
    },
    {
      "image": "https://img01.ztat.net/article/spp-media-p1/83d86177fd0941f4b20d19eef28c1683/5606debf5fb3479ba1af2557954b3c59.jpg?imwidth=762&filter=packshot",
      "name": "Reebok Black Shirt",
      "price": "\$45"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtYtO-c7ENe32uDILxFH4osGsWTY513PqKig&s",
      "name": "Reebok grey hoodie",
      "price": "\$175"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmIO6FpyLU529KTZTbyjkxlKQWTF9pjgDpUw&s",
      "name": "Gucci Black hoodie",
      "price": "\$249"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE0YJJMq5zhqljNBaH94BOjBKZjb6HGnqpAA&s",
      "name": "Adidas Navy Blue T-shirt ",
      "price": "\$75"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfWoGVskHrhAo_BN3SKt3G_m3Qvy5mU7M7yg&s",
      "name": "Nike Blue Jacket",
      "price": "\$195"
    },
    {
      "image": "https://xcdn.next.co.uk/common/items/default/default/itemimages/3_4Ratio/product/lge/AJ6540s8.jpg?im=Resize,width=750",
      "name": "New Balance Black Upper",
      "price": "\$245"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHTrcZ_dECItwZmcrTsitL4eGFFmoJ6jaINQ&s",
      "name": "Amiri Brown hoodie",
      "price": "\$199"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT73d4MhD1Epp2LuqIe87ILJqTbBGx45vNyEQ&s",
      "name": "Lv Blue Track Suit",
      "price": "\$145"
    },
    {
      "image": "https://cdn.shopify.com/s/files/1/0603/3031/1875/products/main-square_91ac1593-2933-46aa-97cf-b2fdd7201859.jpg?v=1694785885",
      "name": "Jordan Grey Trouser",
      "price": "\$45"
    },
    {
      "image": "https://www.jimkiddsports.com.au/cdn/shop/files/SHOPIFYMENS_0000s_0001_Pumablackpngcopy3.jpg?v=1744620926&width=2048",
      "name": "Puma Green Hoodie",
      "price": "\$139"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT95h3jegRJ6aTHjFMOiOaterWoWClqW15LRw&s",
      "name": "Adidas Red hoodie",
      "price": "\$160"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToAZ7nst-EwKRpeqAaoI5n-dwMNFqr55rIyg&s",
      "name": "Fila Brown puffer Jacket",
      "price": "\$145"
    },
    {
      "image": "https://img01.ztat.net/article/spp-media-p1/0a52e72935924b0784f559ed637ba579/1f349df268714a1383ec6ee8f05d86c0.jpg?imwidth=1800&filter=packshot",
      "name": "Nike Blue pink T-shirt",
      "price": "\$45"
    },
    {
      "image": "https://thumblr.uniid.it/product/355435/5e09d0b51bb4.jpg?width=3840&format=webp&q=75",
      "name": "New Balance Grey hoodie",
      "price": "\$79"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7oPzRyUnqKv-CeY8R4vKqj2z48LKXa-W5Sw&s",
      "name": "Nike Red Hoodie",
      "price": "\$145"
    },
    {
      "image": "https://i.pinimg.com/736x/6f/05/8b/6f058b4c1b26f79f1c24300c62f841d6.jpg",
      "name": "Puma Blue T-Shirt",
      "price": "\$80"
    },
    {
      "image": "https://dafakar.com/cdn/shop/files/3stripBlackAdidasLogoHoodiewhite_500x.jpg",
      "name": "Adidas Black Hoodie",
      "price": "\$120"
    },
    {
      "image": "https://img01.ztat.net/article/spp-media-p1/6839e6c8081a4894acce745ecf6bb925/ab9c90f4396745bd9ec2a63d9407797f.jpg",
      "name": "Jordan White Jacket",
      "price": "\$160"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7WmKOGW9EHo9Cs2odhVyFQcWq5U7L5sPQKw&s",
      "name": "Gucci Green T-Shirt",
      "price": "\$200"
    },
    {
      "image": "https://customfreaks.store/wp-content/uploads/2022/02/133_12019674-4234-424a-b43e-1c11994364e6.png",
      "name": "LV Brown Jacket",
      "price": "\$250"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRuMBminBOeNaTWdu5f1Rw22mhcu-geZgxRA&s",
      "name": "New Balance Gray Trouser",
      "price": "\$110"
    },
    {
      "image": "https://amiri.com/cdn/shop/files/7cb19c81-71f4-4a1f-b794-ef29b276edbf_grande.jpg",
      "name": "Amiri Black Shirt",
      "price": "\$180"
    },
    {
      "image": "https://www.sportsdirect.com/images/products/42229099_h.jpg",
      "name": "Reebok Blue T-Shirt",
      "price": "\$75"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZGIe5l4Mrx5Vba8nQzyyx6cb45JLn7TYDGg&s",
      "name": "Fila Navy Tracksuit",
      "price": "\$130"
    },
    {
      "image": "https://www.kershkicks.co.uk/cdn/shop/files/Screenshot_2024-07-12_at_9.11.59_pm.png",
      "name": "Nike Yellow Running Jacket",
      "price": "\$140"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwMSj56ZPUMUzf_ZBgrx8ZUy1SDTyq6Rtn3w&s",
      "name": "Nike Gray Sweatshirt",
      "price": "\$150"
    }
  ];

  List<Map<String, String>> firebaseProducts = [];
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  void initState() {
    super.initState();
    _listenToFirebase();
  }

  void _listenToFirebase() {
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<Map<String, String>> fetched = [];
        data.forEach((key, value) {
          final item = value as Map<dynamic, dynamic>;
          fetched.add({
            "name": (item['title'] ?? "New Arrival").toString(),
            "price": (item['price'] ?? "Contact for price").toString(),
            "image": (item['image'] ?? "new arrival").toString(),
          });
        });
        setState(() {
          firebaseProducts = fetched.reversed.toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allProducts = [...firebaseProducts, ...staticProducts];

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          "New Arrivals",
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Search",
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
                itemCount: allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  bool isWishlisted = WishlistData.wishlistItems.any((e) => e['name'] == product['name']);

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
                                    product["image"]!, 
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, size: 50, color: Colors.deepPurple),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isWishlisted) {
                                        WishlistData.removeItem(product);
                                      } else {
                                        WishlistData.addItem(product);
                                      }
                                    });
                                  },
                                  child: Icon(
                                    isWishlisted ? Icons.favorite : Icons.favorite_border,
                                    color: isWishlisted ? Colors.red : Colors.grey,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product["name"]!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product["price"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                                  GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BuyPage(product: product),
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.add, color: Colors.white, size: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
