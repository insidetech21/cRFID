import 'package:flutter/material.dart';
import 'inbound_Page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}



// void main() {
//   runApp(
//    const ProviderScope(child: HomePage()),
    
//   );
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.blueAccent, size: 50.0),
                    //Image.asset("assests/profile.png", width: 50.0),
                  ],
                ) ,
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    "c-RFID",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InboundPage()),
                          );
                        },
                        child: SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/inbound1.png", width: 90.0),
                                const SizedBox(height: 10.0),
                                  const Text("INBOUND", style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                  ),
                                ],
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/outbound.png", width: 90.0),
                                  const SizedBox(height: 10.0),
                                  const Text("OUTBOUND", style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                  ),
                                  /*  const SizedBox(height: 5.0),
                                const Text("2 Items", style: TextStyle(
                                    color:Colors.grey,
                                fontWeight: FontWeight.w100),
                                ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/internal.png", width: 90.0),
                                  const SizedBox(height: 10.0),
                                  const Text("INTERNAL", style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                  ),
                                  /*  const SizedBox(height: 5.0),
                                const Text("2 Items", style: TextStyle(
                                    color:Colors.grey,
                                fontWeight: FontWeight.w100),
                                ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














