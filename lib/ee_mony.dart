class EMoney {
  final String name;
  final String amount;
  final String date;
  final String description;

  EMoney({
    required this.name,
    required this.amount,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'date': date,
      'description': description,
    };
  }

  factory EMoney.fromJson(Map<String, dynamic> json) {
    return EMoney(
      name: json['name'],
      amount: json['amount'],
      date: json['date'],
      description: json['description'],
    );
  }
}
