class Task{
  final String taskName ;
  final String taskDescription ;

  Task({
    required this.taskName,
    required this.taskDescription
});
  Map<String, dynamic> ToMap() {
    return {
      "taskName" : taskName,
      "taskDescription" : taskDescription
    };
  }
}
