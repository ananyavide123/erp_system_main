import 'package:intl/intl.dart';

String formattedDate(DateTime dateTime) {
  // Create a DateFormat instance with the desired format
  DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm:ss a');
  // Format the DateTime object using the formatter
  String formattedDate = formatter.format(dateTime);
  return formattedDate;
}
