import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:html/parser.dart' as html; // For image handling

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Science News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class NewsItem {
  final String title;
  final String link;
  final String description;
  final String? imageUrl;

  NewsItem(this.title, this.link, this.description, {this.imageUrl});

  factory NewsItem.fromRssItem(RssItem item) {
    String? imageUrl;
    String descriptionText = '';

    // Parsing HTML content to extract image URL
    if (item.content != null) {
      final document = html.parse(item.content!.value);
      final imageElement = document.querySelector('img');
      imageUrl = imageElement?.attributes['src'];
    }

    // Extracting text after </br> in the description HTML
    final descriptionRegExp = RegExp(r'</br>(.*?)$');
    final matches = descriptionRegExp.allMatches(item.description ?? '');
    if (matches.isNotEmpty) {
      descriptionText = matches.first.group(1) ?? '';
    }

    return NewsItem(
      item.title ?? '',
      item.link ?? '',
      descriptionText.trim(), // Trimming whitespace from extracted text
      imageUrl: imageUrl,
    );
  }
}

class _HomePageState extends State<HomePage> {
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
        title: Text('Science News'),
        backgroundColor: Colors.greenAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: scienceNews.length,
        itemBuilder: (context, index) => NewsItemCard(newsItem: scienceNews[index]),
      ),
    );
  }
}

class NewsItemCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsItemCard({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: newsItem.imageUrl != null
            ? Image.network(newsItem.imageUrl!, fit: BoxFit.cover, width: 50, height: 50)
            : null,
        title: Text(newsItem.title),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(newsItem: newsItem), // Pass the NewsItem object
          ),
        ),
      ),
    );
  }
}


class NewsDetailPage extends StatefulWidget {
  final NewsItem newsItem;

  const NewsDetailPage({required this.newsItem});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    super.initState();
    // No need for data fetching here since data is passed from NewsItemCard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newsItem.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(widget.newsItem.description),
            SizedBox(height: 10.0),
            if (widget.newsItem.imageUrl != null) // Display image if imageUrl is not null
              Image.network(
                widget.newsItem.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity, // Adjust image width as needed
              ), // Add SizedBox for spacing even if no image
          ],
        ),
      ),
    );
  }
}
