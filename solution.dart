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

  List<Map<String, dynamic>> updatedStudents = [];
  print("Grading Details of the Students: ");

  students.forEach((student) {
    double s = student['score'];
    switch (s) {
      case >= 80:
        student = {...student, 'Grade': 'A+'};
        updatedStudents.add(student);
        print(student);
        break;
      case >= 70:
        student = {...student, 'Grade': 'A'};
        updatedStudents.add(student);
        print(student);
        break;
      case >= 60:
        student = {...student, 'Grade': 'A-'};
        updatedStudents.add(student);
        print(student);
        break;
      case >= 50:
        student = {...student, 'Grade': 'B'};
        updatedStudents.add(student);
        print(student);
        break;
      case >= 40:
        student = {...student, 'Grade': 'c'};
        updatedStudents.add(student);
        print(student);
        break;
      case >= 33:
        student = {...student, 'Grade': 'D'};
        updatedStudents.add(student);
        print(student);
        break;
      default:
        student = {...student, 'Grade': 'F'};
        updatedStudents.add(student);
        print(student);
    }
  });

  List<Map<String, dynamic>> sortedStudents = [...updatedStudents];
  sortedStudents.sort((a, b) => b['score'].compareTo(a['score']));

  print("Sorted Student Details by score (Descending):");
  sortedStudents.forEach((student) {
    print(student);
  });

  print("Total number of students: ${students.length}");

  print("Highest score student details:");
  Map<String, dynamic> highestScoreStudent = sortedStudents.first;
  print(highestScoreStudent);

  print("Lowest score student details:");
  Map<String, dynamic> lowestScoreStudent = sortedStudents.last;
  print(lowestScoreStudent);
  ;
}
