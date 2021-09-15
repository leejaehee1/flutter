import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/models/model_system.dart';
import 'package:plms_start/screens/models/model_system_list.dart';

class DataRepository extends GetConnect {
  static DataRepository get to => Get.find();

  var api = dotenv.env['PHONE_IP'];

  @override
  void onInit() {
    httpClient.baseUrl = api;
    super.onInit();
  }

  Future<SystemList> loadSystem() async {
    String url = '/summury/systems';
    final response = await get(url);
    print(response.body);
    print(response.body[1]);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return SystemList.fromJson(response.body);
    }
  }
}
