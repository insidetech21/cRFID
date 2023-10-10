import 'package:flutter/material.dart';
import 'confirmationPage.dart';
import 'model/PoItemSet.dart';
import 'package:crfid/services/in_PoItemSet_api.dart';

class FirstTab1 extends StatefulWidget {
  const FirstTab1({
    Key? key, // Fix the super.key to Key? key
    required this.PO_NUMBER,
    required this.DeliveryNote,
    required this.BillOfLoading,
    required this.GR_GI_SLIP_NO,
    required this.Comments,
    required this.Header_Text,
    required this.Transpotar_Name,
  }) : super(key: key);

  final String PO_NUMBER,
      DeliveryNote,
      BillOfLoading,
      GR_GI_SLIP_NO,
      Header_Text,
      Transpotar_Name,
      Comments;

  @override
  _FirstTab1State createState() => _FirstTab1State();
}


class _FirstTab1State extends State<FirstTab1> {
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
          Card(
            child: ListTile(
              title: CollapsibleList(
                PO_NUMBER: widget.PO_NUMBER,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PosetItemSet>>(
              future: InPOSet.fetchInPoSet(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available.'));
                } else {
                  var posets;
                  posets = snapshot.data!;

                  return ListView.builder(
                    itemCount: posets.length,
                    itemBuilder: (context, index) {
                      final poset = posets[index];
                      String ebelpWithoutZeros =
                      int.parse(poset.ebelp).toString();

                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: "Item No: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ebelpWithoutZeros,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text("Material No : ${poset.ebeln}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              Text("Material Description : ${poset.txz01}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              Text("Open Quantity : ${poset.menge}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                           /* ConfirmationPage cp = ConfirmationPage(onConfirmationDataUpdated: (List<String> ) {  });
                            cp.showAlertDialog(context, posets[index], (data) {
                              // Handle the data here
                              String? deliveryNote = data["deliveryNote"];
                              String? billOfLoading = data["billOfLoading"];
                              String? giSlipNo = data["giSlipNo"];
                              String? headerText = data["headerText"];
                              String? transporterName = data["transporterName"];
                              String? comments = data["comments"];

                              // Update the data in CollapsibleList
                              cp.updateConfirmationData([
                                deliveryNote,
                                billOfLoading,
                                giSlipNo,
                                headerText,
                                transporterName,
                                comments,
                              ]);

                              // Close the dialog
                              Navigator.of(context).pop();
                            });*/
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
      ),
    );
  }
}

class CollapsibleList extends StatefulWidget {
  const CollapsibleList({
    Key? key,
    required this.PO_NUMBER,
  }) : super(key: key);

  final String PO_NUMBER;

  @override
  _CollapsibleListState createState() => _CollapsibleListState();
}

class _CollapsibleListState extends State<CollapsibleList> {
  bool isExpanded = false;
  List<String> confirmationData = [
    '', // DeliveryNote
    '', // BillOfLoading
    '', // GR_GI_SLIP_NO
    '', // Header_Text
    '', // Transpotar_Name
    '', // Comments
  ]; // Data to be displayed in CollapsibleList

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            "PO Number : ${widget.PO_NUMBER}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          title: Text(confirmationData[0]), // Display DeliveryNote initially
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        if (isExpanded)
          Column(
            children: [
              ListTile(title: Text(confirmationData[1])), // Display BillOfLoading
              ListTile(title: Text(confirmationData[2])), // Display GR_GI_SLIP_NO
              ListTile(title: Text(confirmationData[3])), // Display Header_Text
              ListTile(title: Text(confirmationData[4])), // Display Transpotar_Name
              ListTile(title: Text(confirmationData[5])), // Display Comments
            ],
          ),
      ],
    );
  }
}

