import 'dart:io';

// Define an interface
abstract class Printable {
  void printInfo();
}

// Define a base class with inheritance
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name is eating.');
  }
}

// Define a subclass that overrides a method
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void eat() {
    print('$name the $breed is eating.');
  }

  @override
  void printInfo() {
    print('$name is a $breed and is $age years old.');
  }
}

// Define a method to read data from a file and initialize an instance of Dog
Dog initializeDogFromFile(String filename) {
  final file = File(filename);
  final lines = file.readAsLinesSync();
  final dogData = lines[0].split(',');
  return Dog(dogData[0], int.parse(dogData[1]), dogData[2]);
}

void main() {
  // Demonstrate the use of a loop
  for (int i = 0; i < 3; i++) {
    stdout.write("Enter dog's name, age, and breed (comma-separated): ");
    String input = stdin.readLineSync()!;
    List<String> data = input.split(',');
    Dog dog = Dog(data[0], int.parse(data[1]), data[2]);
    dog.eat();
    dog.printInfo();
  }

  // Initialize a dog from a file
  Dog dogFromFile = initializeDogFromFile('dog_data.txt');
  dogFromFile.eat();
  dogFromFile.printInfo();
}
