import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateHelper on DateTime {
  ///print only date without time
  String toDateOnly() {
    return '$day/$month/$year';
  }

  /////show date like this 'June 9, 1912'
  String toDate(Locale locale) {
    ///format date like this June 9, 1912
    final format = DateFormat.yMMMMd(locale.languageCode);
    return format.format(this);
  }
}
