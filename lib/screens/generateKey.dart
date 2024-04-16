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
        title: const Text('Generate Mnemonic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Ensure that GenerateKeyScreen is under the MultiProvider or Provider<WalletProvider>
                final walletProvider = Provider.of<WalletProvider>(context, listen: false);
                final mnemonic = await walletProvider.generateMnemonic();
                final privateKey = await walletProvider.getPrivateKey(mnemonic);
                final publicKey = await walletProvider.getPublicKey(privateKey);
                // Display the mnemonic, private key, and public key as text
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GeneratedKeysScreen(
                      mnemonic: mnemonic,
                      privateKey: privateKey,
                      publicKey: publicKey.hex, // Convert EthereumAddress to String
                    ),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
          ],
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
        title: const Text('Generated Keys'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText(allKeys),
      ),
    );
  }
}
