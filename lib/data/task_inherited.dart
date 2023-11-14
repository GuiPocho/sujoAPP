

import 'package:flutter/material.dart';
import 'package:testando/components/Tarefas.dart';

// digito inh já tras a construção
// coloco o nome da classe

// Para passar a info ele precisa ser pai de tudo e não de um especifico

class level{

}

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  // é uma final é uma List com nome taskList
  //denomino como Tarefas e agora só aceita Tarefas

  final List<Tarefas> taskList = [            // crio uma lista com as tarefas
    Tarefas('ARCO E FLECHA', 'assets/images/archery1.png', 3),                     // vai auto-completar
    Tarefas('ESPADA', 'assets/images/sword1.png', 5),                 // a estrutura montada chamado como widget
    Tarefas('MAGIA', 'assets/images/MAGE.png', 1),
  ];

  void newTask(String name, String photo, int difficulty){ //crio uma função com parametros que preciso
    taskList.add(Tarefas(name, photo, difficulty,  // o taskList acessa alguns metodos entre eles o add com os parametros nomeados
    ),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }


  // é quem fica de olho no estado da informação
  // fica de olho no estado anterior
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;  // fica de olho se o tamanho anterior é diferente do atual
  }
}