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
    final walletProvider =
        Provider.of<WalletProvider>(context, listen: false);

    // Call the getPrivateKey function from the WalletProvider
    final privateKey = await walletProvider.getPrivateKey(verificationText);

    if (privateKey != null) {
      // Navigate to the WalletPage with the private key
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletPage(privateKey: privateKey)),
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
        title: const Text('Import from Seed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please Enter your mnemonic phrase:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter mnemonic phrase',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: verifyMnemonic,
              child: const Text('Import'),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
