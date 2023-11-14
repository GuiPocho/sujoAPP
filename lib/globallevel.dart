import 'package:flutter/material.dart';
import 'package:testando/components/Tarefas.dart';
import 'package:testando/data/task_inherited.dart';

class MaxLevel extends StatefulWidget {
  const MaxLevel({super.key});

  @override
  State<MaxLevel> createState() => _MaxLevelState();
}

class _MaxLevelState extends State<MaxLevel> {

double _upgradeLevel() {
double globalNivel = 0;

for(Tarefas tarefas in TaskInherited.of(context).taskList) {

globalNivel += (tarefas.updateLevel);
}
return globalNivel;
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.teal.shade100,
            width: 5,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              setState(() {

              });
            },
                icon: Icon(Icons.shield_sharp,
                size: 34,)),
            Column(
              children: [
                Text('MAESTRIA',
                style: TextStyle(
                  fontSize: 24,
                ),),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: LinearProgressIndicator(

                      value: (_upgradeLevel()>0)
                      ? (_upgradeLevel()/50)
                      : 1,
                      color: Colors.amberAccent[700],
                    ),
                    width: 120,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('LVL.',
                style: TextStyle(
                  fontSize: 14,
                ),),
                Text('${_upgradeLevel().toInt()}',
                style: TextStyle(
                  fontSize: 18,
                ),),
              ],
            ),
          ],
        ),
      ),

    );

  }
}

// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.stretch,
//
// children: [
// IconButton(onPressed: (){
// setState(() {
//
// });
// },
// icon: Icon(Icons.shield_sharp,
// size: 40,)),
// Column(
// children: [
// Text('MAESTRIA ${_upgradeLevel().toInt()}'),
// SizedBox(
// width: 150,
// child: LinearProgressIndicator(
// color: Colors.amberAccent,
// )),
// ],
// ),
// Column(
// children: [
// Text('gaiu'),
// Text('x'),
// ],
// )
// ],
// ),
// SizedBox(),
//
// ],
// )
