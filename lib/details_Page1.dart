import 'package:flutter/material.dart';

import 'confirmationPage.dart';
import 'model/PoItemSet.dart';
import 'package:crfid/services/in_PoItemSet_api.dart';

class FirstTab1 extends StatelessWidget {
  const FirstTab1({
    super.key,
    required this.DeliveryNote,
    required this.BillOfLoading,
    required this.GR_GI_SLIP_NO,
    required this.Comments,
    required this.PO_NUMBER,
    required this.Header_Text,
    required this.Transpotar_Name,
  });

  final String PO_NUMBER,
      DeliveryNote,
      BillOfLoading,
      GR_GI_SLIP_NO,
      Header_Text,
      Transpotar_Name,
      Comments;

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
                PO_NUMBER: PO_NUMBER,
                DeliveryNote: DeliveryNote,
                BillOfLoading: BillOfLoading,
                GR_GI_SLIP_NO: GR_GI_SLIP_NO,
                Header_Text: Header_Text,
                Transpotar_Name: Transpotar_Name,
                Comments: Comments,
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
                      String ebelpWithoutZeros = int.parse(poset.ebelp).toString();

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
                            ConfirmationPage cp = ConfirmationPage();
                            cp.showAlertDialog(context, posets[index], (data) {
                              String? deliveryNote = data["deliveryNote"];
                              String? billOfLoading = data["billOfLoading"];
                              String? giSlipNo = data["giSlipNo"];
                              String? headerText = data["headerText"];
                              String? transporterName = data["transporterName"];
                              String? comments = data["comments"];
                            });
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
  _CollapsibleListState createState() => _CollapsibleListState();
}

class _CollapsibleListState extends State<CollapsibleList> {
  bool isExpanded = false;

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
          title: Text(widget.DeliveryNote),
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
              ListTile(title: Text(widget.Header_Text)),
              ListTile(title: Text(widget.BillOfLoading)),
              ListTile(title: Text(widget.GR_GI_SLIP_NO)),
              ListTile(title: Text(widget.Transpotar_Name)),
              ListTile(title: Text(widget.Comments)),
            ],
          ),
      ],
    );
  }
}

