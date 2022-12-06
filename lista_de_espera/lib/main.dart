import 'package:flutter/material.dart';
import 'package:lista_de_espera/screens/qrcode_screen.dart';

void main() {
  runApp(const MaterialApp(
    title: "Espera Ai",
    debugShowCheckedModeBanner: false,
    home: QrCodeScreen(), // Tela para ler qrcode
  ));
}
