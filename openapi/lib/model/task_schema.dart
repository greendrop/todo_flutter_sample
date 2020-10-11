part of openapi.api;

class TaskSchema {
  
  num id = null;
  
  String title = null;
  
  String description = null;
  
  bool done = null;
  
  DateTime createdAt = null;
  
  DateTime updatedAt = null;
  TaskSchema();

  @override
  String toString() {
    return 'TaskSchema[id=$id, title=$title, description=$description, done=$done, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  TaskSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    description = json['description'];
    done = json['done'];
    createdAt = (json['created_at'] == null) ?
      null :
      DateTime.parse(json['created_at']);
    updatedAt = (json['updated_at'] == null) ?
      null :
      DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (title != null)
      json['title'] = title;
      json['description'] = description;
    if (done != null)
      json['done'] = done;
    if (createdAt != null)
      json['created_at'] = createdAt == null ? null : createdAt.toUtc().toIso8601String();
    if (updatedAt != null)
      json['updated_at'] = updatedAt == null ? null : updatedAt.toUtc().toIso8601String();
    return json;
  }

  static List<TaskSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<TaskSchema>() : json.map((value) => TaskSchema.fromJson(value)).toList();
  }

  static Map<String, TaskSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TaskSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TaskSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of TaskSchema-objects as value to a dart map
  static Map<String, List<TaskSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<TaskSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = TaskSchema.listFromJson(value);
       });
     }
     return map;
  }
}

