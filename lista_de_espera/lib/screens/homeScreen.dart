import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lista_de_espera/screens/listaEspera.dart';

import 'lista_espera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variável do tipo PageController que recebe o Widget PageController
  final PageController _pageController = PageController();

  int index = 0; //variável do tipo int inicializada com 0

  List<Widget> pages = [
    ListaDeEspera(),
    ListaDeEspera(),
    ListaDeEspera()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício seleciona item'),
        backgroundColor: Colors.brown,
      ),
      body: PageView(
        controller: _pageController,
        children: pages/*[
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Imagem 1!',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                    'https://i0.wp.com/jornal.usp.br/wp-content/uploads/2022/07/07072022_galaxias_ancias.jpg?fit=768%2C403&ssl=1')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Imagem 2!',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Starsinthesky.jpg/1200px-Starsinthesky.jpg')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Imagem 3!',
                  style: TextStyle(
                      fontSize: 40, //tamanho da fonte
                      fontWeight: FontWeight.bold, //peso da fonte (negrito)
                      color: Colors.cyan // cor da fonte (ciano)
                      ),
                ),
                const SizedBox(
                  height: 50,
                ), //parecido com Container, nesse caso cria um espaço em branco entre o texto e a imagem.
                Image.network(
                    'https://i0.wp.com/jornal.usp.br/wp-content/uploads/20170718_00_IAG.jpg?fit=800%2C420&ssl=1')
              ],
            ),
          ),
        ]*/,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              index, //índice dos items da BottomNavigationBar, recebe a variável index criada no início da classe.
          onTap: (int page) {
            //função que recebe como parâmetro um int chamado page.
            setState(() {
              //função da classe StatefulWidget que reconstroi toda a classe toda vez que é chamada.
              index = page; //variável index recebe o parâmetro page da função.
            });
            _pageController.animateToPage(
                //controlador _pageController chamando o método "animateToPage", que faz uma animação na transição entre os items do bottomNavigationBar.
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Lista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'BANANA',
            ),
          ]),
    );
  }
}
