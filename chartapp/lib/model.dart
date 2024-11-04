class Company {
  final String company;
  final String type;

  Company({required this.company, required this.type});

  // Factory constructor to create a Company from a map
  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      company: map['company'] as String,
      type: map['type'] as String,
    );
  }

  // Method to convert Company instance to map, if needed
  Map<String, dynamic> toMap() {
    return {
      'company': company,
      'type': type,
    };
  }
}
    