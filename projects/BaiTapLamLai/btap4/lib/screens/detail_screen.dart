import 'dart:io';

import 'package:btap4/models/AreaInfo.dart';
import 'package:btap4/models/OfficialsInfo.dart';
import 'package:btap4/services/ApiService.dart';
import 'package:btap4/widgets/custom_app_bar.dart';
import 'package:btap4/widgets/show_location_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.normalizedInput,
    required this.officialsInfo,
  });

  final AreaInfo normalizedInput;
  final OfficialsInfo officialsInfo;
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? address = officialsInfo.address;
    List<String>? phones = officialsInfo.phones;
    List<String>? emails = officialsInfo.emails;
    List<String>? urls = officialsInfo.urls;
    List<Map<String, dynamic>>? channels = officialsInfo.channels;

    return Scaffold(
      appBar: CustomAppBar(
        onPressedOfSearchButton: () {},
        onPressOfQuestionMarkButton: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            ShowLocationHeader(localtion: "${normalizedInput.city} ${normalizedInput.state} ${normalizedInput.zip}"),
            Expanded(
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Tên
                    Text(
                      officialsInfo.name ?? "",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Phân loại
                    Text(
                      officialsInfo.party ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Hình ảnh
                    officialsInfo.photoUrl != null
                        ? FadeInImage.assetNetwork(
                            placeholder: 'assets/images/placeholder.jpg', // Before image load
                            image: officialsInfo.photoUrl ?? "", // After image load
                            height: 200,
                            width: 300,
                          )
                        : Image.asset(
                            "assets/images/default.jpg",
                            width: 300,
                            height: 200,
                          ),
                    const SizedBox(height: 10),

                    /// Địa chỉ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Address: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${address?[0]["line1"]}\n${address?[0]["city"]} ${address?[0]["state"]} ${address?[0]["zip"]}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    /// Số điện thoại
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Phone: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            phones?.map((item) => item).toList().join("\n") ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    /// Email
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Email: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emails?.map((item) => item).toList().join("\n") ?? "No data provided",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    /// Website
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Website: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            urls?.map((item) => item).toList().join("\n") ?? "No data provided",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: channels?.map<Widget>((item) {
                              return GestureDetector(
                                onTap: () {
                                  apiService.lauchSocialMedia(item["type"], item["id"]);
                                },
                                child: Image.asset(
                                  'assets/images/${item["type"]}.png',
                                  width: 50,
                                  height: 50,
                                ),
                              );
                            }).toList() ??
                            [const Text("")],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
