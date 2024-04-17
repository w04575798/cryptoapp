//wallet.dart
import 'package:flutter/material.dart';
import 'package:crypto_app/providers/walletProvider.dart';
import '../providers/balances.dart'; 
import 'package:web3dart/web3dart.dart';

class WalletPage extends StatefulWidget {
  final String privateKey;
  final WalletProvider walletProvider;

  const WalletPage({Key? key, required this.privateKey, required this.walletProvider}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String balance = '';

  @override
  void initState() {
    super.initState();
    loadBalance();
  }

  Future<void> loadBalance() async {
    try {
      // Call getPublicKey to get the address
      EthereumAddress address = await widget.walletProvider.getPublicKey(widget.privateKey);
      
      // Call getBalances to get the balance
      String response = await getBalances(address.hex, 'your-chain-name');

      // Update the balance state variable
      setState(() {
        balance = response;
      });
    } catch (error) {
      print('Error loading balance: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor:Color(0xFF6CE4AC),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Private Key: ${widget.privateKey}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Balance: $balance',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
