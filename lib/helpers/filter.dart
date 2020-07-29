class Filter {
  static String truncate(String value,
      {int length = 20, String omission = '...'}) {
    var response = value ?? '';
    if (response.length > length) {
      response = '${response.substring(0, length - omission.length)}$omission';
    }
    return response;
  }
}
