import 'package:flutter/material.dart';
import 'package:restautrant_booking_app/screens/restaurant_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantListScreen(),
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  final List<String> restaurantImages = [
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/restaurant4.webp',
    'assets/restaurant5.jpg',
    'assets/restaurant6.jpg',
    'assets/restaurant7.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '3733 restaurants',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChipWidget(label: 'All', isSelected: true),
                FilterChipWidget(label: 'Offers', isSelected: false),
                FilterChipWidget(label: 'Best rated', isSelected: false),
                FilterChipWidget(label: 'Cuisine', isSelected: false),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: restaurantImages.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(imageUrl: restaurantImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  FilterChipWidget({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.teal,
      onSelected: (bool selected) {},
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imageUrl;

  RestaurantCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantDetailsScreen()));
              },
              child: Text(
                'View more',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
