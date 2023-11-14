import 'package:flutter/material.dart';

class inicial extends StatefulWidget {
  const inicial({super.key});

  @override
  State<inicial> createState() => _inicialState();
}

class _inicialState extends State<inicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    // estrutura com appbar, body e elevated button
      appBar: AppBar(   // tela na parte de cima
        title: Column(   // numa coluna: um em cima do outro
          children: [
            Row(         // tenho uma linha: um ao lado do outro
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // alinhamento da linha
              children: [
                const Text('Programação'),      // Primeira informação da linha
                ElevatedButton(onPressed: () {}, // segunda informação da linha
                    child: const Icon(                 // o que vai ser o Elevated button
                      Icons.radar,               // informações do icone
                      size: 30,                  // informações do icone
                    ),
                ),
              ],
            ),
            Row(                // essa linha está relacionada ainda com o Column
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,    // alinhamento da linha
              children: [
                Container(                    //crio um campo
                  child: const Padding(             // tem um preenchimento
                    padding: EdgeInsets.all(10),          // insiro uma borda
                    child: SizedBox(                     //numa caixa
                      width: 150,                             // altura
                      child: LinearProgressIndicator(        // essa caixa tem uma barra de progresso
                        color: Colors.white,                 // com a cor
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
