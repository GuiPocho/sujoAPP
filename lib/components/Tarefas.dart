  import 'package:flutter/material.dart';
  import 'package:testando/components/Difficulty.dart';
import 'package:testando/data/task_dao.dart';




  class Tarefas extends StatefulWidget {          // Tarefas é uma classe que precisa desse Stateless ou Statefull
    final String nome;                             // var usada para mudar os nomes inicializado (86) incluido (110) usado (73-75)
    //inicia toda vez e precisa dizer sempre qual é
    // inicializada em this. - uso no widget criado stateless - preciso descrever nas Tarefas
    final String foto;                             // é uma final para mudar a imagem da Tarefa
    final int dificuldade;                         // final para definir a dificuldade da tarefa

    Tarefas(this.nome, this.foto, this.dificuldade,{super.key,});   //todas as final estão inicializadas aqui com this.
  // não é mais const porque não quero inicializar, quero que seja 0 sempre que eu criar uma nova
    // e não quero que suma quando eu sair

    // as variaveis sairam da linha 24 e vieram pra ca
    // com isso onde tem essas variaveis passam a ser widget.nome

    int nivel = 0;                    // NIVEL É SOBRE A MUDANÇA DE COR DA TELA

    List<Color> currentColor = [Colors.amber.shade200, Colors.amber.shade300,Colors.amber.shade400,Colors.amber,Colors.amber.shade600,Colors.amber.shade700];  //LISTA DE CORES PARA MUDANÇA
    int colorIndex = 1;         // INDEX REFERENTE AS CORES
    int globalChange = 0; //////////////////////////////////
    int updateLevel = 0;


    @override
    State<Tarefas> createState() => _TarefasState();         //criado pelo statefull para verificar se está mudando e redesenha
  }

  class _TarefasState extends State<Tarefas> {        //inicializo o final com this.nome

    //Color buttonColor = Colors.blue;   //******************************************
    //int levelUp = 0;

    //@override
    //void initState() {
    //  super.initState();
    //  buttonColor = widget.dificuldade >= 10 ? Colors.green : Colors.blue;
    //}

    bool assetOrNetwork(){     // metodo para saber se a imagem é da internet ou se é asset
      if (widget.foto.contains('http')){   // se widget.foto tiver http
        return false;             // retorna falso
      }
      return true;                // se não retorna verdadeiro
    }

    @override
    Widget build(BuildContext context) {
      //int nivel = 0;    //com o setState o que está aqui é redesenhado para não perder vai ANTES do @override                        //pode chamar a var com $nivel
      return Padding(                 //usado para distanciar
        padding: const EdgeInsets.all(8.0),     //com essas informações
        child: Stack(                 // esse container tem um filho (que é uma pilha)
          children: [                 // precisa ter filhos
            Container(              //um dos filhos é um campo que fica na base
              //color: Colors.green, // com essas caracteristicas // foi retirado porque usei o boxdecoration
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.currentColor[widget.colorIndex],    // A COR RECEBE O NOME REFERENTE A LISTA E O INDEX
              ),
              height: 140, // com essas caracteristicas
            ),
            Column(                    //esse containet é menor, entao com uma coluna o TEXT aparece ao final
              children: [
                Container(             // outro filh é um campo menor em cima do outro porque está na frente
                  //color: Colors.white, // com essas caracteristicas   //foi retirado daqui pq usei o boxdecoration
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.amber.shade400,
                      width: 2,
                    ),

                  ),
                  height: 100, // com essas caracteristicas
                  child: Row(                           // o container precisa de um filho para criar outras coisas (no caso uma linha)
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,        // alinha tudo que está na linha
                    children: [               //precisa de filhos para incluir coisas dentro
                      Container(             // criando uma caixa na linha

                        //color: Colors.grey, // com essas caracteristicas   // retirado daqui porque usamos o boxdecoration
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),  //o container recebe a border radius
                          color: Colors.teal[100],
                        ),
                        width: 72, // com essas caracteristicas
                        height: 100, // com essas caracteristicas
                        child: ClipRRect(                // para colocar uma border radius na imagem usa esse widget
                            borderRadius: BorderRadius.circular(5),
                            child: assetOrNetwork() ? Image.asset(   // o metodo é um asset?
                              widget.foto,                         // faça isso
                              fit: BoxFit.fill,
                            ) : Image.network(                     // não é asset?
                              widget.foto,                         // faça isso
                              fit: BoxFit.fill,
                            )
                          // retirei o que tinha aqui e fiz um operador ternario
                          // Image.asset(             // um filho que busca a imagem da internet(network)
                          //   widget.foto,                    //busca a foto colocada nas Tarefas (pega o url)
                          //   fit: BoxFit.fitHeight,          //preenchimento da imagem no campoespecificado
                          // ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(                   //para o nivel ficar embaixo do nome
                            mainAxisAlignment: MainAxisAlignment.center,    //alinhamento eixo |
                            crossAxisAlignment: CrossAxisAlignment.center,   //alinhamento eixo __
                            children: [
                              SizedBox(               //para poder ter uma limitação e evitar overflow melhor é sizedbx pq é mais leve
                                width: 100,            //tamanho para não dar over flow
                                child: Text(widget.nome,           // criando um texto após a caixa  NOME é o que está escrito em tarefas em cima
                                  style: TextStyle(fontSize: 26,      //estilização do texto
                                    overflow: TextOverflow.fade,    //o que acontece se tiver overflow no texto
                                  ),
                                ),
                              ),
                              Difficulty(     // tem infos disso no Difficulty.dart e para fincionar importei o difficulty
                                difficultyLevel: widget.dificuldade,
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(                 // criando um botão após o texto
                            onLongPress: () async {
                              showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Excluir Tarefa?'),
                                  content: Text('Não poderá ser desfeito'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Não'),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await TaskDao().delete(widget.nome);
                                        setState(() {});
                                        Navigator.pop(context, 'Sim');
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );


                            },

                            onPressed: () {             // quando pressionar faz algo (){} é algo vazio
                              setState(() {             //é o que muda o estado alterando na contrução
                                if (widget.colorIndex != 5 && (widget.nivel/widget.dificuldade) ==10){
                                  // SE INDEX DIFERE DE 5 E NIVEL / DIF FOR = 10
                                  widget.colorIndex ++;

                                  // INDEX DE COR +1
                                  widget.nivel = 0;
                                  // NIVEL VOLTA 0
                                  widget.globalChange ++;
                                  widget.updateLevel ++;
                                } else if (widget.colorIndex != 5 && widget.nivel/widget.dificuldade != 10){
                                  // SE NÃO, SE INDEX DIFERE DE 5 E NIVEL / DIFICULDADE DIFERE 10
                                  widget.nivel ++;
                                  // AUMENTA APENAS NIVEL
                                } else {
                                  //SE NAO
                                  widget.nivel ++;
                                  //AUMENTA NIVEL
                                }
                              },
                              );

                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.teal.shade700,
                              )
                            ),
                            child: Icon(              // precisa de um filho que recebe algo (no caso um icone)
                              Icons.plus_one_sharp, // tipo do icone
                              color: Colors.teal[100],

                            ),
                          ),

                          // ),

                        ],
                      ),
                    ],
                  ),
                ),
                Row(        // envolve o text e o restante para estar numa linha
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,          //alinhamento da linha toda
                  children: [
                    Padding(                              //Para criar distancia no container
                      padding: const EdgeInsets.all(10.0),   //padding da BARRA LINEAR
                      child: Container(                      //envolve no container para que o linear tenha tamanho maximo
                        child: LinearProgressIndicator( //barra de progresso
                          color: Colors.amberAccent[700],         //cor da barra
                          value: (widget.dificuldade > 0)
                              ? (widget.nivel/widget.dificuldade) /10                  // como vai evoluir a barra era nivel/10,
                              : 1,         //se widget.dific maior 0 então faz a divisão, se não = 1
                        ),
                        width: 200,      //tamanho do CONTAINER
                      ),
                    ),
                    Padding(              //para criar distancia no container
                      padding: const EdgeInsets.all(10.0),       //padding do texto para o final
                      child: Text('NIVEL: ${widget.nivel}',            //após o container menor    / $nivel trás a alteração em cada um dos valores a mudar
                        // coloco entre chaves para trazer como widget nesse caso
                        style: TextStyle(         //estilo, estilo do texto
                          color: Colors.black,    //informações de estilo
                          fontSize: 18,           //informações de estilo
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

