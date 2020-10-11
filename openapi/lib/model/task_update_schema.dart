part of openapi.api;

class TaskUpdateSchema {
  
  TaskFormSchema task = null;
  TaskUpdateSchema();

  @override
  String toString() {
    return 'TaskUpdateSchema[task=$task, ]';
  }

  TaskUpdateSchema.fromJson(Map<String, dynamic> json) {
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

  static List<TaskUpdateSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<TaskUpdateSchema>() : json.map((value) => TaskUpdateSchema.fromJson(value)).toList();
  }

  static Map<String, TaskUpdateSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TaskUpdateSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TaskUpdateSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TaskUpdateSchema-objects as value to a dart map
  static Map<String, List<TaskUpdateSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TaskUpdateSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TaskUpdateSchema.listFromJson(value);
       });
     }
     return map;
  }
}

