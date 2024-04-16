//main dart 
import 'screens/home_screen.dart'; 
import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'package:provider/provider.dart'; 
import 'providers/walletProvider.dart';
import 'screens/generateKey.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WalletProvider>(
          create: (_) => WalletProvider(),
        ),
        // Add other providers as needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}