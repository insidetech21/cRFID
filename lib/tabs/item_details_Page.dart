import 'package:flutter/material.dart';

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


  String? selectedOptionStockType; // Create a variable to store the selected option
  TextEditingController orderQuantityController = TextEditingController(
    text: "20",
  );

  TextEditingController openQuantityController = TextEditingController(
    text: "10",
  );

  String? selectedLocation;



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
                          selectedOption = newValue; // Update the selected option when changed
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
                          selectedOptionStockType = newValue; // Update the selected option when changed
                        });
                      },
                      items:
                      <String>['Restricted', 'Un-restricted'] // Define the dropdown options
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
                          selectedLocation = newValue; // Update the selected option when changed
                        });
                      },
                      items:
                      <String>['', '',''] // Define the dropdown options
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
                // Add more list items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
