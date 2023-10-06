class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false
});

  static Set<ToDo> todoList(){
    return{
      ToDo(id:'01', todoText: 'Morning Excerise', isDone: true),
      ToDo(id:'02', todoText: 'Buy Groceries', isDone: true),
      ToDo(id:'03', todoText: 'Team meet'),
      ToDo(id:'04', todoText: 'Work on app'),
      ToDo(id:'05', todoText: 'Dinner date'),
      ToDo(id:'06', todoText: 'Study'),

    };
  }
}