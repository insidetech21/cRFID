import 'package:crfid/item_details_Page.dart';
import 'package:crfid/services/Poset.dart';
import 'package:crfid/services/in_poset_api.dart';
import 'package:flutter/material.dart';
import 'confirmationPage.dart';
import 'details_Page1.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list_alt_outlined),
                child: Text(
                  "PO List",
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
                icon: Icon(Icons.book),
                child: Text(
                  "Item Detail",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // First Tab
            FirstTab(),
            FirstTab1(),
            ItemDetailsPage(),
          ],
        ),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: FutureBuilder<List<Poset>>(
            future: InPOSet.fetchPOSET(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If there's an error
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // If there's no data
                return const Center(child: Text('No data available.'));
              } else {
                // Display the data in a ListView
                final posets = snapshot.data!;
                return ListView.builder(
                  itemCount: posets.length,
                  itemBuilder: (context, index) {
                    final poset = posets[index];
                    return Card(
                      child: ListTile(
                        title: Text(poset.ebeln),
                        subtitle: Text(poset.name1),
                        trailing: Text(convertDateFromMilliseconds(poset.aedat)),
                        onTap: () {
                          ConfirmationPage cp = ConfirmationPage();
                          cp.showAlertDialog(context);
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  String convertDateFromMilliseconds(String dateStr) {
  // Define an array of month names
  List<String> monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  // Extract milliseconds from the string
  int milliseconds = int.parse(dateStr.replaceAll(RegExp(r'/Date\(|\)/'), ''));

  // Convert milliseconds to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

  // Get the month name from the array
  String monthName = monthNames[dateTime.month - 1]; // Subtract 1 because months are 1-based

  // Format the DateTime as dd/Mon/yyyy
  String formattedDate = "${dateTime.day.toString().padLeft(2, '0')} $monthName ${dateTime.year}";

  return formattedDate;
}
}

