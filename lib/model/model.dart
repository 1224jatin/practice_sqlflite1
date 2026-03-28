class Task{
  final String taskName ;
  final String taskDescription ;

  Task({
    required this.taskName,
    required this.taskDescription
});
  Map<String, dynamic> ToMap(Task task ) {
    return {
      "taskName" : taskName,
      "taskDescription" : taskDescription
    };
  }

  factory Task.fromMap(Map<String,dynamic> map){
    return Task (
      taskName: map['taskName'],
      taskDescription: map['taskDescription']
    );
  }
}
