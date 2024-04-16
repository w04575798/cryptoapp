import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  final String privateKey; // Define privateKey parameter

  const WalletPage({Key? key, required this.privateKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Text(
          'Private Key: $privateKey', // Display the private key
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
