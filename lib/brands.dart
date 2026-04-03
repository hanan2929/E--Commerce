import 'package:flutter/material.dart';
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


class BrandsPage extends StatelessWidget {
  final List<Map<String, String>> brands = [
    {
      "name": "Nike",
      "logo": "https://pngimg.com/uploads/nike/nike_PNG12.png"
    },
    {
      "name": "Adidas",
      "logo": "https://www.freepnglogos.com/uploads/adidas-logo-photo-png-3.png"
    },
    {
      "name": "Puma",
      "logo": "https://upload.wikimedia.org/wikipedia/tr/b/b1/Puma_Logo.png"
    },
    {
      "name" : "Reebok",
      "logo": "https://1000logos.net/wp-content/uploads/2017/05/Reebok-logo.png"
    },
    {
      "name" : "Jordan",
      "logo" : "https://static.vecteezy.com/system/resources/previews/027/127/562/non_2x/jordan-logo-jordan-icon-transparent-free-png.png"
    },
    {
      "name" : "NB",
      "logo" : "https://www.freepnglogos.com/uploads/new-balance-png-logo/womens-stylish-shoes-new-balance-png-logo-1.png"
    },
    {
      "name" : "fila",
      "logo" : "https://icon-icons.com/download-file?file=https%3A%2F%2Fimages.icon-icons.com%2F2845%2FPNG%2F512%2Ffila_logo_icon_181400.png&id=181400&pack_or_individual=pack"
    },
    {
      "name" : "Amiri",
      "logo" : "https://1000logos.net/wp-content/uploads/2024/02/Amiri-Emblem.png"
    },
    {
      "name" : "LV",
      "logo" : "https://images.seeklogo.com/logo-png/55/2/louis-vuitton-logo-png_seeklogo-550178.png"
    },
    {
      "name" : "Gucci",
      "logo" : "https://www.pngplay.com/wp-content/uploads/9/Gucci-PNG-Images-HD.png"
    }
  ];
    BrandsPage({super.key});
@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.grey,
      title: const Text("All Brands here",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      centerTitle: true,
    ),
    body:
    SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10 , left: 20 , right:10 ),
      child:
      Column(
        children: [
      TextField(
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search here",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.mic,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          )
      ),
         Padding(
          padding: const EdgeInsets.only(top:10 , left: 20,right: 10),
          child: Column(
            children: brands.map((brand) {
              return GestureDetector(
                  onTap: () {
                    if (brand["name"] == "Nike") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NikePage()),
                      );
                    }
                    else if (brand["name"] == "Adidas") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdidasPage()),
                      );
                    }
                    else if (brand["name"] == "Puma") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PumaPage()),
                      );
                    }
                    else if (brand["name"] == "Reebok") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReebokPage()),
                      );
                    }
                    else if (brand["name"] == "Jordan") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JordanPage()),
                      );
                    }
                   else if (brand["name"] == "NB") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewbalancePage()),
                      );
                    }
                   else if (brand["name"] == "fila") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilaPage()),
                      );
                    }
                   else if (brand["name"] == "Amiri") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AmiriPage()),
                      );
                    }
                   else if (brand["name"] == "LV") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LvPage()),
                      );
                    }
                   else if (brand["name"] == "Gucci") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GucciPage()),
                      );
                    }


                  },
                  child: Container(
                margin: const EdgeInsets.only(right: 12 , bottom: 10),
                padding: const EdgeInsets.all(50),
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      brand["logo"]!,
                      width: 250,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.white);
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      brand["name"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
                  ),
              );
            }).toList(),
          )
      ),
    ]
    ),
  )
  );
}
}