import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxscrollmixin/pages/user_list_controller.dart';
import 'package:getxscrollmixin/pages/user_list_page.dart';
import 'package:getxscrollmixin/repositories/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Scroll Mixin',
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(
          () => Dio(BaseOptions(baseUrl: 'http://192.168.1.2:8080/')),
          fenix: true,
        );
        Get.lazyPut(
          () => UserRepository(dio: Get.find()),
          fenix: true,
        );
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: BindingsBuilder.put(() => UserListController(
                userRepository: Get.find(),
              )),
          page: () => UserListPage(),
        ),
      ],
    );
  }
}
