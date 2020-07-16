import 'package:SmartQ/providers/AuthProvider.dart';
import 'package:SmartQ/screens/login_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, authProvider, _) {
          return BotToastInit(
            child: MaterialApp(
              navigatorObservers: [
                BotToastNavigatorObserver()
              ], //toast listener
              home: authProvider.isAuth
                  ? HomePage()
                  : FutureBuilder(
                      future: authProvider.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) => authResultSnapshot
                                  .connectionState ==
                              ConnectionState.waiting
                          ? Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.indigo,
                                title: Text("Dont go anywhere !s"),
                                centerTitle: true,
                              ),
                              backgroundColor: Colors.white,
                              body: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 50),
                                      child: Text(
                                        "Getting things ready for you",
                                        style: GoogleFonts.lato(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : LoginScreen(),
                    ),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
