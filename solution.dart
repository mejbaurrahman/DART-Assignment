import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  stdout.write("Enter A Student Details: ");
  while (true) {
    stdout.write("Enter Student id: ");
    int id = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Student name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter Student marks: ");
    double marks = double.parse(stdin.readLineSync()!);

    if (students.isEmpty) {
      students.add({'id': id, 'name': name, 'marks': marks});
    } else {
      bool exists = false;
      for (var student in students) {
        if (student['id'] == id) {
          exists = true;
          break;
        }
      }
      if (exists) {
        print("Student with ID $id already exists. Please enter a unique ID.");
        continue;
      } else {
        students.add({'id': id, 'name': name, 'marks': marks});
      }
    }
    stdout.write("Do you want to add another student? (y / n): ");
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice != 'y') {
      break;
    }
  }

  students.forEach((student) {
    print(
        "ID: ${student['id']}, Name: ${student['name']}, Marks: ${student['marks']}");
  });
}
