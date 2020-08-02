import 'package:intl/intl.dart';

class Filter {
  static String truncate(String value,
      {int length = 20, String omission = '...'}) {
    var response = value ?? '';
    if (response.length > length) {
      response = '${response.substring(0, length - omission.length)}$omission';
    }
    return response;
  }

  static String datetime(DateTime dateTime,
      {String pattern = 'yyyy/MM/dd HH:mm:ss'}) {
    if (dateTime == null) {
      return '';
    }

    final dateFormat = DateFormat(pattern);
    return dateFormat.format(dateTime);
  }
}
