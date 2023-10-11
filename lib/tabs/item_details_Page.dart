import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  TextEditingController plantController = TextEditingController(
    text: "100",
  );

  TextEditingController itemCategoryController = TextEditingController(
    text: "Item 1",
  );

  TextEditingController materialController = TextEditingController(
    text: "FG119AF67",
  );

  TextEditingController descriptionController = TextEditingController(
    text: "3/4 Pistons",
  );

  String? selectedOption; // Create a variable to store the selected option
  TextEditingController movementTypeDescController = TextEditingController(
    text: "Goods receipt for PO into warehouse/store",
  );

  String?
      selectedOptionStockType; // Create a variable to store the selected option
  TextEditingController orderQuantityController = TextEditingController(
    text: "20",
  );

  TextEditingController openQuantityController = TextEditingController(
    text: "10",
  );

  String? selectedLocation;

  TextEditingController manufcController =
      TextEditingController(text: 'DD/MM/YYYY');
  TextEditingController expController =
      TextEditingController(text: 'DD/MM/YYYY');

  DateTime? selectedDate;
  Future<void> _selectmanDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      // final millisecondsSinceEpoch = picked.millisecondsSinceEpoch;
      // selectedDateInFormat = '/Date($millisecondsSinceEpoch)/';
      setState(() {
        // selectedDateInFormat;
        selectedDate = picked;
        manufcController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  Future<void> _selectexpDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      final millisecondsSinceEpoch = picked.millisecondsSinceEpoch;
      // selectedDateInFormat = '/Date($millisecondsSinceEpoch)/';
      setState(() {
        // selectedDateInFormat;
        selectedDate = picked;
        expController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      //leading: Image.asset('assets/goods_receipt.png'), // Replace with your image asset path
                      title: const Text("Item No. 10"),
                      onTap: () {
                        //ConfirmationPage cp = ConfirmationPage();
                        // cp.showAlertDialog(context);
                      },
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: plantController,
                      decoration: const InputDecoration(
                        labelText: 'Movement Type Desc :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: itemCategoryController,
                      decoration: const InputDecoration(
                        labelText: 'Movement Type Desc :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: materialController,
                      decoration: const InputDecoration(
                        labelText: 'Material :',
                        hintText: "FG119AF67",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description :',
                        hintText: "3/4 Pistons",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedOption,
                      // Use the selectedOption variable to control the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption =
                              newValue; // Update the selected option when changed
                        });
                      },
                      items:
                          <String>['101', '102'] // Define the dropdown options
                              .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Movement Type :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: movementTypeDescController,
                      decoration: const InputDecoration(
                        labelText: 'Movement Type Desc :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedOptionStockType,
                      // Use the selectedOption variable to control the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOptionStockType =
                              newValue; // Update the selected option when changed
                        });
                      },
                      items: <String>[
                        'Restricted',
                        'Un-restricted'
                      ] // Define the dropdown options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Stock type :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: orderQuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Order Quantity :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: openQuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Open Quantity :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedLocation,
                      // Use the selectedOption variable to control the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation =
                              newValue; // Update the selected option when changed
                        });
                      },
                      items: <String>['', '', ''] // Define the dropdown options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Location :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        labelText: 'Enter Batch :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: manufcController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Manufacturing Date :',
                          border: OutlineInputBorder(),
                          hintText: 'DD/MM/YYYY',
                          suffix: TextButton(
                              onPressed: () {
                                _selectmanDate(context);
                              },
                              child: Icon(Icons.date_range))),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: expController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Expiry Date :',
                          hintText: 'DD/MM/YYYY',
                          border: OutlineInputBorder(),
                          suffix: TextButton(
                              onPressed: () {
                                _selectexpDate(context);
                              },
                              child: Icon(Icons.date_range))),
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Vendor Batch :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      onPressed: () {},
                      child: Text('Post')),
                )
                // Add more list items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
