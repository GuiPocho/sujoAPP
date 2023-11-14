import 'package:flutter/material.dart';
import 'package:testando/components/Tarefas.dart';
import 'package:testando/data/task_dao.dart';
import 'package:testando/data/task_inherited.dart';
import 'package:testando/globallevel.dart';
import 'package:testando/screens/form_screen.dart';



class InitialScreen extends StatefulWidget {

  const InitialScreen({super.key});

  final int updateLevel = 0;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final List<Tarefas> listaDeTarefas = [
    Tarefas('um', 'assets/images/boxing.jpg', 3,),
    Tarefas('dois', 'assets/images/boxing1.jpg', 5,),
    Tarefas('tres', 'assets/images/boxing2.jpg', 1,),
  ];



  @override
  Widget build(BuildContext context) {



    return Scaffold(        // estrutura com appbar, body e elevated button
      backgroundColor: Colors.grey[900],
      appBar: AppBar(          // tela na parte de cima
        actions: [
          IconButton(onPressed: (){setState(() {

          });}, icon: Icon(Icons.recycling_sharp,
          size: 40,
          color: Colors.teal[100],),)
        ],
        backgroundColor: Colors.teal[500],
        toolbarHeight: 80,              //TAMANHO DO TOOLBAR
        title: Column(            // numa coluna: um em cima do outro
          children: [
            Row(                // tenho uma linha: um ao lado do outro
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,                // alinhamento da linha
              children: [
                Icon
                  (Icons.person,
                size: 50,
                color: Colors.black,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.asset('assets/images/iron1.png'),

                      ),
                    ),
                    Text('HABILIDADES',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),),
                  ],
                ), // Primeira informação da linha

              ],
            ),

          ],
        ),
      ),
      body:

      Stack(
        children:
            [Padding(padding: EdgeInsets.only(top: 65, bottom: 70,),
            child: FutureBuilder<List<Tarefas>>(
              future: TaskDao().findAll(),
                builder: (context, snapshot){
              List<Tarefas>? items = snapshot.data;
             switch (snapshot.connectionState){
               case ConnectionState.none:
                 return Center(
                   child: Column(
                     children: [
                       CircularProgressIndicator(),
                       Text('Loading...'),
                     ],
                   ),
                 );
                 break;
               case ConnectionState.waiting:
                 return Center(
                   child: Column(
                     children: [
                       CircularProgressIndicator(),
                       Text('Loading...',),
                     ],
                   ),
                 );
                 break;
               case ConnectionState.active:
                 return Center(
                   child: Column(
                     children: [
                       CircularProgressIndicator(),
                       Text('Loading...'),
                     ],
                   ),
                 );
                 break;
               case ConnectionState.done:
                 if (snapshot.hasData && items != null){
                   if (items.isNotEmpty) {
                     return ListView.builder(
                         itemCount: items.length,
                         itemBuilder: (BuildContext context, int index){
                           final Tarefas tarefa = items[index];
                           return tarefa;
                         });
                   }
                   return Center(
                     child: Column (
                       children: [
                         Icon(Icons.error_outline, size: 128,
                         color: Colors.teal,),
                         Text('Não há tarefas',
                         style: TextStyle(fontSize: 32,
                             color: Colors.teal ),
                         ),
                       ],
                     ),
                   );
                 }
                 return Text('Tem um erro');

                 break;
             }
             return Text('Erro desconhecido');
                } ,),
            ),



      //  [ListView(   // as tarefas alinhadas de cima para baixo(column) substituido por List View para não dar over flow

      //    children: TaskInherited.of(context).taskList,   // tirei as tarefas iniciais para colocar o taskList, já que o inherited já é acessivel
      //    padding: EdgeInsets.only(top: 65, bottom: 70,),   // margem para melhor visualização

      //    ),
              MaxLevel(),

            ],
    //],
      ),
      floatingActionButton:  FloatingActionButton(      // estrutura basica de botão
        backgroundColor: Colors.teal[700],

        onPressed: (){       //ao pressionar

          Navigator.push(
            context,
            MaterialPageRoute(     // mudei o context do builder para contextNew -- o formscreen agora pede um required taskContext criado
              builder: (contextNew) => FormScreen(taskContext: context,),   // CONSTRÓI A TELA COM NOVO CONTEXTO E DESSA FORMA NÃO CONVERSAM ENTRE CONTEXTOS
              // a tela de formulario precisa receber o contexto anterior
              // formulario precisa pedir o contexto (( feito no form_screen))
            ),
          ).then((value) => setState((){
            print('só por exemplo');
          }));
        },
        child: Icon(Icons.add,
          color: Colors.teal[100],
        ),    // o filho mostra qual o icone do botão
      ),
    );
  }
}


// as imagens - criei um diretorio no projeto (assets)
// no assets criei um diretorio (images)
// arrastei as imagens para la
// vou no arquivo PUBSPEC.YAML
// essencial para avisar coisas novas
// em geral na linha 60 fala sobre adicionar images

// seguir o formato
// assets:
// - assets/images/

// clica em pubget
// mudo de image.network para image.asset
//coloco assets/image/nome.formato