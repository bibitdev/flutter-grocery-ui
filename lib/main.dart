import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/models/product_model.dart';
import 'package:flutter_grocery_ui/pages/item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = ProductModel(
    'Bayam',
    '2.000',
    '1ikat',
    'assets/img1.png',
    'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral, dan serat pangan. Sebagian vitamin dan mineral yang terkandung dalam sayuran dan buah-buahan berperan untuk membantu proses-proses metabolisme di dalam tubuh, sedangkan antioksidan mampu menangkal senyawa-senyawa hasil oksidasi, radikal bebas, yang mampu menurunkan kondisi kesehatan tubuh',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Center(
          child: Text(
            'Toko Buah & Sayur',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              Badge(
                label: const Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ]),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: allData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return ItemWidget(product: allData[index]);
          },
        ),
      ),
    );
  }
}
