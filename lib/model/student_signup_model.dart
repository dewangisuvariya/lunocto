import 'dart:io';

class Student {
  int? id;
  final String studentName;
  final String firstName;
  final String surname;
  final String dateOfBirth;
  final String uniqueId;
  final String password;
  final String pin;
  final String email;
  final File? studentImage;
  final String emergencyContact;
  final String relationship;
  final String provider;
  final String passwordConfirmation;

  Student({
    this.id,
    required this.studentName,
    required this.firstName,
    required this.surname,
    required this.dateOfBirth,
    required this.uniqueId,
    required this.password,
    required this.pin,
    required this.email,
     this.studentImage,
    required this.emergencyContact,
    required this.relationship,
    required this.provider,
    required this.passwordConfirmation,
  });

  Map<String, String> toJson() => {
      //"id":id,
      "student_name": studentName,
      "first_name": firstName,
      "surname": surname,
      "date_of_birth": dateOfBirth,
      "unique_ID": uniqueId,
      "password": password,
      "pin": pin,
      "email": email,
      //"student_image": studentImage,
      "emergency_contact": emergencyContact,
      "relationship_to_this_person": relationship,
      "name_of_provider": provider,
      "password_confirmation": passwordConfirmation,
    };
}

