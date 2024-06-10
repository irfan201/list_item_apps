import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_item_apps/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
