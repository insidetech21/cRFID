import 'package:crfid/item_details_Page.dart';
import 'package:crfid/services/Poset.dart';
import 'package:crfid/services/in_poset_api.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
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

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  DateTime? selectedDate;
  String? selectedDateInFormat; // Add this variable to store the selected date

  Logger logger = Logger(
    level: Level.debug, // Change log level as needed (e.g., Level.warning)
    printer: PrettyPrinter(), // You can customize the log output format
  );

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
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(
                      context); // Open the date picker when the icon is pressed
                },
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
                var posets;
                // Display the data in a ListView
                // final posets = snapshot.data!;

                // final posets = snapshot.data!.where((poset) {
                //   final posetDate = poset.aedat;
                //   return
                //   selectedDate == null ||
                //   posetDate == selectedDateInFormat;
                // }).toList();

                // final posets = snapshot.data!.where((poset) {
                //   final posetDate = DateTime.tryParse(poset.aedat);
                //   final selectedDateInDateTime =
                //       DateTime.tryParse(selectedDateInFormat!);

                //   return selectedDateInDateTime == null ||
                //       (posetDate != null &&
                //           posetDate.isAtSameMomentAs(selectedDateInDateTime));
                // }).toList();

                if (selectedDateInFormat == null) {
                  posets = snapshot.data!;
                } else {
                  posets = snapshot.data!.where((poset) {
                    final posetDate = convertDateFromMilliseconds(poset.aedat);
                    logger.d('poset.aedat:  $posetDate');

                    final selectedDateInFormat2 =
                        convertDateFromMilliseconds(selectedDateInFormat!);
                    logger
                        .d('Selected date in format:  $selectedDateInFormat2');

                    return selectedDateInFormat == null ||
                        (posetDate != null &&
                            posetDate.contains(selectedDateInFormat2));
                  }).toList();
                }
                logger.d('Selected date in format:  $selectedDateInFormat');


                

                return ListView.builder(
                  itemCount: posets.length,
                  itemBuilder: (context, index) {
                    final poset = posets[index];
                    
                    
                    return Card(
                      child: ListTile(
                        title: Text(poset.ebeln),
                        subtitle: Text(poset.name1),
                        trailing:
                            Text(convertDateFromMilliseconds(poset.aedat)),
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
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    // Extract milliseconds from the string
    int milliseconds =
        int.parse(dateStr.replaceAll(RegExp(r'/Date\(|\)/'), ''));

    // Convert milliseconds to DateTime
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // Get the month name from the array
    String monthName =
        monthNames[dateTime.month - 1]; // Subtract 1 because months are 1-based

    // Format the DateTime as dd/Mon/yyyy
    String formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')} $monthName ${dateTime.year}";

    return formattedDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      final millisecondsSinceEpoch = picked.millisecondsSinceEpoch;
      selectedDateInFormat =
          '/Date($millisecondsSinceEpoch)/'; // Format the date
      setState(() {
        selectedDateInFormat;
        selectedDate = picked;
      });
    }
  }
}
