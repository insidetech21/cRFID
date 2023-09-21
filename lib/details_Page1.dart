import 'package:flutter/material.dart';

import 'confirmationPage.dart';

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
          CollapsibleList(
            PO_NUMBER: PO_NUMBER,
            DeliveryNote: DeliveryNote,
            BillOfLoading: BillOfLoading,
            GR_GI_SLIP_NO: GR_GI_SLIP_NO,
            Header_Text: Header_Text,
            Transpotar_Name: Transpotar_Name,
            Comments: Comments,
          ),
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
                      // cp.showAlertDialog(context);
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
  bool isExpanded =
  false; // To control whether the list is expanded or collapsed

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.PO_NUMBER),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded; // Toggle the expansion state
            });
          },
        ),
        if (isExpanded)
        // The list items to display when expanded
          Column(
            children: [
              ListTile(title: Text(widget.Header_Text)),
              ListTile(title: Text(widget.DeliveryNote)),
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
