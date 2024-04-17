//generateKey.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/walletProvider.dart';

class GenerateKeyScreen extends StatelessWidget {
  const GenerateKeyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account', style: TextStyle(color: Colors.white)), // Change header text color to white
      ),
      backgroundColor: Color(0xFF6CE4AC),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Change header text color to white
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final walletProvider = Provider.of<WalletProvider>(context, listen: false);
                  final mnemonic = await walletProvider.generateMnemonic();
                  final privateKey = await walletProvider.getPrivateKey(mnemonic);
                  final publicKey = await walletProvider.getPublicKey(privateKey);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GeneratedKeysScreen(
                        mnemonic: mnemonic,
                        privateKey: privateKey,
                        publicKey: publicKey.hex,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFBC700),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: const Text(
                  'Generate Key',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Change button text color to grey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GeneratedKeysScreen extends StatelessWidget {
  final String mnemonic;
  final String privateKey;
  final String publicKey;

  const GeneratedKeysScreen({
    required this.mnemonic,
    required this.privateKey,
    required this.publicKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allKeys = 'Mnemonic: $mnemonic\nPrivate Key: $privateKey\nPublic Key: $publicKey';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Key'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText(allKeys),
      ),
    );
  }
}
