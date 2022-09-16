import 'package:intl/intl.dart';

String getCurrentDate() {
  final nowDate = DateTime.now();
  final formatDate = DateFormat('EEEE ,dd MMM').format(nowDate);
  return formatDate;
}
