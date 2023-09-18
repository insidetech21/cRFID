import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Poset.dart';

class InPOSet {
  static Future<List<Poset>> fetchPOSET() async {
    const String username = 'ashwin';
    const String password = 'Crave@2022';

// Encode the username and password in Base64
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, String> headers = {
      'Authorization': basicAuth, // Set Basic Auth header
      'sap-client': '200', // Replace with the desired SAP client
      'Accept': 'application/json', // Set the desired Accept header
      'Content-Type': 'application/json',
      "Accept-Encoding": "gzip, deflate",
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods':
      'GET,PUT,POST,DELETE' // Set the desired Content-Type header
    };

    const url =
        "https://aincfapim.test.apimanagement.eu10.hana.ondemand.com/ZCIMS_INT_SRV/IN_POSet?\$filter=Aedat ge datetime'2023-02-02T00:00:00' and Aedat le datetime'2023-05-02T00:00:00' and Werks eq 'KR26'";
    //final uri = Uri.parse(url);

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      //print("API Response Status Code: ${response.statusCode}"); // Log status code

      if (response.statusCode == 200) {
        //final body = response.body;

        //print("API Response Body: $body"); // Log response body

        //final results = json['results'] as List<dynamic>;
        final List results = jsonDecode(response.body)['d']['results'];
        // final posets = results.map((e) {
        //   final posets = Poset(
        //     ebeln: e['Ebeln'],
        //     bsart: e['Bsart'],
        //     bstyp: e['Bstyp'],
        //     name1: e['Name1'],
        //     lifnr: e['Lifnr'],
        //     aedat: e['Aedat'],
        //     werks: e['Werks'],
        //     mblnr: e['Mblnr'],
        //     billOfLadding: e['bill_of_ladding'],
        //     grGiSlipNo: e['gr_gi_slip_no'],
        //     headerTxt: e['header_txt'],
        //   );
        //   return posets;
        // }).toList();

        // return posets;
        return results.map(((e) => Poset.fromJson(e))).toList();
      } else {
        // print("Error response: ${response.statusCode}");
        // print("Error body: ${response.body}");
        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      // print("Error: $e");
      throw Exception("Error fetching users: $e");
    }
  }
}
