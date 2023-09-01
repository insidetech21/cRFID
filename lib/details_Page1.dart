import 'package:flutter/material.dart';

import 'confirmationPage.dart';

class FirstTab1 extends StatelessWidget {
  const FirstTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle search button press
                    // You can implement search functionality here
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                    title: const Text("Item No. 10"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Material No.FG119AF67"),
                        Text("Material Description: 3/4 Pistons"),
                        Text("Open Quantity: 20"),
                      ],
                    ),
                    trailing: const Text("01 Oct 2025"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const confirmationPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                    title: const Text("Item No. 20"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Material No.FG119AF90"),
                        Text("Material Description: Sleeve Value"),
                        Text("Open Quantity: 20"),
                      ],
                    ),
                    trailing: const Text("01 Sep 2023"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const confirmationPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                    title: const Text("Item No. 30"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Material No.FG119AF91"),
                        Text("Material Description: Rotary Value"),
                        Text("Open Quantity: 20"),
                      ],
                    ),
                    trailing: const Text("20 Aug 2023"),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const confirmationPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                    title: const Text("Item No. 30"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Material No.FG119AF91"),
                        Text("Material Description: Rotary Value"),
                        Text("Open Quantity: 20"),
                      ],
                    ),
                    trailing: const Text("25 Jan 2022"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const confirmationPage()),
                      );
                    },
                  ),
                ),
                // Add more list items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
