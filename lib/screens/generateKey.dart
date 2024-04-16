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
                // Display the mnemonic, private key, and public key
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Generated Keys'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Mnemonic: $mnemonic'),
                        Text('Private Key: $privateKey'),
                        Text('Public Key: $publicKey'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Generate Keys'),
            ),
          ],
        ),
      ),
    );
  }
}
