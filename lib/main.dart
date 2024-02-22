 //import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
//import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
// import 'package:ecommerce_app/views/pages/cart_page.dart';
// import 'package:ecommerce_app/views/pages/favorites_page.dart';
// import 'package:ecommerce_app/views/pages/home_page.dart';
//import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_app/utils/route/app_router.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';



import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: AppTheme.lightTheme(),
      home: const CustomBottombarNavbar(),
      initialRoute: AppRoutes.homeLogin,
     onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}