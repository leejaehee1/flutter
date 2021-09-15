import 'package:get/get.dart';
import 'package:plms_start/screens/models/model_system.dart';
import 'package:plms_start/screens/models/model_system_list.dart';
import 'package:plms_start/screens/repository/data_repository.dart';

class DataController extends GetxController {
  static DataController get to => Get.find();

  Rx<SystemList> systemData = SystemList(system: []).obs;

  @override
  void onInit() {
    _dataLoad();
    super.onInit();
  }

  Future<void> _dataLoad() async {
    SystemList system = await DataRepository.to.loadSystem();
    print("여기에 시스템 있어요!!!!!!!!!!");
    print(system.system.length);
    systemData(system);
  }
}
