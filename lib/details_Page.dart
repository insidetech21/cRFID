import 'package:flutter/material.dart';

import 'confirmationPage.dart';
import 'details_Page1.dart';
import 'inbound_Page.dart';

class detailsPage extends StatelessWidget {
  const detailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.list_alt_outlined),
              child: Text(
                "List",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              icon: Icon(Icons.pages),
              child: Text(
                "Detail",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Tab(
              icon: Icon(Icons.open_in_full_outlined),
              child: Text(
                "Item Detail",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            //First Tab
            const FirstTab(),
            const FirstTab1(),
            Container(
              color: Colors.red,
              child: const Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs in the first tab
      child: Scaffold(
        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: "PO",
                ),
                Tab(text: "STO"),
                Tab(text: "Reservation"),
              ],
            ),

            // Search Bar
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
              child: TabBarView(
                children: [
                  // Sub Tab 1
                  ListView(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                          title: const Text("4600001919"),
                          subtitle: const Text("Zebra Service Ltd"),
                          trailing: const Text("01 Aug 2024"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const confirmationPage()),
                            );
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                          title: const Text("4600001989"),
                          subtitle: const Text("ABC Ltd"),
                          trailing: const Text("15 Sep 2022"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const confirmationPage()),
                            );
                          },
                        ),
                      ),

                      Card(
                        child: ListTile(
                          //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                          title: const Text("4600002319"),
                          subtitle: const Text("Bharat Ltd"),
                          trailing: const Text("20 Sep 2023"),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const confirmationPage()),
                            );
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                          title: const Text("4600001239"),
                          subtitle: const Text("Crave Infotech Pvt Ltd"),
                          trailing: const Text("01 Sep 2023"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const confirmationPage()),
                            );
                          },
                        ),
                      ),
                      // Add more list items as needed
                    ],
                  ),

                  // Sub Tab 2
                  const Center(child: Text('Sub Tab 2 Content')),

                  // Sub Tab 3
                  const Center(child: Text('Sub Tab 3 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
