/*
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class paginaqrcode extends StatefulWidget {
  const paginaqrcode({Key? key}) : super(key: key);

  @override
  State<paginaqrcode> createState() => _paginaqrcodeState();
}

final LocalStorage storage = new LocalStorage('localstorage_app');

void addItemsToLocalStorage(item) {
  // storage.setItem('name', 'Abolfazl');
  // storage.setItem('family', 'Roshanzamir');

  final info = json.encode({'apiUrl': item});
  storage.setItem('info', info);
  getitemFromLocalStorage();
}

void getitemFromLocalStorage() {
  Map<String, dynamic> info = json.decode(storage.getItem('info'));

  print(info['apiUrl']);
}

class _paginaqrcodeState extends State<paginaqrcode> {
  String ticket = '';
  List<String> tickets = [];

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() => ticket = code != '-1' ? code : 'Não validado');

    addItemsToLocalStorage(ticket);
    // Stream<dynamic>? reader = FlutterBarcodeScanner.getBarcodeStreamReceiver(
    //   "#FFFFFF",
    //   "Cancelar",
    //   false,
    //   ScanMode.QR,
    // );
    // if (reader != null)
    //   reader.listen((code) {
    //     setState(() {
    //       if (!tickets.contains(code.toString()) && code != '-1')
    //         tickets.add(code.toString());
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Ticket: $ticket',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ElevatedButton.icon(
              onPressed: readQRCode,
              icon: const Icon(Icons.qr_code),
              label: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}


*/