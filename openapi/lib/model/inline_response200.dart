part of openapi.api;

class InlineResponse200 {
  
  List<TaskSchema> data = [];
  
  PagingSchema paging = null;
  InlineResponse200();

  @override
  String toString() {
    return 'InlineResponse200[data=$data, paging=$paging, ]';
  }

  InlineResponse200.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    data = (json['data'] == null) ?
      null :
      TaskSchema.listFromJson(json['data']);
    paging = (json['paging'] == null) ?
      null :
      PagingSchema.fromJson(json['paging']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (data != null)
      json['data'] = data;
    if (paging != null)
      json['paging'] = paging;
    return json;
  }

  static List<InlineResponse200> listFromJson(List<dynamic> json) {
    return json == null ? List<InlineResponse200>() : json.map((value) => InlineResponse200.fromJson(value)).toList();
  }

  static Map<String, InlineResponse200> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, InlineResponse200>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = InlineResponse200.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse200-objects as value to a dart map
  static Map<String, List<InlineResponse200>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<InlineResponse200>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = InlineResponse200.listFromJson(value);
       });
     }
     return map;
  }
}

