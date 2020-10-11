part of openapi.api;

class UserSchema {
  
  num id = null;
  
  String email = null;
  
  DateTime createdAt = null;
  
  DateTime updatedAt = null;
  UserSchema();

  @override
  String toString() {
    return 'UserSchema[id=$id, email=$email, createdAt=$createdAt, updatedAt=$updatedAt, ]';
  }

  UserSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    email = json['email'];
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
    if (email != null)
      json['email'] = email;
    if (createdAt != null)
      json['created_at'] = createdAt == null ? null : createdAt.toUtc().toIso8601String();
    if (updatedAt != null)
      json['updated_at'] = updatedAt == null ? null : updatedAt.toUtc().toIso8601String();
    return json;
  }

  static List<UserSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<UserSchema>() : json.map((value) => UserSchema.fromJson(value)).toList();
  }

  static Map<String, UserSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UserSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = UserSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserSchema-objects as value to a dart map
  static Map<String, List<UserSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<UserSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = UserSchema.listFromJson(value);
       });
     }
     return map;
  }
}

