import 'package:flutter/material.dart';
import 'package:todoapp/widgets/wiget.dart';
import 'package:todoapp/model/todo.dart';

class Home extends StatefulWidget {
      Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
      final todosList =ToDo.todoList();
      List<ToDo> _foundTodo=[];
      final _todoController =TextEditingController();
      @override
      void initState(){
        _foundTodo = todosList.toList();
        super.initState();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: _appBar(),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:25, bottom: 20),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Text(
                                'All To-Dos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          for( ToDo todoo in todosList)
                             ToDoItem(
                               todo: todoo,
                               onToDoChanged: _handleToDoChange,
                               onDeleteItem: _deleteToDoItem,
                             ),
                        ],
                      ),
                    ),

                  ],
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children:[
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only( bottom: 20, right: 20, left:20),
                       padding: EdgeInsets.symmetric(horizontal:10 ),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         boxShadow: const [BoxShadow(
                           color: Colors.white,
                           offset:Offset(0.0,0.0),
                           blurRadius: 10,
                           spreadRadius: 0.0,
                         ),],
                           borderRadius:BorderRadius.circular(10),
                       ),
                       child: TextField(
                        controller: _todoController,
                         decoration: InputDecoration(
                           hintText: 'Add a new todo item',
                           border: InputBorder.none,
                         ),
                       )
                     )
                   ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: (){
                          _addToDoItem(_todoController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          minimumSize: Size(60, 60),
                          elevation: 10
                        ),
                      )
                    )
                  ]
                )
              )
            ],
          ),
        );
      }
      AppBar _appBar(){
        return AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.black, size:30),
              Icon(Icons.person_3_rounded,color:Colors.black, size:30),

            ],
          ) ,
        );
      }

      void _handleToDoChange(ToDo todo){
        setState((){
          todo.isDone=!todo.isDone;
        });

      }
      void _deleteToDoItem(String id){
        setState(() {
          todosList.removeWhere((item) => item.id==id);
        });
      }

      void _addToDoItem(String toDo){
        setState(() {
          todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
        });
         _todoController.clear();
      }
       void  _runFilter(String enteredKeyword){
        List<ToDo> results =[];
        if(enteredKeyword.isEmpty){
          results=todosList.toList();
        }else{
          results = todosList.where((item) =>item.todoText!.toLowerCase().contains(enteredKeyword).toLowerCase().toList();       }
       }
      Widget searchBox(){
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child:TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size:20,
                  ),
                  prefixIconConstraints:BoxConstraints(maxHeight:20, minWidth: 25 ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color:Colors.grey)

              ),
            )
        );
      }
}


