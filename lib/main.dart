import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_working/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter_working/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter_working/responsive/web_screen_layout.dart';
import 'package:instagram_flutter_working/screens/signup_screen.dart';
import 'package:instagram_flutter_working/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // make sure that the flutter widget makes initialized
  if (kIsWeb) {
    // checks if the app is run on a website, and so provides the correct firebase setup for it, otherwise it will load the mobile-app firebase-initialize parameters
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyD0d_keU5D6srlSNBq1xMnh9X0adaRqkg8',
            appId: '1:566570089831:web:74a0f40089323e5419c3c2',
            messagingSenderId: '566570089831',
            projectId: 'instagram-working',
            storageBucket: 'instagram-working.appspot.com'));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //deletes the debug text
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SignupScreen(),
      /*
       ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
      */
    );
  }
}
