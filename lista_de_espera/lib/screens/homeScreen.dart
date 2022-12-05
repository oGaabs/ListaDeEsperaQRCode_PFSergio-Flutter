import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lista_de_espera/screens/pages/inserir_page.dart';
import 'package:lista_de_espera/screens/pages/listaespera_page.dart';

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
    const ListaEspera(),
    const InserirPessoa(),
    const ListaEspera()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PF_Sergio CrudAPI - Ra:21429'),
        backgroundColor: Color.fromARGB(255, 31, 29, 29),
      ),
      body: PageView(
        controller: _pageController,
        children:
            pages //lista de widgets que será exibida na tela, nesse caso, 3 widgets
        ,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(214, 20, 10, 37),
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
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
              icon: Icon(Icons.list),
              label: 'Lista de Espera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Adicionar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_search_rounded),
              label: 'Encontrar',
            ),
          ]),
    );
  }
}
