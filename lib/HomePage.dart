import 'package:flutter/material.dart';
import 'brands.dart';
import 'newArrivals.dart';
import 'LoginPage.dart';
import 'setting.dart';
import 'nike.dart';
import 'adidas.dart';
import 'Puma.dart';
import 'reebok.dart';
import 'jordan.dart';
import 'newbalance.dart';
import 'fila.dart';
import 'amiri.dart';
import 'lv.dart';
import 'gucci.dart';
import 'wishlist.dart';
import 'persnolprofile.dart';
import 'wishlist_data.dart';
import 'Buy.dart';

class HomePage extends StatefulWidget {

    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Attractive light purple background
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeContent(onWishlistChanged: () => setState(() {})),
          const WishlistPage(),
          const PersnolprofilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          elevation: 10,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp), label: "WishList"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}

class HomeContent extends StatefulWidget {
  final VoidCallback onWishlistChanged;
  const HomeContent({super.key, required this.onWishlistChanged});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Map<String, String>> brands = const [
    {"name": "Nike", "logo": "https://pngimg.com/uploads/nike/nike_PNG12.png"},
    {"name": "Adidas", "logo": "https://www.freepnglogos.com/uploads/adidas-logo-photo-png-3.png"},
    {"name": "Puma", "logo": "https://upload.wikimedia.org/wikipedia/tr/b/b1/Puma_Logo.png"},
    {"name": "Reebok", "logo": "https://1000logos.net/wp-content/uploads/2017/05/Reebok-logo.png"},
    {"name": "Jordan", "logo": "https://static.vecteezy.com/system/resources/previews/027/127/562/non_2x/jordan-logo-jordan-icon-transparent-free-png.png"},
    {"name": "NB", "logo": "https://www.freepnglogos.com/uploads/new-balance-png-logo/womens-stylish-shoes-new-balance-png-logo-1.png"},
    {"name": "fila", "logo": "https://icon-icons.com/download-file?file=https%3A%2F%2Fimages.icon-icons.com%2F2845%2FPNG%2F512%2Ffila_logo_icon_181400.png&id=181400&pack_or_individual=pack"},
    {"name": "Amiri", "logo": "https://1000logos.net/wp-content/uploads/2024/02/Amiri-Emblem.png"},
    {"name": "LV", "logo": "https://images.seeklogo.com/logo-png/55/2/louis-vuitton-logo-png_seeklogo-550178.png"},
    {"name": "Gucci", "logo": "https://www.pngplay.com/wp-content/uploads/9/Gucci-PNG-Images-HD.png"}
  ];

  final List<Map<String, String>> products = const [
    {"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwMSj56ZPUMUzf_ZBgrx8ZUy1SDTyq6Rtn3w&s", "name": "Nike Sportswear Club Fleece", "price": "\$99"},
    {"image": "https://www.kershkicks.co.uk/cdn/shop/files/Screenshot_2024-07-12_at_9.11.59_pm.png?v=1720821499", "name": "Trail Running Jacket Nike", "price": "\$110"},
    {"image": "https://dafakar.com/cdn/shop/files/3stripBlackAdidasLogoHoodiewhite_500x.jpg?v=1762330853", "name": "Adidas Hoodie", "price": "\$120"},
    {"image": "https://i.pinimg.com/736x/6f/05/8b/6f058b4c1b26f79f1c24300c62f841d6.jpg", "name": "Puma T-Shirt", "price": "\$80"},
    {"image": "https://www.sportsdirect.com/images/products/42229099_h.jpg", "name": "Rebook T-shirt ", "price": "\$75"},
    {"image": "https://img01.ztat.net/article/spp-media-p1/6839e6c8081a4894acce745ecf6bb925/ab9c90f4396745bd9ec2a63d9407797f.jpg?imwidth=762&filter=packshot", "name": "Jordan hoodie", "price": "\$150"},
    {"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7WmKOGW9EHo9Cs2odhVyFQcWq5U7L5sPQKw&s", "name": "Gucci T-Shirt", "price": "\$200"},
    {"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRuMBminBOeNaTWdu5f1Rw22mhcu-geZgxRA&s", "name": "New Balance trouser", "price": "\$99"},
    {"image": "https://amiri.com/cdn/shop/files/7cb19c81-71f4-4a1f-b794-ef29b276edbf_grande.jpg?v=1733525899", "name": "Amiri T-Shirt", "price": "\$110"},
    {"image": "https://customfreaks.store/wp-content/uploads/2022/02/133_12019674-4234-424a-b43e-1c11994364e6.png", "name": "LV Jacket", "price": "\$250"},
    {"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZGIe5l4Mrx5Vba8nQzyyx6cb45JLn7TYDGg&s", "name": "Fila Track suit", "price": "\$120"},
    {"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7oPzRyUnqKv-CeY8R4vKqj2z48LKXa-W5Sw&s", "name": "Nike hoodie", "price": "\$145"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Ecommerce",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.deepPurple),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.deepPurple),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome User',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PersnolprofilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_sharp),
              title: const Text('Wish list'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.deepPurple),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Search",
                  hintText: "Search your favorite shoes",
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                  suffixIcon: IconButton(icon: const Icon(Icons.mic, color: Colors.deepPurple), onPressed: () {}),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.deepPurple.withOpacity(0.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: brands.map((brand) {
                  return GestureDetector(
                    onTap: () {
                      Widget page;
                      switch (brand["name"]) {
                        case "Nike": page = const NikePage(); break;
                        case "Adidas": page = const AdidasPage(); break;
                        case "Puma": page = const PumaPage(); break;
                        case "Reebok": page = const ReebokPage(); break;
                        case "Jordan": page = const JordanPage(); break;
                        case "NB": page = const NewbalancePage(); break;
                        case "fila": page = const FilaPage(); break;
                        case "Amiri": page = const AmiriPage(); break;
                        case "LV": page = const LvPage(); break;
                        case "Gucci": page = const GucciPage(); break;
                        default: return;
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(10),
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(brand["logo"]!, width: 40, height: 40, errorBuilder: (context, error, stackTrace) => const Icon(Icons.error)),
                          const SizedBox(height: 8),
                          Text(brand["name"]!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Popular Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewArrivalsPage())),
                    child: const Text("See all", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  bool isWishlisted = WishlistData.wishlistItems.any((e) => e['name'] == product['name']);

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
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
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.05),
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Image.network(product["image"]!, fit: BoxFit.contain),
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
                                    widget.onWishlistChanged();
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
                                  ElevatedButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage(product: product)));
                                  },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                      minimumSize: Size(80, 40),
                                    ),
                                      child: Text("Buy now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      )),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewArrivalsPage()));
            }, child: Text("View all..",
            style:  TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            )),
            )
          ],
        ),
      ),
    );
  }
}
