import 'package:get/get.dart';
import 'package:kienapp/features/secureapp/dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }

}