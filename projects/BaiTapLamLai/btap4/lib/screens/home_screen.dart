import 'package:btap4/models/AreaInfo.dart';
import 'package:btap4/models/DataOutput.dart';
import 'package:btap4/services/ApiService.dart';
import 'package:btap4/widgets/custom_app_bar.dart';
import 'package:btap4/widgets/profile_item.dart';
import 'package:btap4/widgets/show_location_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late ApiService api;
  late Future<DataOutput> data;

  HomeScreenState() {
    api = ApiService();
  }

  @override
  void initState() {
    super.initState();
    data = api.fetchData("90001");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressedOfSearchButton: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController keySearch = TextEditingController();
              return AlertDialog(
                title: const Text('Enter Something'),
                content: TextField(
                  controller: keySearch,
                  decoration: const InputDecoration(hintText: 'Type here...'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        data = api.fetchData(keySearch.text);
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Search'),
                  ),
                ],
              );
            },
          );
        },
        onPressOfQuestionMarkButton: () {},
      ),
      body: SafeArea(
        child: FutureBuilder<DataOutput>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                AreaInfo? normalizedInput = snapshot.data?.normalizedInput;
                return Column(
                  children: [
                    ShowLocationHeader(
                      localtion: "${normalizedInput?.city} ${normalizedInput?.state} ${normalizedInput?.zip}",
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        children: snapshot.data!.officesInfo.map<Widget>(
                          (item) {
                            return ProfileItem(
                              normalizedInput: snapshot.data!.normalizedInput,
                              officesInfo: item,
                              officialsInfo: snapshot.data!.officialsInfo,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Don't have data");
              }
            }),
      ),
    );
  }
}
