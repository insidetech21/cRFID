import 'package:crfid/ConfirmtionData.dart';
import 'package:crfid/confirmationPage.dart';
import 'package:crfid/data%20provider/data_provider.dart';
import 'package:crfid/model/Poset.dart';
import 'package:crfid/services/in_poset_api.dart';
import 'package:crfid/tabs/secondTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class FirstTab extends ConsumerStatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends ConsumerState<FirstTab> {
  DateTime? selectedDate;
  String? selectedDateInFormat; // Add this variable to store the selected date

  Logger logger = Logger(
    level: Level.debug, // Change log level as needed (e.g., Level.warning)
    printer: PrettyPrinter(), // You can customize the log output format
  );

  List<String> confirmationData = [
    '', // DeliveryNote
    '', // BillOfLoading
    '', // GR_GI_SLIP_NO
    '', // Header_Text
    '', // Transpotar_Name
    '', // Comments
  ]; // Data to be displayed in CollapsibleList

  ConfirmtionData cd= ConfirmtionData();

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);
    final confirmData11=ref.watch(confirmProvider);
    
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
                icon: const Icon(Icons.calendar_today),
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
                        (posetDate.contains(selectedDateInFormat2));
                  }).toList();
                }
                logger.d('Selected date in format:  $selectedDateInFormat');

                posets.sort(
                    (a, b) => a.ebeln.toString().compareTo(b.ebeln.toString()));

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
                          // ConfirmationPage cp = ConfirmationPage(

                          // );
                          // cp.showAlertDialog(context, posets[index]
                          // );

                          String po_number = poset.ebeln.toString();

                          TextEditingController deliveryNoteController =
                              TextEditingController();
                          TextEditingController billOfLoadingController =
                              TextEditingController();
                          TextEditingController giSlipNoController =
                              TextEditingController();
                          TextEditingController headerTextController =
                              TextEditingController();
                          TextEditingController transporterNameController =
                              TextEditingController();
                          TextEditingController commentsController =
                              TextEditingController();

                          AlertDialog alert = AlertDialog(
                            title: const Center(child: Text("Confirmation")),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("PO Number :"),
                                      Text(
                                        po_number,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*TextFormField(
              controller: poNumberController,
              autofocus: true,
              readOnly: true,
              initialValue: "460007770",
              decoration: const InputDecoration(
                labelText: 'PO Number',
                border: OutlineInputBorder(),
              ),
            ),*/
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: deliveryNoteController,
                                    decoration: const InputDecoration(
                                      labelText: 'Delivery Note',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: billOfLoadingController,
                                    decoration: const InputDecoration(
                                      labelText: 'Bill Of Loading',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: giSlipNoController,
                                    decoration: const InputDecoration(
                                      labelText: 'GR/GI Slip No.',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: headerTextController,
                                    decoration: const InputDecoration(
                                      labelText: 'Header Text',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: transporterNameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Transporter Name',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  TextFormField(
                                    controller: commentsController,
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      labelText: 'Comments',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Continue"),
                                onPressed: () {
                                  // Access form data
                                  String poNumber = po_number;
                                  String deliveryNote =
                                      deliveryNoteController.text;
                                  String billOfLoading =
                                      billOfLoadingController.text;
                                  String giSlipNo = giSlipNoController.text;
                                  String headerText = headerTextController.text;
                                  String transporterName =
                                      transporterNameController.text;
                                  String comments = commentsController.text;

                                  // Update the data using the callback
                                  // onConfirmationDataUpdated([
                                  //   deliveryNote,
                                  //   billOfLoading,
                                  //   giSlipNo,
                                  //   headerText,
                                  //   transporterName,
                                  //   comments,
                                  // ]);

                                  // Create a Map to store the data
                                  // Map<String, String> data = {
                                  //   "poNumber": poNumber,
                                  //   "deliveryNote": deliveryNote,
                                  //   "billOfLoading": billOfLoading,
                                  //   "giSlipNo": giSlipNo,
                                  //   "headerText": headerText,
                                  //   "transporterName": transporterName,
                                  //   "comments": comments,
                                  // };

                                  // // Trigger the callback function with the data
                                  // onContinue(data);

                                  // Navigate to FirstTab1 widget

                                  // setState(() {
                                  //   cd.setPonumber(poNumber);
                                  // cd.setDeliveryNote(deliveryNote);
                                  // cd.setBillOfLoading(billOfLoading);
                                  // cd.setGigrSlipNo(giSlipNo);
                                  // cd.setHeaderText(headerText);
                                  // cd.setTransporterName(transporterName);
                                  // cd.setComments(comments);
                                  // });

                                  // confirmData11.ponumber=poNumber;
                                  // confirmData11.deliveryNote=deliveryNote;
                                  // confirmData11.billOfLoading=billOfLoading;
                                  // confirmData11.gigrSlipNo=giSlipNo;
                                  // confirmData11.headerText=headerText;
                                  // confirmData11.transporterName=transporterName;
                                  // confirmData11.comments=comments;

                                  ref.read(confirmProvider.notifier).state=ConfirmtionData(
                                    ponumber: poNumber,
                                    deliveryNote: deliveryNote,
                                    billOfLoading: billOfLoading,
                                    gigrSlipNo: giSlipNo,
                                    headerText: headerText,
                                    transporterName: transporterName,
                                    comments: comments
                                  );
                                  
                                  

                                      SecondTab(
                                        // DeliveryNote: deliveryNote,
                                        // BillOfLoading: billOfLoading,
                                        // GR_GI_SLIP_NO: giSlipNo,
                                        // Header_Text: headerText,
                                        // Comments: comments,
                                        // PO_NUMBER: poNumber,
                                        // Transpotar_Name: transporterName,
                                      );
                                      tabController.animateTo(1);
                                    

                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
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

  void updateConfirmationData(List<String> data) {
    // Update the data in CollapsibleList
    setState(() {
      confirmationData = data;
    });
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
