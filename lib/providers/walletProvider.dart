//walletProvidert.dart
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';

abstract class WalletAddressService { 

    String generateMnemonic();
    Future<String> getPrivateKey(String mnemonic);
    Future<EthereumAddress> getPublicKey(String privateKey);

}
class WalletProvider extends ChangeNotifier implements WalletAddressService { 
  @override 
  String generateMnemonic() { 
    return bip39.generateMnemonic();
  }

  @override 
  Future<String> getPrivateKey(String mnemonic) async { 
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async { 
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }
}