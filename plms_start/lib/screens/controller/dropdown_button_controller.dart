import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu { DEFAULT, MENU1, MENU2 }
enum DropDownMenu2 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.DEFAULT:
        return 'catagory1';
      case DropDownMenu.MENU1:
        return 'catagory2';
      case DropDownMenu.MENU2:
        return 'catagory3';
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.DEFAULT.obs;

  void changeDropDownMenu(int? itemIndex) {
    var selectedItem =
        DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }
}
