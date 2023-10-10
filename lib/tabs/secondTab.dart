import 'package:crfid/ConfirmtionData.dart';
import 'package:crfid/data%20provider/data_provider.dart';
import 'package:crfid/model/PoItemSet.dart';
import 'package:flutter/material.dart';

import 'package:crfid/services/in_PoItemSet_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondTab extends ConsumerStatefulWidget {
  const SecondTab({
    Key? key, // Fix the super.key to Key? key
    // required this.PO_NUMBER,
    // required this.DeliveryNote,
    // required this.BillOfLoading,
    // required this.GR_GI_SLIP_NO,
    // required this.Comments,
    // required this.Header_Text,
    // required this.Transpotar_Name,
  }) : super(key: key);

  // final String PO_NUMBER,
  //     DeliveryNote,
  //     BillOfLoading,
  //     GR_GI_SLIP_NO,
  //     Header_Text,
  //     Transpotar_Name,
  //     Comments;

  @override
  SecondTabState createState() => SecondTabState();
}


class SecondTabState extends ConsumerState<SecondTab> {

  
  @override
  Widget build(BuildContext context) {

    final confirmData1=ref.watch(confirmProvider);
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
                PO_NUMBER: confirmData1.ponumber,
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

class CollapsibleList extends ConsumerStatefulWidget {
  const CollapsibleList({
    Key? key,
    required this.PO_NUMBER,
  }) : super(key: key);

  final String PO_NUMBER;

  @override
  CollapsibleListState createState() => CollapsibleListState();
}

class CollapsibleListState extends ConsumerState<CollapsibleList> {
  bool isExpanded = false;
  List<String> confirmationData = [
    '', // DeliveryNote
    '', // BillOfLoading
    '', // GR_GI_SLIP_NO
    '', // Header_Text
    '', // Transpotar_Name
    '', // Comments
  ]; // Data to be displayed in CollapsibleList

  ConfirmtionData cd3=ConfirmtionData();

  @override
  Widget build(BuildContext context) {
    final confirmdata2=ref.watch(confirmProvider);
    return Column(
      children: [
        ListTile(
          leading: Text(
            "PO Number : ${confirmdata2.ponumber}",
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
              ListTile(title: Text('Delivery Note: '+confirmdata2.deliveryNote)), // Display BillOfLoading
              ListTile(title: Text('Bill Of Loading: '+confirmdata2.billOfLoading)), // Display GR_GI_SLIP_NO
              ListTile(title: Text('GI/GR Slip No.: '+confirmdata2.gigrSlipNo)), // Display Header_Text
              ListTile(title: Text('Header Text: '+confirmdata2.headerText)), // Display Transpotar_Name
              ListTile(title: Text('Transporter Name: '+confirmdata2.transporterName)),
              ListTile(title: Text('Comments: '+confirmdata2.comments)), // Display Comments
            ],
          ),
      ],
    );
  }
}

