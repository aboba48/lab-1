import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF283593)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final Color primaryBlue = const Color.fromARGB(255, 147, 40, 122); 
  final Color lightBlue = const Color.fromARGB(255, 246, 100, 190);   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        title: const Text(
          'Where do you want to travel?',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Верхній  блок (Пошук)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
              decoration: BoxDecoration(
                color: primaryBlue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Row(
                children: [
                  // Кнопка-сітка
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.grid_view, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Рядок Select Destination
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: lightBlue.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Text('Select Destination', style: TextStyle(color: Colors.white, fontSize: 15)),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Кнопка пошуку
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Icon(Icons.search, color: primaryBlue),
                  ),
                ],
              ),
            ),

            // 2. Best Deals
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Text(
                'Best Deals',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            // 3. Список Best Deals
            SizedBox(
              height: 200, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    buildCard('El Cairo', 'Egypt', '\$260', Colors.orange, showImage: false, width: 160),
                    buildCard('London', 'England', '\$330', const Color.fromARGB(255, 243, 33, 194), showImage: false, width: 160),
                  ],
                ),
              ),
            ),

            // 4. Заголовок Popular 
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
              child: Text(
                'Popular Destinations',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            // 5. Список Popular (З фото, без цін)
            SizedBox(
              height: 240, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    buildCard('Cancun', 'Mexico', '', Colors.teal, showFooter: false, width: 220),
                    buildCard('Santorini', 'Greece', '', Colors.deepOrange, showFooter: false, width: 220),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Нижня навігація
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 210, 25, 176),
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 28), label: ''),
        ],
      ),
    );
  }

  // Універсальна функція для карток
  Widget buildCard(String city, String country, String price, Color color, 
      {bool showImage = true, bool showFooter = true, double width = 200}) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 15),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showImage)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Icon(Icons.landscape, size: 50, color: Colors.grey[400]),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(city, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(country, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                if (showFooter) ...[
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('More', style: TextStyle(color: const Color.fromARGB(255, 246, 100, 234), fontWeight: FontWeight.w500)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 66, 182),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}