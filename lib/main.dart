import 'package:flutter/material.dart';

import 'card_info.dart';
import 'models/info_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Info> infoList = [
    Info(
      siteName: "DEPOT AQUITAINE 33230",
      status: "CHARGEMENT",
      address: '1,zone artisannale LAVEAU 33230-saint MEDARD DE GUIZIERS',
      heure: '2023-05-30 12:30 ',
      distanceTotale: '50 KM',
      nombreColis: '50',
      poidsTotal: '25 KG',
      volumeTotal: '25.0 M3',
    ),
    Info(
      siteName: "DIRECT ALU FERMETURES",
      status: "LIVRAISON",
      address: '74 Avenue Jean Jaures 33600 - PESSAC',
      heure: '2023 13:45 ',
      distanceTotale: '20 KM',
      nombreColis: '1',
      poidsTotal: '5 KG',
      volumeTotal: '0.2 M3',
    ),
    Info(
      siteName: "DEPOT AQUITAINE 33230",
      status: "CHARGEMENT",
      address: '1,zone artisannale LAVEAU 33230-saint MEDARD DE GUIZIERS',
      heure: '2023-05-30 12:30 ',
      distanceTotale: '50 KM',
      nombreColis: '50',
      poidsTotal: '25 KG',
      volumeTotal: '25.0 M3',
    ),
    Info(
      siteName: "DIRECT ALU FERMETURES",
      status: "LIVRAISON",
      address: '74 Avenue Jean Jaures 33600 - PESSAC',
      heure: '2023 13:45 ',
      distanceTotale: '20 KM',
      nombreColis: '1',
      poidsTotal: '5 KG',
      volumeTotal: '0.2 M3',
    ),
    Info(
      siteName: "DEPOT AQUITAINE 33230",
      status: "CHARGEMENT",
      address: '1,zone artisannale LAVEAU 33230-saint MEDARD DE GUIZIERS',
      heure: '2023-05-30 12:30 ',
      distanceTotale: '50 KM',
      nombreColis: '50',
      poidsTotal: '25 KG',
      volumeTotal: '25.0 M3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Add MaterialApp widget
      title: 'Card Info',
      home: Scaffold(
        appBar: AppBar(title: const Text("Card Info")),
        body: ListView.builder(
          itemCount: infoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            Offset(0, 3), // controls the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                        10), // adjust the value as per your card's border radius
                    color: Colors
                        .white, // set your desired background color for the card
                  ),
                  child: CardInfo(
                      index: index,
                      siteName: infoList[index].siteName,
                      status: infoList[index].status,
                      adress: infoList[index].address,
                      heure: infoList[index].heure,
                      distanceTotale: infoList[index].distanceTotale,
                      nombreColis: infoList[index].nombreColis,
                      poidsTotal: infoList[index].poidsTotal,
                      volumeTotal: infoList[index].volumeTotal)),
            );
          },
        ),
      ),
    );
  }
}

