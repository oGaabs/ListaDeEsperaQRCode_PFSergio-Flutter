import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lista_de_espera/screens/home_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final controller = TextEditingController(text: "Digite aqui"); // Controller para o input e do qrcode
  String qrCodeRead = '';
  bool gerarQrCode = false; // variavel para saber se poder ir pra proxima tela

  lerQrCode() async {
    // Função para ler o Qr Code e retornar o valor
    String codigoLido = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    controller.value = TextEditingValue(
      text: codigoLido,
      selection: TextSelection.fromPosition(
        TextPosition(offset: codigoLido.length),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget gerarQRCODE() {
    return QrImage(
      data: controller.text != "" ? controller.text : "https://www.slmm.com.br/CTC/",
      version: QrVersions.auto,
      size: 200.0,
      gapless: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qr CODE")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          if (qrCodeRead != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'QRCODE: : $qrCodeRead',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ElevatedButton(onPressed: lerQrCode, child: Text("Ler qrCode")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  gerarQrCode = true;
                });
              },
              child: const Text("Gerar Qr Code")),
          if (gerarQrCode) gerarQRCODE(),
          const SizedBox(height: 25),
          // cria TextFormField
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "QrCode text",
              // errorText: "Digite corretamente sua Anta",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.ballot),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                if (controller.text != '') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(controller.text)));
                }
              },
              child: const Text("Ler dados do qrcode")),
        ]),
      ),
    );
  }
}
