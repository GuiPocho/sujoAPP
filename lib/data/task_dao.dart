import 'package:sqflite/sqflite.dart';
import '../components/Tarefas.dart';
import 'database.dart';

class TaskDao {

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT )';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save (Tarefas tarefas) async {

    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefas.nome);
    Map<String,dynamic> taskMap = toMap(tarefas);
    if(itemExists.isEmpty){
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      return await bancoDeDados.update(_tablename, taskMap,
        where: '$_name = ?',
        whereArgs: [tarefas.nome],
      );
    }

  }

  Map <String, dynamic> toMap (Tarefas tarefas){
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefas.nome;
    mapaDeTarefas[_difficulty] = tarefas.dificuldade;
    mapaDeTarefas[_image] = tarefas.foto;

    return mapaDeTarefas;

  }

  Future<List<Tarefas>> findAll() async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename );
    return toList(result);
  }

  List<Tarefas> toList(List<Map<String, dynamic>> mapaDeTarefas) {

    final List<Tarefas> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas){
      final Tarefas task = Tarefas(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(task);
    }

    return tarefas;

  }

  Future<List<Tarefas>> find(String nomeDaTarefa) async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    return toList(result);
  }


  delete(String nomeDaTarefa) async{
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );

  }

}