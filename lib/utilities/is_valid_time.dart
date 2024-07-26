part of 'a_utilities.dart';

bool isValidTime(String time) {
  if (time == '') return false;
  // Split the time string into separate hour, minute, and second components
  List<String> timeComponents = time.split(':');
  int hour = int.parse(timeComponents[0]);
  int minute = int.parse(timeComponents[1]);
  int second = int.parse(timeComponents[2]);

  // Check if the hour, minute, and second values are within the valid range
  if (hour < 0 || hour > 23) {
    return false;
  }
  if (minute < 0 || minute > 59) {
    return false;
  }
  if (second < 0 || second > 59) {
    return false;
  }

  return true;
}
