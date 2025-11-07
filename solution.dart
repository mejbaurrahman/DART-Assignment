import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  print("Enter A Student Details");

  while (true) {
    stdout.write("Enter Student ID(number): ");
    int ID = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Student name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter Student score: ");
    double score = double.parse(stdin.readLineSync()!);

    if (students.isEmpty) {
      students.add({'ID': ID, 'name': name, 'score': score});
    } else {
      bool exists = false;
      for (var student in students) {
        if (student['ID'] == ID) {
          exists = true;
          break;
        }
      }
      if (exists) {
        print("Student with ID $ID already exists. Please enter a unique ID.");
        continue;
      } else {
        students.add({'ID': ID, 'name': name, 'score': score});
      }
    }
    stdout.write("Do you want to add another student? (y / n): ");
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice != 'y') {
      break;
    }
  }

  print("Grading Details of the Students: ");

  students.forEach((student) {
    double s = student['score'];
    switch (s) {
      case >= 80:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: A+");
        break;
      case >= 70:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: A");
        break;
      case >= 60:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: A-");
        break;
      case >= 50:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: B");
        break;
      case >= 40:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: C");
        break;
      case >= 33:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: D");
        break;
      default:
        print(
            "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}, Grade: F");
    }
  });
  List<Map<String, dynamic>> sortedStudents = [...students];
  sortedStudents.sort((a, b) => b['score'].compareTo(a['score']));

  print("Sorted Student Details by score (Descending):");
  sortedStudents.forEach((student) {
    print(
        "ID: ${student['ID']}, Name: ${student['name']}, score: ${student['score']}");
  });

  print("Total number of students: ${students.length}");

  print("Highest score student details:");
  Map<String, dynamic> highestScoreStudent = sortedStudents.first;
  print(
      "ID: ${highestScoreStudent['ID']}, Name: ${highestScoreStudent['name']}, score: ${highestScoreStudent['score']}");

  print("Lowest score student details:");
  Map<String, dynamic> lowestScoreStudent = sortedStudents.last;
  print(
      "ID: ${lowestScoreStudent['ID']}, Name: ${lowestScoreStudent['name']}, score: ${lowestScoreStudent['score']}");
}
