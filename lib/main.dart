import 'package:flutter/material.dart';
import 'package:food_ordering_application/screens/food_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'food ordering application',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FoodMenuScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:food_ordering_application/screens/food_menu_screen.dart';

// void main() {
//   runApp(DevicePreview(
//     enabled: true, // Set to false in production to disable DevicePreview
//     builder: (context) => const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Food Ordering Application',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const FoodMenuScreen(),
//       locale: DevicePreview.locale(context), // Add locale for previewing language changes
//       builder: DevicePreview.appBuilder, // Use DevicePreview's app builder
//     );
//   }
// }
