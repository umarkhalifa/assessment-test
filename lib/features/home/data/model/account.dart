class Account {
  final String? accountNumber;
  final String? accountName;
  final int? bankId;

  Account({this.accountNumber, this.accountName, this.bankId});

  Map<String, dynamic> toMap() {
    return {
      'accountNumber': accountNumber,
      'accountName': accountName,
      'bankId': bankId,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountNumber: map['account_number'] as String,
      accountName: map['account_name'] as String,
      bankId: map['bank_id'] as int,
    );
  }
}
