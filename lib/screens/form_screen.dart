import 'package:flutter/material.dart';
import 'package:testando/components/Tarefas.dart';
import 'package:testando/data/task_dao.dart';
import 'package:testando/data/task_inherited.dart';


// criando uma tela de formulário

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});  // preciso colocar o required da final abaixo
  // agora a tela de formulario sempre vai pedir por um contexto

  final BuildContext taskContext;  // parametro criado para ter conversa entre contextos

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();  // no controller chamo o nome
  // tipo                nome              widget
  TextEditingController difficultyController = TextEditingController(); //para o segundo campo
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // é uma variavel que recebe chave global do tipo estado de formulario
  // fica de olho no estado do formulario    tudo que está no form que seja validador de formulario

  bool valueValidator(String? value){        //metodo booleano    chamado valueValidator que recebe string chamada value que pode ser vazia
    if (value != null && value.isEmpty){     // se atende isso é verdadeiro
      return true;
    }
    return false;                           // se não é falso
  }
  // vou usar isso nos validadores abaixo para não repetir código

  bool difficultyValidator(String? value){
    if (value != null && value.isEmpty){
      if (int.parse(value) > 5 ||
          int.parse(value) < 1){
        return true;
      }           // 1 condicao
    }             // 2 condição    se não atender retorna falso
    return false;
  }

  // vou usar isso nos validadores abaixo para não repetir código

  @override
  Widget build(BuildContext context) {
    return Form(  // como tem ForTextField esse engloba tudo e verifica se está tudo valido
      key: _formKey,   // chave fica de olho no estado do formulario   e precisa de uma global key antes do override
      child: Scaffold(         // estrutura basica
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title:  Text('SELECIONE A HABILIDADE:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,

          ),),
        ),
        body: Center(   // centraliza o container abaixo e tudo que estiver nele
          child: SingleChildScrollView(     // tela fica scrolavel, adapapta para nao dar overflow
            child: Container(    // o container tem as medidas
              height: 650,
              width: 375,
              decoration: BoxDecoration(  // decoradodo com:
                color: Colors.grey[900],    // cor
                borderRadius: BorderRadius.circular(8),   // borda arrendodada
                border: Border.all(width: 6,
                color: Colors.teal.shade100),             // borda externa
              ),
              child: Column(     // na coluna
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [      // tenho elementos no container cinza
                  Padding(                   // criado um padding para ter algum espaçamento em volta
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(            // formulario que permite validação
                      validator: (String? value){   //validador precisa de String? e valor
                        if (valueValidator(value)){ //Se valor difere nulo e for vazio
                          return 'digite o nome'; //retorna esse texto      // la em cima no metodo esse é true
                        }
                        return null; //Se não não faz nada, é nulo                   // esse é false
                      },
                      controller: nameController,   // pede uma var de edição de texto de controle (criado no formScreen State)
                      // significa que o que eu escrever aqui vai para o name controller
                      textAlign: TextAlign.center,     // alinhamento do formulario não obrigatorio
                      decoration: InputDecoration(      // quais as decorações
                          border: OutlineInputBorder(),   // linha envolta
                          hintText: 'Insira a habilidade',     // texto de dica preenchimento
                          fillColor: Colors.teal[100],       // cor
                          filled: true                    // se está preenchido (todos esses são obrigatórios)
                      ),
                    ),
                  ),
                  Padding(                   // replicado o de cima
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(            // formulario que permite validação
                      validator: (value){     // validador precisa de um valor
                        if (difficultyValidator(value)){

                          // value!.isEmpty ||    // valor do validador é nulo ! ou vazio .isEmpty
                          // int.parse(value) > 5 ||  // é maior que 5 (int.parse converte para numero)
                          // int.parse(value) < 1) {      // é menor que 1
                          return 'valor válido de 1 a 5';
                        }
                        return null;   // se tudo esta bem, nao retorna nada
                      },
                      keyboardType: TextInputType.number,  //muda o tipo de taclado
                      controller: difficultyController,   // para cada um que mudar crio um novo como o primeiro
                      // significa que o que eu escrever aqui vai para o name controller
                      // para usar um numero preciso transformar com int.parse
                      textAlign: TextAlign.center,     // alinhamento do formulario não obrigatorio
                      decoration: InputDecoration(      // quais as decorações
                          border: OutlineInputBorder(),   // linha envolta
                          hintText: 'Digite a dificuldade de 1 a 5',     // texto de dica preenchimento
                          fillColor: Colors.teal[100],       // cor
                          filled: true                    // se está preenchido (todos esses são obrigatórios)
                      ),
                    ),
                  ),
                  Padding(                   // criado um padding para ter algum espaçamento em volta
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(            // formulario que permite validação
                      onChanged: (text){     // qdo muda fica de olho no TEXTO
                        setState(() {        // avisa que mudou

                        });
                      },
                      validator: (value){    // função anonima com (value)
                        if (valueValidator(value)){    // se value é nulo ou vazio     // aqui usei o metodo criado acima
                          return 'http://imagem.png';   // faz isso                      // esse é true
                        }
                        return null;  // se estiver ok segue                           // esse é false
                      },
                      keyboardType: TextInputType.url,   // muda o tipo de teclado
                      controller: imageController,   // pede uma var de edição de texto de controle (criado no formScreen State)
                      // significa que o que eu escrever aqui vai para o name controller
                      textAlign: TextAlign.center,     // alinhamento do formulario não obrigatorio
                      decoration: InputDecoration(      // quais as decorações
                          border: OutlineInputBorder(),   // linha envolta
                          hintText: 'Imagem da habilidade',     // texto de dica preenchimento
                          fillColor: Colors.teal[100],       // cor
                          filled: true                    // se está preenchido (todos esses são obrigatórios)
                      ),
                    ),
                  ),
                  Container(               // caixa para a imagem
                    height: 100,           // tamanhos
                    width: 72,           // tamanhos
                    decoration: BoxDecoration(     //decoração da box
                      color: Colors.teal[100],           // cor
                      borderRadius: BorderRadius.circular(10),   //borda
                      border: Border.all(
                        width: 4,      //largura borda
                        color: Colors.teal.shade700,    // cor da borda
                      ),
                    ),
                    child: ClipRRect(    //aqui vem a imagem relativo ao container acima RRECR permite manipular a imagem construida
                      borderRadius: BorderRadius.circular(10),    //como vai ficar a imagem
                      child: Image.network(imageController.text,     //é o filho que recebe a info da imagem
                        errorBuilder: (BuildContext context, Objectexception, StackTrace? stackTrace){
                          return Image.asset('assets/images/noPhoto.jpg');    //fica de olho na exceção e na pilha, se tiver constroi no contexto com isso
                        },
                        fit: BoxFit.cover,
                        //como vai ficar a imagem
                      ),
                      //ate aqui não avisei que a url mudou    preciso de un setState
                      // crio um onChange no TextFormField da imagem
                      // vai receber a informação do controller
                    ),
                  ),
                  ElevatedButton(
                    style:  ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal.shade700,),
                    ),

                    onPressed: (){

                    if (_formKey.currentState!.validate()) {  //se  o formulario (_formKey) estiver no estado de valido faz o que quiser se não nçao faça nada
                      TaskDao().save(Tarefas(nameController.text, imageController.text, int.parse(difficultyController.text))
                     // TaskInherited.of(widget.taskContext).newTask(    //taskinherited é o que tem as infos,   -- esse contexto ainda não é o mesmo --
                        // agora estamos pegando o contexto trazido pelo formulario        // pega o contexto que as infos estao inseridas .of(context)
                        // chamo a função newtask para buscar essas infos
                      //  nameController.text, imageController.text, int.parse(difficultyController.text),   // as informações estão nessas variaveis
                      );

                      ScaffoldMessenger.of(context).showSnackBar( // função do scaffold, da uma mensagem dentro da tela atual, e mostyra um snakbar
                        const SnackBar(         //tem uma constante snackbar
                          content: Text('Adicionando nova habilidade',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),),  //contendo um texto
                        ),
                      );
                      Navigator.pop(context);  // para retorno de pagina usa o pop para nao ficar construindo uma em cima da outra
                    }
                  },
                    child:
                    Text('ADICIONAR',
                    style: TextStyle(
                      color: Colors.teal[100],
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
