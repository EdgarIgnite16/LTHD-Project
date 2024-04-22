import 'package:btap3/models/news_item.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final NewsItem newsItem;

  const DetailScreen({
    required this.newsItem,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    // No need for data fetching here since data is passed from NewsItemCard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newsItem.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(widget.newsItem.description),
            const SizedBox(height: 10.0),
            Center(
              child: widget.newsItem.imageUrl != null
                  ? Image.network(
                      widget.newsItem.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity, // Adjust image width as needed
                    )
                  : Image.network(
                      'https://static-00.iconduck.com/assets.00/no-image-icon-512x512-lfoanl0w.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 100,
                    ),
            ), // Add SizedBox for spacing even if no image
          ],
        ),
      ),
    );
  }
}
