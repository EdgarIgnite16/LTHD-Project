import 'package:btap3/models/news_item.dart';
import 'package:btap3/widgets/news_item_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String rssFeedUrl = 'https://vnexpress.net/rss/khoa-hoc.rss';
  List<NewsItem> scienceNews = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(rssFeedUrl));
      if (response.statusCode == 200) {
        final feed = RssFeed.parse(response.body);
        scienceNews = feed.items!.map((item) => NewsItem.fromRssItem(item)).toList();
      } else {
        throw Exception('Failed to load RSS feed');
      }
    } on Exception catch (e) {
      // Handle errors gracefully (e.g., display an error message)
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Science News'),
        backgroundColor: Colors.greenAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: scienceNews.length,
              itemBuilder: (context, index) => NewsItemCard(newsItem: scienceNews[index]),
            ),
    );
  }
}
