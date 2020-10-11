part of openapi.api;

class PagingSchema {
  
  num totalCount = null;
  
  num limitValue = null;
  
  num totalPages = null;
  
  num currentPage = null;
  PagingSchema();

  @override
  String toString() {
    return 'PagingSchema[totalCount=$totalCount, limitValue=$limitValue, totalPages=$totalPages, currentPage=$currentPage, ]';
  }

  PagingSchema.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    totalCount = json['total_count'];
    limitValue = json['limit_value'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (totalCount != null)
      json['total_count'] = totalCount;
    if (limitValue != null)
      json['limit_value'] = limitValue;
    if (totalPages != null)
      json['total_pages'] = totalPages;
    if (currentPage != null)
      json['current_page'] = currentPage;
    return json;
  }

  static List<PagingSchema> listFromJson(List<dynamic> json) {
    return json == null ? List<PagingSchema>() : json.map((value) => PagingSchema.fromJson(value)).toList();
  }

  static Map<String, PagingSchema> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PagingSchema>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = PagingSchema.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of PagingSchema-objects as value to a dart map
  static Map<String, List<PagingSchema>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<PagingSchema>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = PagingSchema.listFromJson(value);
       });
     }
     return map;
  }
}

