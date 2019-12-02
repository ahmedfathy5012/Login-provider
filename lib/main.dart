import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';
import 'pages/user_info_page.dart';
import 'package:provider/provider.dart';
import 'repositories/user_repository.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (_) => UserRepository.instance(),
        child: Consumer(
          builder: (context,UserRepository user , _){
            switch (user.status) {
                case Status.Uninitialized:
                return SplashPage();
                break;
                case Status.Unauthenticated:
                case Status.Authenticating:
                return LoginPage();
                break;
                case Status.Authenticated:
                return UserInfoPage(user.user);
                break;
              default:
            }
          },
        ),
    );
  }
}