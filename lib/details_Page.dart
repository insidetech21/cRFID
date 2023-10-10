import 'package:crfid/model/Poset.dart';
import 'package:crfid/services/in_poset_api.dart';
import 'package:crfid/tabs/firstTab.dart';
import 'package:crfid/tabs/item_details_Page.dart';
import 'package:crfid/tabs/secondTab.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'confirmationPage.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
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
            SecondTab(
              DeliveryNote: '',
              BillOfLoading: '',
              GR_GI_SLIP_NO: '',
              Header_Text: '',
              Comments: '',
              PO_NUMBER: '',
              Transpotar_Name: '',
            ),
            ItemDetailsPage(),
          ],
        ),
      ),
    );
  }
}
