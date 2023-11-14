import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {

  final String nome;
  final int dificuldade;

  const Tarefas({super.key, required this.nome, required this.dificuldade});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Exemplo extends StatelessWidget {
  const Exemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solucao',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          toolbarHeight: 80,
          title: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('1'),
                  Text('2'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('3'),
                  Text('4'),
                ],
              ),
            ],
          ),  //AÇÕES NO APPBAR
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.lightBlue,
                ),
                height: 140,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white54,
                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('info 1',),
                      Text('Info 2'),
                      ElevatedButton(
                          onPressed: (){},
                          child: Icon(
                              Icons.add_box_outlined),
                      )
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

