import 'dart:convert';
import 'dart:io';
import 'package:btap4/models/DataOutput.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ApiService {
  String key = "AIzaSyAGx-Xog2AU_hSO3SS6vlpPxtaWjhsgC_Q";

  Future<DataOutput> fetchData(String keySearch) async {
    String URL =
        "https://www.googleapis.com/civicinfo/v2/representatives?key=$key&address=$keySearch";
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      return DataOutput.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> lauchSocialMedia(String type, String id) async {
    if (type == "Facebook") {
      await _openFacebook(id);
    } else if (type == "Twitter") {
      _openTwitter(id);
    }
  }

  Future<void> _openFacebook(String id) async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/${id}';
    } else {
      fbProtocolUrl = 'fb://page/${id}';
    }

    String fallbackUrl = 'https://www.facebook.com/${id}';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      throw 'Could not launch $fallbackUrl';
    }
  }

  Future<void> _openTwitter(String id) async {
    Uri twitterPageUrl = Uri.parse('https://www.twitter.com/${id}');

    if (await canLaunchUrl(twitterPageUrl)) {
      await launchUrl(twitterPageUrl);
    } else {
      throw 'Could not launch $twitterPageUrl';
    }
  }
}
