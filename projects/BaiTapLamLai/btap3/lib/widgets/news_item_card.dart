import 'package:btap3/models/news_item.dart';
import 'package:btap3/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NewsItemCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsItemCard({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: newsItem.imageUrl != null
            ? Image.network(
                newsItem.imageUrl!,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              )
            : null,
        title: Text(newsItem.title),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(newsItem: newsItem), // Pass the NewsItem object
          ),
        ),
      ),
    );
  }
}
