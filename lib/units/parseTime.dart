//时间戳转换成日期
import 'package:intl/intl.dart';

 parseTime(datetime,type) {
  var formatter = DateFormat(type).format(DateTime.fromMillisecondsSinceEpoch(datetime));
  return formatter;
}