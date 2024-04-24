import 'package:webfeed/domain/rss_item.dart';
import 'package:html/parser.dart' as html; // For image handling

class NewsItem {
  final String title;
  final String link;
  final String description;
  final String? imageUrl;

  NewsItem(this.title, this.link, this.description, {this.imageUrl});

  factory NewsItem.fromRssItem(RssItem item) {
    String? imageUrl;
    String descriptionText = '';

    final imageElement = item.enclosure;
    imageUrl = imageElement?.url;

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
