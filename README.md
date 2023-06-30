# Lista de Espera

Este repositório contém um aplicativo Flutter para gerenciar uma lista de espera usando leitura de QR Code. O aplicativo permite que os usuários sejam adicionados à lista de espera ou removidos, com base no QR Code lido.

## Screenshots

![Lista de Espera](screenshots/lista_espera.png)
![Inserir Pessoa](screenshots/inserir_pessoa.png)
![QR Code](screenshots/qr_code.png)

## Funcionalidades

- Leitura de QR Code
- Gerenciamento de listas de espera
- Adição ou remoção de uma pessoa na lista de espera

## Requisitos

- Flutter 2.0 ou superior
- Dart 2.12 ou superior

## Como executar o aplicativo

1. Clone este repositório para o seu computador.
2. Certifique-se de ter o Flutter e o Dart instalados corretamente em seu ambiente de desenvolvimento.
3. Abra um terminal na pasta raiz do projeto.
4. Execute o comando `flutter run` para iniciar o aplicativo.

## Estrutura do Código

O código está organizado da seguinte forma:

- O arquivo `lib/main.dart` é o ponto de entrada do aplicativo e contém a classe `HomeScreen`, que é a tela inicial do aplicativo.
- A tela inicial exibe uma barra de navegação inferior usando `BottomNavigationBar` e tem dois itens: "Lista de Espera" e "Adicionar".
- A classe `ListaEspera` exibe a lista de pessoas na tela "Lista de Espera" e permite que o usuário remova pessoas da lista.
- A classe `InserirPessoa` exibe um formulário na tela "Adicionar" e permite que o usuário insira o nome de uma pessoa para adicioná-la à lista de espera.
- A classe `QrCodeScreen` exibe a tela de leitura de QR Code, onde o usuário pode escanear um QR Code para obter o texto e usá-lo no aplicativo.
- A pasta `lib/models` mantem o modelos que representam a lista e pessoas.

## Dependências

Este aplicativo utiliza as seguintes dependências:

- `flutter_barcode_scanner` (versão 2.0.0) - Uma biblioteca Flutter para leitura de QR Code.
- `qr_flutter` (versão 5.0.0) - Uma biblioteca Flutter para renderizar QR Codes.

## Contributing

Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões de melhorias, fique à vontade para abrir uma nova issue ou enviar um pull request.

#### Networks Gabriel:

[<img alt="GitHub followers Gabriel" src="https://img.shields.io/github/followers/PuniGC?label=Follow&style=social" height="22" title="Follow me"/>][github]
[<img alt="Instagram Gabriel" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&link=instagram.com/gabrielsants_dev/" height="22" />](https://www.instagram.com/gabrielsants_dev/)
[<img alt="Mail to Gabriel" src="https://img.shields.io/badge/-Gmail-c14438?style=flat&logo=Gmail&logoColor=white" height="22" title="gabriel04.ok@gmail.com" />][email]
[<img alt="Linkedin Gabriel" src="https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/gabriel-santana-silva-1205461a3/" height="22" />][linkedin]

#### Networks Maria:

[<img alt="GitHub followers Maria" src="https://img.shields.io/github/followers/mariaxuxu?label=Follow&style=social" height="22" title="Follow me"/>](https://github.com/mariaxuxu)
[<img alt="Instagram Maria" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&link=instagram.com/https.mariiax/" height="22" />](https://www.instagram.com/https.mariiax/)

#### Networks Taylor:

[<img alt="GitHub followers Taylor" src="https://img.shields.io/github/followers/taylorburgues?label=Follow&style=social" height="22" title="Follow me"/>](https://github.com/taylorburgues)
[<img alt="Instagram Taylor" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&link=instagram.com/theo_burgues/" height="22" />](https://www.instagram.com/theo_burgues/)

## Equipe

* **Gabriel Santana Silva** - *Owner* - [Instagram](https://www.instagram.com/gabrielsants_dev/)
* **Maria Clara Redin Benitez** - *Owner* - [Instagram](https://www.instagram.com/https.mariiax/)
* **Taylor Matheus Burguês Gomes** - *Owner* - [GitHub](https://github.com/taylorburgues)

## License

This project is licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE).

---
[github]: https://github.com/PuniGC
[linkedin]: https://www.linkedin.com/in/gabriel-santana-silva-1205461a3/
[email]: mailto:gabriel04.ok@gmail.com
[license]: LICENSE
