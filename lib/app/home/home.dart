import 'package:flutter/material.dart';
import 'package:ftec5520_client/app/wallet/wallet.dart';

import '../contract/purchased_contract_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<WalletState> _walletKey = GlobalKey<WalletState>();
  final GlobalKey<PurchasedContractListState> _purchasedContractListKey =
      GlobalKey<PurchasedContractListState>();

  void _refresh() {
    print('refresh');
    _walletKey.currentState!.getWalletData();
    _purchasedContractListKey.currentState!.getPurchasedContracts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Contract'),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Wallet(key: _walletKey),
          const SizedBox(height: 12),
          PurchasedContractList(key: _purchasedContractListKey),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/flight-list');
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.health_and_safety,
          size: 30,
        ),
      ),
    );
  }
}
