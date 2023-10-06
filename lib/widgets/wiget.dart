import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

class ToDoItem extends StatelessWidget {
   final ToDo todo;
   final onToDoChanged;
   final onDeleteItem;
  const ToDoItem({super.key, required this.todo, required this.onDeleteItem, required this.onToDoChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:20),
      child: ListTile(
        onTap: (){
           //print('Check Box Clicked');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone? Icons.check_box : Icons.check_box_outline_blank_outlined,
            color: Colors.blueAccent),
        title: Text(
          todo.todoText!,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          decoration: todo.isDone? TextDecoration.lineThrough : TextDecoration.none,
        )),
          trailing:Container(
            padding: EdgeInsets.all(0),
          margin:EdgeInsets.symmetric(vertical:12 ),
          height:35,
        width:35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        child: IconButton(
          color: Colors.white,
            iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: (){
            //print('Clciked delete');
            onDeleteItem(todo.id);
          },
        ),
      ) ,
      ),
    );
  }
}
