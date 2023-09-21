import 'package:flutter/material.dart';

import 'details_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InboundPage(),
    );
  }
}

class InboundPage extends StatelessWidget {
  const InboundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbound Page'),
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            /* IconButton(
              icon: const Icon(Icons.home), // Custom home icon
              onPressed: () {
                // Handle home icon press if needed
              },
            ),*/
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                      'assets/goods_receipt.png'), // Replace with your image asset path
                  title: const Text("Goods Receipt"),
                  subtitle: const Text('Description for Good Receipt'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset(
                    'assets/print_reprint.png'), // Replace with your image asset path
                title: const Text("Print and Reprint"),
                subtitle: const Text('Description for Print and Reprint'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}