import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/models/model_system.dart';
import 'package:plms_start/screens/models/model_system_list.dart';

class DataRepository extends GetConnect {
  static DataRepository get to => Get.find();

  // var api = dotenv.env['PHONE_IP'];
  var api = dotenv.env['EMUL_IP'];

  @override
  void onInit() {
    httpClient.baseUrl = api;
    super.onInit();
  }

  Future<SystemList> loadSystem() async {
    String url = '/summury/systems';
    print('되냐?');
    final response = await get(url);
    print('response: $response');
    print(response.body);
    print('되냐????');
    // print(response.body[1]);

    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      print('되냐??????????????????');
      return SystemList.fromJson(response.body);
    }
  }
  // Future<System> loadSystem() async {
  //   List data = [];
  //   // List body = response.body;
  //   String url = '/summury/systems';
  //   print('되냐?');
  //   final response = await get(url);
  //   List body = response.body;
  //   print('response: ${response.runtimeType}');
  //   print(body);
  //   print('되냐????');
  //   print(body[1]);
  //   print('되냐??????????????????');

  //   for (int i = 0; i < body.length; i++) {
  //     data.add(System.fromJson(body[i]));
  //   }
  //   return data[1];
  // }
}
