class Student {
  int? id;
  final String image;
  final String name;
  final String emailID;
  final String subject;
  final String cgpa;
  final String phoneNumber;

  Student({
    required this.image,
    required this.name,
    required this.emailID,
    required this.subject,
    required this.cgpa,
    required this.phoneNumber,
    this.id,
  });

  // Factory constructor to create a Student from a map
  factory Student.fromMap(Map<String, Object?> map) {
    return Student(
      id: map['id'] as int?,
      name: map['name'] as String,
      emailID: map['emailID'] as String,
      subject: map['subject'] as String,
      cgpa: map['cgpa'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as String,
    );
  }

  // Optional: Convert Student back to map (useful for SQLite)
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'emailID': emailID,
      'subject': subject,
      'cgpa': cgpa,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }
}
