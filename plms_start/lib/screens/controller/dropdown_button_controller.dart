import 'package:get/get.dart';

enum DropDownMenu { DEFAULT, MENU1, MENU2 }

extension DropDownMenuExtention on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.DEFAULT:
        return '기본매뉴';
      case DropDownMenu.MENU1:
        return '메뉴1';
      case DropDownMenu.MENU2:
        return '메뉴2';
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
