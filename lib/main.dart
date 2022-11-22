import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/model/user_model.dart';
import 'components/page/auth/login_page.dart';
import 'components/page/home_page.dart';

void main() {
  WidgetsFlutterBinding();
  initializeDateFormatting('id_ID').then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Apps',
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primaryColor,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primaryColor,
          secondary: AppColor.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: FutureBuilder(
        future: Session.getUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.data != null && snapshot.data?.idUser != null) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
