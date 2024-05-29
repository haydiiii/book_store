import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'imageUrl': 'https://example.com/category1.jpg',
      'title': 'Fiction',
    },
    {
      'imageUrl': 'https://example.com/category2.jpg',
      'title': 'Non-Fiction',
    },
    // Add more categories here
  ];

  CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.75,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryWidget(
              imageUrl: categories[index]['imageUrl']!,
              title: categories[index]['title']!,
            );
          },
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryWidget({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 120,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
