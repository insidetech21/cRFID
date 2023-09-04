import 'package:flutter/material.dart';

import 'confirmationPage.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "PO: 4600001921",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Vendor Name: Bharat Electronics",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
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
                      ConfirmationPage cp = ConfirmationPage();
                      cp.showAlertDialog(context);
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
                      ConfirmationPage cp = ConfirmationPage();
                      cp.showAlertDialog(context);
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
                      ConfirmationPage cp = ConfirmationPage();
                      cp.showAlertDialog(context);
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
                      ConfirmationPage cp = ConfirmationPage();
                      cp.showAlertDialog(context);
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
