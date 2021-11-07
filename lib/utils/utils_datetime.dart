/// Outputs year as four digits
///
/// Example:
///     formatDate(DateTime(1989), [yyyy]);
///     // => 1989
String yyyy = 'yyyy';

/// Outputs year as two digits
///
/// Example:
///     formatDate(DateTime(1989), [yy]);
///     // => 89
String yy = 'yy';

/// Outputs month as two digits
///
/// Example:
///     formatDate(DateTime(1989, 11), [mm]);
///     // => 11
///     formatDate(DateTime(1989, 5), [mm]);
///     // => 05
String mm = 'mm';

/// Outputs month compactly
///
/// Example:
///     formatDate(DateTime(1989, 11), [mm]);
///     // => 11
///     formatDate(DateTime(1989, 5), [m]);
///     // => 5
String m = 'm';

/// Outputs month as long name
///
/// Example:
///     formatDate(DateTime(1989, 2), [MM]);
///     // => february
String MM = 'MM';

/// Outputs month as short name
///
/// Example:
///     formatDate(DateTime(1989, 2), [M]);
///     // => feb
String M = 'M';

/// Outputs day as two digits
///
/// Example:
///     formatDate(DateTime(1989, 2, 21), [dd]);
///     // => 21
///     formatDate(DateTime(1989, 2, 5), [dd]);
///     // => 05
String dd = 'dd';

/// Outputs day compactly
///
/// Example:
///     formatDate(DateTime(1989, 2, 21), [d]);
///     // => 21
///     formatDate(DateTime(1989, 2, 5), [d]);
///     // => 5
String d = 'd';

/// Outputs week in month
///
/// Example:
///     formatDate(DateTime(1989, 2, 21), [w]);
///     // => 4
String w = 'w';

/// Outputs week in year as two digits
///
/// Example:
///     formatDate(DateTime(1989, 12, 31), [W]);
///     // => 53
///     formatDate(DateTime(1989, 2, 21), [W]);
///     // => 08
String ww = 'WW';

/// Outputs week in year compactly
///
/// Example:
///     formatDate(DateTime(1989, 2, 21), [W]);
///     // => 8
String W = 'W';

/// Outputs week day as long name
///
/// Example:
///     formatDate(DateTime(2018, 1, 14), [DD]);
///     // => sunday
String DD = 'DD';

/// Outputs week day as long name
///
/// Example:
///     formatDate(DateTime(2018, 1, 14), [D]);
///     // => sun
String D = 'D';

/// Outputs hour (0 - 11) as two digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15), [hh]);
///     // => 03
String hh = 'hh';

/// Outputs hour (0 - 11) compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15), [h]);
///     // => 3
String h = 'h';

/// Outputs hour (0 to 23) as two digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15), [HH]);
///     // => 15
String HH = 'HH';

/// Outputs hour (0 to 23) compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 5), [H]);
///     // => 5
String H = 'H';

/// Outputs minute as two digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40), [nn]);
///     // => 40
///     formatDate(DateTime(1989, 02, 1, 15, 4), [nn]);
///     // => 04
String nn = 'nn';

/// Outputs minute compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 4), [n]);
///     // => 4
String n = 'n';

/// Outputs second as two digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10), [ss]);
///     // => 10
///     formatDate(DateTime(1989, 02, 1, 15, 40, 5), [ss]);
///     // => 05
String ss = 'ss';

/// Outputs second compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 5), [s]);
///     // => 5
String s = 's';

/// Outputs millisecond as three digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 999), [SSS]);
///     // => 999
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 99), [SS]);
///     // => 099
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0), [SS]);
///     // => 009
String SSS = 'SSS';

/// Outputs millisecond compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 999), [SSS]);
///     // => 999
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 99), [SS]);
///     // => 99
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 9), [SS]);
///     // => 9
String S = 'S';

/// Outputs microsecond as three digits
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 999), [uuu]);
///     // => 999
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 99), [uuu]);
///     // => 099
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 9), [uuu]);
///     // => 009
String uuu = 'uuu';

/// Outputs millisecond compactly
///
/// Example:
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 999), [u]);
///     // => 999
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 99), [u]);
///     // => 99
///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0, 9), [u]);
///     // => 9
String u = 'u';
String MMM = 'MMM';

/// Outputs if hour is AM or PM
///
/// Example:
///     print(formatDate(DateTime(1989, 02, 1, 5), [am]));
///     // => AM
///     print(formatDate(DateTime(1989, 02, 1, 15), [am]));
///     // => PM
String am = 'am';

/// Outputs timezone as time offset
///
/// Example:
///
String z = 'z';
String Z = 'Z';

String formatDate(DateTime date, List<String> formats) {
  final sb = StringBuffer();

  for (String format in formats) {
    if (format == yyyy) {
      sb.write(_digits(date.year, 4));
    } else if (format == yy) {
      sb.write(_digits(date.year % 100, 2));
    } else if (format == mm) {
      sb.write(_digits(date.month, 2));
    } else if (format == m) {
      sb.write(date.month);
    } else if (format == MM) {
      sb.write(monthLong[date.month - 1]);
    } else if (format == M) {
      sb.write(monthShort[date.month - 1]);
    } else if (format == MMM) {
      sb.write(monthCAP[date.month - 1]);
    } else if (format == dd) {
      sb.write(_digits(date.day, 2));
    } else if (format == d) {
      sb.write(date.day);
    } else if (format == w) {
      sb.write((date.day + 7) ~/ 7);
    } else if (format == W) {
      sb.write((dayInYear(date) + 7) ~/ 7);
    } else if (format == ww) {
      sb.write(_digits((dayInYear(date) + 7) ~/ 7, 2));
    } else if (format == DD) {
      sb.write(dayLong[date.weekday - 1]);
    } else if (format == D) {
      sb.write(dayShort[date.weekday - 1]);
    } else if (format == HH) {
      sb.write(_digits(date.hour, 2));
    } else if (format == H) {
      sb.write(date.hour);
    } else if (format == hh) {
      int hour = date.hour % 12;
      if (hour == 0) hour = 12;
      sb.write(_digits(hour, 2));
    } else if (format == h) {
      int hour = date.hour % 12;
      if (hour == 0) hour = 12;
      sb.write(hour);
    } else if (format == am) {
      sb.write(date.hour < 12 ? 'AM' : 'PM');
    } else if (format == nn) {
      sb.write(_digits(date.minute, 2));
    } else if (format == n) {
      sb.write(date.minute);
    } else if (format == ss) {
      sb.write(_digits(date.second, 2));
    } else if (format == s) {
      sb.write(date.second);
    } else if (format == SSS) {
      sb.write(_digits(date.millisecond, 3));
    } else if (format == S) {
      sb.write(date.second);
    } else if (format == uuu) {
      sb.write(_digits(date.microsecond, 2));
    } else if (format == u) {
      sb.write(date.microsecond);
    } else if (format == z) {
      if (date.timeZoneOffset.inMinutes == 0) {
        sb.write('Z');
      } else {
        if (date.timeZoneOffset.isNegative) {
          sb.write('-');
          sb.write(_digits((-date.timeZoneOffset.inHours) % 24, 2));
          sb.write(_digits((-date.timeZoneOffset.inMinutes) % 60, 2));
        } else {
          sb.write('+');
          sb.write(_digits(date.timeZoneOffset.inHours % 24, 2));
          sb.write(_digits(date.timeZoneOffset.inMinutes % 60, 2));
        }
      }
    } else if (format == Z) {
      sb.write(date.timeZoneName);
    } else {
      sb.write(format);
    }
  }

  return sb.toString();
}

String _digits(int value, int length) {
  String ret = '$value';
  if (ret.length < length) {
    ret = '0' * (length - ret.length) + ret;
  }
  return ret;
}

List<String> monthShort = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

List<String> monthCAP = <String>['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];

List<String> monthLong = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<String> dayShort = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

List<String> dayLong = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

int dayInYear(DateTime date) => date.difference(DateTime(date.year, 1, 1)).inDays;
