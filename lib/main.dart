import 'package:flutter/material.dart';
import 'package:testando/data/task_inherited.dart';
import 'package:testando/globallevel.dart';
import 'package:testando/screens/initial_screen.dart';
import 'package:testando/tafoda.dart';

void main() => runApp(const gui());

class gui extends StatefulWidget {
  const gui({super.key});

  @override
  State<gui> createState() => _guiState();
}


class _guiState extends State<gui> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      home:
        TaskInherited(    // para avisar as mudanças do inherited ele precisa ser pai de todos
// agora é mãe de todos e posso acessar as informações do tasklist de qualquer lugar
          child: InitialScreen(),   // o initial screen é obrigatório pq o widget acima pede isso
        ),
       // AQUI É O WIDGET QUE VAI APARECER NA TELA QUANDO DER RUN
    );

      //Exemplo();
  }
}

// MaterialApp(
// title: 'Teste',
// home: GlobalInherited(
// child: TaskInherited(    // para avisar as mudanças do inherited ele precisa ser pai de todos
// // agora é mãe de todos e posso acessar as informações do tasklist de qualquer lugar
// child: InitialScreen(),   // o initial screen é obrigatório pq o widget acima pede isso
// ),
// ), // AQUI É O WIDGET QUE VAI APARECER NA TELA QUANDO DER RUN
// )
