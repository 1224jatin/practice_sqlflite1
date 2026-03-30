class Task{

  int?id;

  final String taskName ;
  final String taskDescription ;

  Task({
    this.id,
    required this.taskName,
    required this.taskDescription
});
  Map<String, dynamic> ToMap(Task task ) {
    return {
      "id":id,
      "taskName" : taskName,
      "taskDescription" : taskDescription
    };
  }

  factory Task.fromMap(Map<String,dynamic> map){
    return Task (
      id: map["id"],
      taskName: map['taskName'],
      taskDescription: map['taskDescription']
    );
  }
}
