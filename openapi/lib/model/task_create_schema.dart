part of openapi.api;

class TaskCreateSchema {
  
  TaskFormSchema task = null;
  TaskCreateSchema();

  @override
  String toString() {
    return 'TaskCreateSchema[task=$task, ]';
  }

  TaskCreateSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    task = (json['task'] == null) ?
      null :
      TaskFormSchema.fromJson(json['task']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (task != null)
      json['task'] = task;
    return json;
  }

  static List<TaskCreateSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<TaskCreateSchema>() : json.map((value) => TaskCreateSchema.fromJson(value)).toList();
  }

  static Map<String, TaskCreateSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TaskCreateSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TaskCreateSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TaskCreateSchema-objects as value to a dart map
  static Map<String, List<TaskCreateSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TaskCreateSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TaskCreateSchema.listFromJson(value);
       });
     }
     return map;
  }
}

