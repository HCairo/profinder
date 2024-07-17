class Pros {
  final int id;
  final String lastname;
  final String firstname;
  final String specialty;

  Pros({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.specialty,
  });

  factory Pros.fromJson(Map<String, dynamic> json) {
    return Pros(
      id: json['id'],
      lastname: json['lastname'],
      firstname: json['firstname'],
      specialty: json['specialty'],
    );
  }
}
