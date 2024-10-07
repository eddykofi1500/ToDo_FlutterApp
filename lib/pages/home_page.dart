import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/component/database.dart';
import 'package:to_do/component/dialogBox.dart';
import 'package:to_do/component/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  initState()  {
    //if this is the first time ever openin the app, then create default data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final controller = TextEditingController();


  checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([controller.text,false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
           controller: controller,
            onCancel: () => Navigator.of(context).pop(),
            onSaved: saveNewTask,
          );
        }
    );
  }

  void deleteTask(int index) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.yellow[200],
       appBar: AppBar(
         title: Text('TO DO'),
         centerTitle: true,
         backgroundColor: Colors.yellow,
         elevation: 0,
       ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context,index){
            return TodoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChange(value, index),
                deleteFunction: (context) => deleteTask(index),
            );
          },
      ),
    );
  }

}
