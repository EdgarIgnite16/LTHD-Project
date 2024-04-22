import 'dart:developer';

import 'package:btap4/models/AreaInfo.dart';
import 'package:btap4/models/OfficesInfo.dart';
import 'package:btap4/models/OfficialsInfo.dart';

class DataOutput {
  AreaInfo normalizedInput;
  List<OfficesInfo> officesInfo;
  List<OfficialsInfo> officialsInfo;

  DataOutput({
    required this.normalizedInput,
    required this.officesInfo,
    required this.officialsInfo,
  });

  static DataOutput fromJson(Map<String, dynamic> json) {
    AreaInfo normalizedInputValue = AreaInfo.fromJson(json["normalizedInput"]);

    List<OfficesInfo> officesInfoValue = json["offices"].map<OfficesInfo>((item) {
      return OfficesInfo.fromJson(item);
    }).toList();

    List<OfficialsInfo> officialsInfoValue = json["officials"].map<OfficialsInfo>((item) {
      return OfficialsInfo.fromJson(item);
    }).toList();

    return DataOutput(normalizedInput: normalizedInputValue, officesInfo: officesInfoValue, officialsInfo: officialsInfoValue);
  }
}
