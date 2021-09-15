import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class DataRepository extends GetConnect {
  static DataRepository get to => Get.find();

  var api = dotenv.env['PHONE_IP'];

  @override
  void onInit() {
    httpClient.baseUrl = api;
    super.onInit();
  }

  loadSystem() async {
    String url = '/summury/system';
    final response = await get(url);
    // if (response)
  }
}
