part of 'a_utilities.dart';

String formatDateDDMMMMYY(String? val) {
  if (val == null) {
    return '';
  } else {
    final DateTime valConvert = DateTime.parse(val);
    final DateFormat day = DateFormat('d');
    final DateFormat month = DateFormat('MMMM');
    final DateFormat year = DateFormat('y');
    final String dayFormatted = day.format(valConvert);
    final String monthFormatted = month.format(valConvert);
    final String yearFormatted = year.format(valConvert);
    return '$dayFormatted ${monthFormatted.substring(0, 3)} $yearFormatted';
  }
}
