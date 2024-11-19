// 
import 'dart:io';
// import 'package:intl/intl.dart';

// String manipulation
String capitalizeEachWord(String fullName) {
  if (fullName.isEmpty) {
    return 'No information inputed';
  } else {
    return fullName
        .split(' ')
        .map((names) =>
            names[0].toUpperCase() + names.substring(1).toLowerCase())
        .join(' ');
  }
}
// Collections
void main() async {
  List<dynamic> keys = ['First Name', 'Middle Name', 'Last Name', 'Age'];

  Map<dynamic, dynamic> profile = {};

  for (var key in keys) {
    stdout.write('Enter your $key: ');
    dynamic value = stdin.readLineSync();

    if (value != null && value.isNotEmpty) {
      if (key != 'Age') {
        value = capitalizeEachWord(value);
      }
      profile[key] = value;
    } else {
      print('No value entered for your $key.');
    }
  }
  String output1 = ('Profile: $profile');
  print(output1);

  final profileInformation = profile['First Name'] +
      ' ' +
      profile['Middle Name'] +
      ' ' +
      profile['Last Name'];

  String output2 =
      ("Your Full name is $profileInformation and your age is ${profile['Age']}");
  print(output2);

// Date and Time
  DateTime now = DateTime.now();
  String output3 = ('The date and time of profile entries is: $now');
  print(output3);

// File Handling
  File file = File('output.txt');
  await file.writeAsString(output1 + '\n', mode: FileMode.append);
  await file.writeAsString(output2 + '\n', mode: FileMode.append);
  await file.writeAsString(output3 + '\n', mode: FileMode.append);

  print('\nProfile data have been saved succesfuly to output.txt');
}
