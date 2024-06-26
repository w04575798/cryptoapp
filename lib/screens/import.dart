// import.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/walletProvider.dart';
import 'wallet.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  _ImportWalletState createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  String verificationText = '';

  void verifyMnemonic() async {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    // Call the getPrivateKey function from the WalletProvider
    final privateKey = await walletProvider.getPrivateKey(verificationText);

    if (privateKey != null) {
      // Navigate to the WalletPage with the private key and walletProvider
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WalletPage(
            privateKey: privateKey,
            walletProvider: walletProvider,
          ),
        ),
      );
    } else {
      // Show an error message if verification fails
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid mnemonic phrase.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Seed'),
      ),
      backgroundColor: Color(0xFF6CE4AC), // Set background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please Enter Your Key:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
            const SizedBox(height: 24.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter mnemonic phrase',
                filled: true,
                fillColor: Colors.white, // Set text field color to white
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: verifyMnemonic,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFBC700), // Yellow color
              ),
              child: Text(
                'Import',
                style: TextStyle(color: Colors.black), // Set button text color to grey
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
