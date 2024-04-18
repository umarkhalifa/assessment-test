class Bank {
  final int? id;
  final String? name;
  final String? code;

  Bank({this.id, this.name, this.code});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }
}
