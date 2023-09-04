import 'package:flutter/material.dart';

class ConfirmationPage {
  showAlertDialog(BuildContext context) {
    TextEditingController deliveryNoteController = TextEditingController();
    TextEditingController billOfLoadingController = TextEditingController();
    TextEditingController giSlipNoController = TextEditingController();
    TextEditingController headerTextController = TextEditingController();
    TextEditingController transporterNameController = TextEditingController();
    TextEditingController commentsController = TextEditingController();

    AlertDialog alert = AlertDialog(
      title: const Center(child: Text("Confirmation")),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PO Number :"),
                Text(
                  "46000001919",
                  style: TextStyle(
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
            /* String poNumber = poNumberController.text;
            String deliveryNote = deliveryNoteController.text;
            String billOfLoading = billOfLoadingController.text;
            String giSlipNo = giSlipNoController.text;
            String headerText = headerTextController.text;
            String transporterName = transporterNameController.text;
            String comments = commentsController.text;*/

            // Process the form data here

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
  }
}
