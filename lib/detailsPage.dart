import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? photoUrl;
  final String? title;
  final String id;

  const DetailsPage({
    super.key,
    required this.photoUrl,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photoUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.all(10.0),
                height: 400,
                width: 400,
              ),

            ),
            const SizedBox(height: 8),
            Text('Title: $title', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('ID: $id', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
