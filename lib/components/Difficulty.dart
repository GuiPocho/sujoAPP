import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Row(                //coloco os icones em linha .....
      children: [
        Icon(Icons.diamond_sharp,
          size: 28,
          color: (difficultyLevel >= 1) ? Colors.teal[500] : Colors.teal[100],//caracteristicas dos icones
        ),
        Icon(Icons.diamond_sharp,
          size: 28,
          color: (difficultyLevel >= 2) ? Colors.teal[500] : Colors.teal[100],   // condição ternária
          //   se widget dificuldade for maior ou igual a 2 é cor azul se não é azul claro
        ),
        Icon(Icons.diamond_sharp,
          size: 28,
          color: (difficultyLevel >= 3) ? Colors.teal[500] : Colors.teal[100],
        ),
        Icon(Icons.diamond_sharp,
          size: 28,
          color: (difficultyLevel >= 4) ? Colors.teal[500] : Colors.teal[100],
        ),
        Icon(Icons.diamond_sharp,
          size: 28,
          color: (difficultyLevel >= 5) ? Colors.teal[500] : Colors.teal[100],
        ),
      ],
    );
  }
}

// onde eu criei a dificuldade (as 5 estrelas com as condioções)
// clico com direito e seleciono refactor -> extract flutter file
// no lugar vai ficar um outro com o nome que eu der acima
// apago todos os final que vão criar automaticamente
// temos o difficuldade que nçao chega ate aqui
//Na difficulty class crio uma final int difficultyLevel
//No construtopr preciso colocar required this.difficultyLevel
//Vou precisar mudar no Icon de widget.dificuldade para difficultyLevel
//no que ficou (Difficulty) vai receber o difficultyLevel da seguinte forma:
//Difficulty(difficultyLevel: widget.dificuldade)
// tiro toda a refatoiração criando um arquivo dart file para esse recorte
// não esquecer de importar a biblioteca material
// e no main importar o difficulty