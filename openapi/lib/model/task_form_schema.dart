part of openapi.api;

class TaskFormSchema {
  
  String title = null;
  
  String description = null;
  
  bool done = null;
  TaskFormSchema();

  @override
  String toString() {
    return 'TaskFormSchema[title=$title, description=$description, done=$done, ]';
  }

  TaskFormSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title = json['title'];
    description = json['description'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (title != null)
      json['title'] = title;
      json['description'] = description;
    if (done != null)
      json['done'] = done;
    return json;
  }

  static List<TaskFormSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<TaskFormSchema>() : json.map((value) => TaskFormSchema.fromJson(value)).toList();
  }

  static Map<String, TaskFormSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TaskFormSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TaskFormSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TaskFormSchema-objects as value to a dart map
  static Map<String, List<TaskFormSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TaskFormSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TaskFormSchema.listFromJson(value);
       });
     }
     return map;
  }
}

