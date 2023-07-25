import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/colors/colors.dart';
import 'presentation/screens/home screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()  {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true, 
      designSize: const Size(360, 800),
      builder: ((context, child) {
        return MaterialApp(
          title: 'Employee Management System',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: kBGcolor,
            primarySwatch: Colors.blueGrey,
          ),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
