import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String imgPath =
      "https://plus.unsplash.com/premium_photo-1678099940967-73fe30680949?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.black),
        title: const Text('Pune', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.08,
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: 'Search products',
                  fillColor: const Color.fromARGB(81, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 150.0, autoPlay: true),
              items: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color.fromARGB(255, 146, 10, 0),
                  ),
                  child: Row(
                    children: [
                      // Image container (half width)
                      Flexible(
                        flex: 1, // Allocate equal space
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            imgPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Text container (half width with flexible text)
                      const Flexible(
                        flex: 1, // Allocate equal space
                        child: Center(
                          child: Text(
                            'Lorem Ipsum asdhb andbad jasdajdi jdajd', // Adjust text as needed
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis, // Handle overflow
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Add more containers for additional banners if needed
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // spacing: 10.0,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterChip(label: const Text('All'), onSelected: (val) {}),
                  FilterChip(label: const Text('TVS'), onSelected: (val) {}),
                  FilterChip(label: const Text('WIRE'), onSelected: (val) {}),
                  FilterChip(label: const Text('remote'), onSelected: (val) {}),
                  FilterChip(label: const Text('usb'), onSelected: (val) {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4, // Change this count based on your data
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
