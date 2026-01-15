import 'package:e_commerce/features/common/ui/controllers/main_bottom_navbar_controller.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController());
  }

}