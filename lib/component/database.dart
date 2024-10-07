import 'package:hive/hive.dart';

class ToDoDatabase {

  List toDoList = [ ];
  //reference our box
  final _myBox = Hive.box("mybox");

   //run this method if this is the first time ever opening this app
    void createInitialData(){
      toDoList = [
        ['Attend Python programming class',false],
        ['Read about json web token',false],
      ];
    }

    //load the data from database
     void loadData() {
       toDoList = _myBox.get("TODOLIST");
     }
    //update the database
    void updateDatabase() {
       _myBox.put("TODOLIST", toDoList);
    }
}