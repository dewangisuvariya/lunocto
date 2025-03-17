
class LoginModel {
  int? id;
  String? studentImage;
  String? studentName;
  String? firstName;
  String? surname;
  String? dateOfBirth;
  String? uniqueID;
  String? password;
  String? verificationCode;
  String? pin;
  String? email;
  String? emergencyContact;
  String? telephone;
  String? shareEntriesToAdmin;
  String? messageFromAdminEmail;
  String? messageFromAdminText;
  String? remindMeDailyEmail;
  String? remindMeDailyText;
  String? forTheJournalEmail;
  String? forTheJournalText;
  String? remindYourselfEmail;
  String? remindYourselfText;
  String? dailyPractisesEmail;
  String? dailyPractisesText;
  String? yourPrioritiesEmail;
  String? yourPrioritiesText;
  String? phoneNumber;
  String? pushNotification;
  String? relationshipToThisPerson;
  String? nameOfProvider;
  String? createdAt;
  String? updatedAt;
   String? passwordConfirmation;

  LoginModel({
     this.id,
    this.studentImage,
    this.studentName,
     this.firstName,
     this.surname,
     this.dateOfBirth,
     this.uniqueID,
     this.password,
    this.verificationCode,
     this.pin,
     this.email,
     this.emergencyContact,
    this.telephone,
    this.shareEntriesToAdmin,
    this.messageFromAdminEmail,
    this.messageFromAdminText,
    this.remindMeDailyEmail,
    this.remindMeDailyText,
    this.forTheJournalEmail,
    this.forTheJournalText,
    this.remindYourselfEmail,
    this.remindYourselfText,
    this.dailyPractisesEmail,
    this.dailyPractisesText,
    this.yourPrioritiesEmail,
    this.yourPrioritiesText,
    this.phoneNumber,
    this.pushNotification,
     this.relationshipToThisPerson,
     this.nameOfProvider,
     this.createdAt,
     this.updatedAt,
    this.passwordConfirmation,
  });


  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      studentImage: json['student_image'],
      studentName: json['student_name'],
      firstName: json['first_name'],
      surname: json['surname'],
      dateOfBirth: json['date_of_birth'],
      uniqueID: json['unique_ID'],
      password: json['password'],
      verificationCode: json['verification_code'],
      pin: json['pin'],
      email: json['email'],
      emergencyContact: json['emergency_contact'],
      telephone: json['telephone'],
      shareEntriesToAdmin: json['share_entries_to_admin'],
      messageFromAdminEmail: json['message_from_admin_email'],
      messageFromAdminText: json['message_from_admin_text'],
      remindMeDailyEmail: json['remind_me_daily_email'],
      remindMeDailyText: json['remind_me_daily_text'],
      forTheJournalEmail: json['for_the_journal_email'],
      forTheJournalText: json['for_the_journal_text'],
      remindYourselfEmail: json['remind_yourself_email'],
      remindYourselfText: json['remind_yourself_text'],
      dailyPractisesEmail: json['daily_practises_email'],
      dailyPractisesText: json['daily_practises_text'],
      yourPrioritiesEmail: json['your_priorities_email'],
      yourPrioritiesText: json['your_priorities_text'],
      phoneNumber: json['phone_number'],
      pushNotification: json['push_notification'],
      relationshipToThisPerson: json['relationship_to_this_person'],
      nameOfProvider: json['name_of_provider'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      passwordConfirmation:json["password_confirmation"],
    );
  }

  // Method to convert StudentModel object into JSON format
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "student_image": studentImage,
      "student_name": studentName,
      "first_name": firstName,
      "surname": surname,
      "date_of_birth": dateOfBirth,
      "unique_ID": uniqueID,
      "password": password,
      "verification_code": verificationCode,
      "pin": pin,
      "email": email,
      "emergency_contact": emergencyContact,
      "telephone": telephone,
      "share_entries_to_admin": shareEntriesToAdmin,
      "message_from_admin_email": messageFromAdminEmail,
      "message_from_admin_text": messageFromAdminText,
      "remind_me_daily_email": remindMeDailyEmail,
      "remind_me_daily_text": remindMeDailyText,
      "for_the_journal_email": forTheJournalEmail,
      "for_the_journal_text": forTheJournalText,
      "remind_yourself_email": remindYourselfEmail,
      "remind_yourself_text": remindYourselfText,
      "daily_practises_email": dailyPractisesEmail,
      "daily_practises_text": dailyPractisesText,
      "your_priorities_email": yourPrioritiesEmail,
      "your_priorities_text": yourPrioritiesText,
      "phone_number": phoneNumber,
      "push_notification": pushNotification,
      "relationship_to_this_person": relationshipToThisPerson,
      "name_of_provider": nameOfProvider,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "password_confirmation": passwordConfirmation,
    };
  }
}

